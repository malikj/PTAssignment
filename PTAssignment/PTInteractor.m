//
//  interactor.m
//  PTAssignment
//
//  Created by Jagirdar Malik on 3/17/15.
//  Copyright (c) 2015 Jagirdar Malik. All rights reserved.
//

#import "PTInteractor.h"
#import "PTContact.h"
#import <AddressBook/AddressBook.h>

@interface PTInteractor ()

@property (nonatomic, strong)  id<PTManager>   manager;

@end

@implementation PTInteractor

- (instancetype)initWithManager:(id<PTManager>)manager {
    self = [super init];
    if (self) {
        _manager =  manager;
    }
    return self;
}

- (void)readListOfContactsFromAddressBook {
    __weak typeof(self) welf = self;
    [self.manager readContactsFromAddressBookWithSuccessBlock:^(CFArrayRef contactsArray) {
        [welf sendContactsArrayWithContactModelObjects:contactsArray];
    } withFailure:^(PTAuthorizationStatusType accessType) {
        [welf sendAuthorizationStatus:accessType];
    }];
}

- (NSArray *)contactModelArray:(CFArrayRef )contactArray {
    CFIndex count = CFArrayGetCount(contactArray);
    NSArray *contactmodelArray = [[NSArray alloc] init];
    NSMutableArray * contactsInfo = [[NSMutableArray alloc] initWithCapacity:count];
    for (int i = 0; i < count; i ++ ) {
        ABRecordRef person = CFArrayGetValueAtIndex(contactArray, i);
        PTContact *contact = [self createContactModelObjectWithABRecord:person];
        [contactsInfo addObject:contact];
    }
    contactmodelArray = contactsInfo;
    return contactmodelArray;
}

- (PTContact *)createContactModelObjectWithABRecord:(ABRecordRef )abRecord {
    PTContact * contact = [[PTContact alloc] init];
    ABRecordRef person = abRecord;
    if (ABRecordCopyValue(person, kABPersonFirstNameProperty)) {
        NSString *validateName = [self validateName:(__bridge NSString *)(ABRecordCopyValue(person, kABPersonFirstNameProperty))];
        contact.name = validateName;
    }
    if (ABRecordCopyValue(person, kABPersonBirthdayProperty)) {
        contact.birthdayDate = (__bridge NSDate *)ABRecordCopyValue(person, kABPersonBirthdayProperty);
    }
    return contact;
}

- (NSDate *)validateBirthday:(NSDate *)birthdayDate {
    if (birthdayDate == nil) {
        return nil;
    }
    else {
        return birthdayDate;
    }
}

- (NSString *)validateName:(NSString *)text {
    if([text isEqual:[NSNull null]]||text==nil||text==NULL)
        return @"";
    else
        return text;
}

- (void)sendContactsArrayWithContactModelObjects:(CFArrayRef)contactsArray {
    NSArray *arrayOfContacts = [self contactModelArray:contactsArray];
    [self.presenter contactsAcccessDidSucceedWithContactsArray:arrayOfContacts];
}

- (void)sendAuthorizationStatus:(PTAuthorizationStatusType)type {
    if (type == PTAuthorizationStatusNotDetermined) {
        [self.presenter contactsAcccessDidFailure:@"Could not find contacts"];
    }
    else if (type == PTBAuthorizationStatusDenied || type == PTAuthorizationStatusRestricted ) {
        [self.presenter contactsAcccessDidFailure:@"Permission was not granted for Contacts."];
    }
}

@end
