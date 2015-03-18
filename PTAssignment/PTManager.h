//
//  PTHelper.h
//  PTAssignment
//
//  Created by Jagirdar Malik on 3/17/15.
//  Copyright (c) 2015 Jagirdar Malik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PTAddressBookAccessType.h"

typedef void(^AddressBookAccesCompletionBlock)(PTAuthorizationStatusType accessType);

@protocol PTManager <NSObject>

- (void )readContactsFromAddressBookWithSuccessBlock:(void (^)(CFArrayRef contactsArray))success
                                         withFailure:(AddressBookAccesCompletionBlock)failure;

@end