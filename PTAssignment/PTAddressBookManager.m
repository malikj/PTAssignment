//
//  PTAddressBookHelper.m
//  PTAssignment
//
//  Created by Jagirdar Malik on 3/17/15.
//  Copyright (c) 2015 Jagirdar Malik. All rights reserved.
//

#import "PTAddressBookManager.h"
#import <AddressBook/AddressBook.h>
#import <Foundation/Foundation.h>


@interface PTAddressBookManager ()

@property (nonatomic, assign) ABAddressBookRef addressBook;

@end


@implementation PTAddressBookManager

- (instancetype)init {
    if (self) {
        _addressBook = ABAddressBookCreateWithOptions(nil, NULL);
    }
    return self;
}

- (void)readContactsFromAddressBookWithSuccessBlock:(void (^)(CFArrayRef contactsArray))success
                                        withFailure:(AddressBookAccesCompletionBlock)failure {
    switch (ABAddressBookGetAuthorizationStatus()) {
        case  kABAuthorizationStatusAuthorized:
            [self getContactsFromAddressBookWithSuccessBlock:success withFailure:failure];
            break;
        case  kABAuthorizationStatusNotDetermined :
            [self requestAddressBookAccess:success withFailure:failure];
            break;
        case  kABAuthorizationStatusDenied:
        case  kABAuthorizationStatusRestricted:
        {
            if (failure) {
                failure(PTBAuthorizationStatusDenied);
            }
        }
            break;
        default:
            break;
    }
}

- (void)getContactsFromAddressBookWithSuccessBlock:(void (^)(CFArrayRef contactsArray))success
                                       withFailure:(AddressBookAccesCompletionBlock)failure {
    CFErrorRef * err = nil;
    if (self.addressBook == nil) {
        self.addressBook = ABAddressBookCreateWithOptions(nil, err);
    }
    CFArrayRef allPeople = ABAddressBookCopyArrayOfAllPeople(self.addressBook);
        if (success) {
            success(allPeople);
        }
    else {
        if (failure) {
            failure(PTAuthorizationStatusNotDetermined);
        }
    }
}

- (void)requestAddressBookAccess:(void (^) (CFArrayRef contactsArray))success
                     withFailure:(AddressBookAccesCompletionBlock)failure {
    __weak typeof(self) welf = self;
    ABAddressBookRequestAccessWithCompletion(self.addressBook, ^(bool granted, CFErrorRef error){
        if (granted == YES){
            [welf getContactsFromAddressBookWithSuccessBlock:success withFailure:failure];
        }
        else {
            if (failure) {
                failure(PTBAuthorizationStatusDenied);
            }
        }
    });
}

@end