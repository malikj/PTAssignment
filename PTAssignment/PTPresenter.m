//
//  PTPresenter.m
//  PTAssignment
//
//  Created by Jagirdar Malik on 3/17/15.
//  Copyright (c) 2015 Jagirdar Malik. All rights reserved.
//

#import "PTPresenter.h"
#import "PTRouter.h"

@interface PTPresenter ()

@property (nonatomic, strong)id<RouterProtocol> router;

@end

@implementation PTPresenter

- (instancetype)initWithRouter:(id<RouterProtocol>)router {
    self = [super init];
    if (self) {
        _router = router;
    }
    return self;
}

- (void)readListOfContacts  {
    [self.interactor readListOfContactsFromAddressBook];
}

#pragma arguments

- (void)contactsAcccessDidSucceedWithContactsArray:(NSArray *)contactsArray {
    [self.view showContacts:contactsArray];
}

- (void)contactsAcccessDidFailure:(NSString*)errorMessage {
    [self.view showError:errorMessage];
}

@end
