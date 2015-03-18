//
//  PTBirthdayListViewController.h
//  PTAssignment
//
//  Created by Jagirdar Malik on 3/17/15.
//  Copyright (c) 2015 Jagirdar Malik. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PTPresenter.h"
#import "PTBirthdayListView.h"

@interface PTBirthdayListViewController : UITableViewController <BirthdayListView>

@property (nonatomic, strong)  PTPresenter*  presenter;

@end
