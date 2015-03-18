//
//  PTBirthdayListViewController.m
//  PTAssignment
//
//  Created by Jagirdar Malik on 3/17/15.
//  Copyright (c) 2015 Jagirdar Malik. All rights reserved.
//

#import "PTBirthdayListViewController.h"
#import "PTContactCell.h"

static CGFloat kTableViewCellHeight= 60;
static CGFloat kActivityIndicatorViewHeight = 30;
static CGFloat kActivityIndicatorViewWidth= 30;
static NSString *KPTContactCellIdentifier = @"PTContactCell";

@interface PTBirthdayListViewController () <UIAlertViewDelegate>

@property (nonatomic, strong) UIActivityIndicatorView *activityIndicatorView;
@property (nonatomic, copy) NSArray *contactListArray;

@end

@implementation PTBirthdayListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[PTContactCell class] forCellReuseIdentifier:KPTContactCellIdentifier];
    self.tableView.rowHeight = kTableViewCellHeight;
    [self showActivityIndicator];
    [self setupTitle];
    [self.presenter readListOfContacts];
}

- (void)showActivityIndicator {
    UIView *viewActivity = [[UIView alloc] initWithFrame:CGRectMake(6,310,59,32)];
    self.activityIndicatorView =[[UIActivityIndicatorView alloc] init];
    self.activityIndicatorView.frame=CGRectMake(0, 0, kActivityIndicatorViewHeight, kActivityIndicatorViewWidth);
    UIBarButtonItem *actItem = [[UIBarButtonItem alloc] initWithCustomView:viewActivity];
    [viewActivity addSubview:self.activityIndicatorView];
    self.navigationItem.rightBarButtonItem = actItem;
    [self.activityIndicatorView startAnimating];
}

- (void)setupTitle {
    self.navigationItem.title = @"Birthday List";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - UITableView datasource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contactListArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     PTContactCell *cell = [tableView dequeueReusableCellWithIdentifier:KPTContactCellIdentifier];
    [cell cellConfigurationWithContact:[self.contactListArray objectAtIndex:indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

#pragma mark -  BirthdayListView delegate methods

- (void)showContacts:(NSArray *)contacts {
    [self.activityIndicatorView stopAnimating];
    self.contactListArray = contacts;
    [self.tableView reloadData];
}

- (void)showError:(NSString *)errorMessage {
    // show Error
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:errorMessage
                                                    message:nil
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}


#pragma mark UIAlertView Delegate 

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self.activityIndicatorView stopAnimating];
}




@end
