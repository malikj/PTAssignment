//
//  PTViewControllersRouter.m
//  PTAssignment
//
//  Created by Jagirdar Malik on 3/17/15.
//  Copyright (c) 2015 Jagirdar Malik. All rights reserved.
//

#import "PTViewControllersRouter.h"
#import "PTBirthdayListViewController.h"
#import "PTPresenter.h"
#import "PTInteractor.h" 
#import "PTAddressBookManager.h"

@interface PTViewControllersRouter ()

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) NSMutableArray *navigations;
@property (nonatomic, strong) UINavigationController *activeNavigation;
@property (nonatomic, strong) id<PTManager>     helperManager;

@end

@implementation PTViewControllersRouter

- (instancetype)initWithWindow:(UIWindow*)window  {
    self = [super init];
    if (self) {
        _window = window;
        _navigations = [NSMutableArray array];
        [self setupAddressBookManager];
    }
   return self;
}

- (void)setupAddressBookManager {
    self.helperManager = [[PTAddressBookManager alloc] init];
}

- (void)showBirthdayListView {
    [self setRootViewController:[self birthdayListView]];
}

#pragma mark - Birthday List View Setup

- (UIViewController *)birthdayListView {
    PTBirthdayListViewController *view = [[PTBirthdayListViewController alloc] initWithStyle:UITableViewStylePlain];
    PTPresenter *presenter = [[PTPresenter alloc] initWithRouter:self];
    PTInteractor *interactor = [[PTInteractor alloc] initWithManager:self.helperManager];
    view.presenter = presenter;
    presenter.view = view;
    presenter.interactor = interactor;
    interactor.presenter = presenter;
    return view;
}

#pragma mark - rootViewController Setup

- (void)setRootViewController:(UIViewController *)controller {
    [self adNavigationControllersToArray:[self createNavigationViewControllerForRootViewController:controller]];
    self.window.rootViewController = self.activeNavigation;
}

- (void)adNavigationControllersToArray:(UINavigationController *)navigationController {
    [self.navigations addObject:navigationController];
}

- (UINavigationController *)activeNavigation {
    return [self.navigations lastObject];
}

- (UINavigationController *)createNavigationViewControllerForRootViewController:(UIViewController *)controller {
    UINavigationController *navigationViewController = [[UINavigationController alloc] initWithRootViewController:controller];
    navigationViewController.navigationBar.barStyle = UIBarStyleBlackOpaque;
    return navigationViewController;
}

@end
