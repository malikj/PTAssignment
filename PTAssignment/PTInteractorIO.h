//
//  interactorIO.h
//  PTAssignment
//
//  Created by Jagirdar Malik on 3/17/15.
//  Copyright (c) 2015 Jagirdar Malik. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol requestProtocol <NSObject>

- (void)readListOfContactsFromAddressBook;

@end


@protocol responseProtocol <NSObject>

- (void)contactsAcccessDidSucceedWithContactsArray:(NSArray *)contactsArray;

- (void)contactsAcccessDidFailure:(NSString *)errorMessage;


@end