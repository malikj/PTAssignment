//
//  interactor.h
//  PTAssignment
//
//  Created by Jagirdar Malik on 3/17/15.
//  Copyright (c) 2015 Jagirdar Malik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PTInteractorIO.h"
#import "PTManager.h"

@class PTAddressBookManager;

@interface PTInteractor : NSObject <requestProtocol>

@property (nonatomic, weak) id <responseProtocol> presenter;

- (instancetype)initWithManager:(id<PTManager>)manager;

@end
