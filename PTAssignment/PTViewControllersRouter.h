//
//  PTViewControllersRouter.h
//  PTAssignment
//
//  Created by Jagirdar Malik on 3/17/15.
//  Copyright (c) 2015 Jagirdar Malik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PTRouter.h"
#import <UIKit/UIKit.h>

@interface PTViewControllersRouter : NSObject <RouterProtocol>

- (instancetype)initWithWindow:(UIWindow*)window;

@end
