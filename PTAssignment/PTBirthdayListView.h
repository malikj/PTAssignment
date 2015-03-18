//
//  PTBirthdayListView.h
//  PTAssignment
//
//  Created by Jagirdar Malik on 3/17/15.
//  Copyright (c) 2015 Jagirdar Malik. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BirthdayListView <NSObject>

- (void)showContacts:(NSArray *)contacts;

- (void)showError:(NSString *)errorMessage;

@end
