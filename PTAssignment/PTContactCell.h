//
//  PTContactCell.h
//  PTAssignment
//
//  Created by Jagirdar Malik on 3/17/15.
//  Copyright (c) 2015 Jagirdar Malik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PTContact.h"

@interface PTContactCell : UITableViewCell

- (void)cellConfigurationWithContact:(PTContact*)contact;

@end
