//
//  PTPresenter.h
//  PTAssignment
//
//  Created by Jagirdar Malik on 3/17/15.
//  Copyright (c) 2015 Jagirdar Malik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PTInteractorIO.h"
#import "PTRouter.h"
#import "PTBirthdayListView.h"

@interface PTPresenter : NSObject <responseProtocol>

@property (nonatomic, strong) id <requestProtocol> interactor;
@property (nonatomic, weak) id <BirthdayListView> view;

- (instancetype)initWithRouter:(id<RouterProtocol>)router;

- (void)readListOfContacts;


@end
