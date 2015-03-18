//
//  PTContactCell.m
//  PTAssignment
//
//  Created by Jagirdar Malik on 3/17/15.
//  Copyright (c) 2015 Jagirdar Malik. All rights reserved.
//

#import "PTContactCell.h"

#import "PTContact.h"

@interface PTContactCell () {
    
}

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *birthdayLabel;
@property (nonatomic, strong) NSDateFormatter *formatter;

@end

@implementation PTContactCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self setupCell];
    }
    return self;
}

- (void)setupCell {
    [self setupNameLabel];
    [self setupBirthdayLabel];
}

- (void)cellConfigurationWithContact:(PTContact*)contact {
    if ([contact.name isEqualToString:@""]) {
        self.nameLabel.text = @"name not available";
    }
    else {
        self.nameLabel.text = contact.name;
    }
    if (contact.birthdayDate == nil) {
        self.birthdayLabel.text = @"Birthday date not available";
    }
    else {
        NSDateFormatter *dateformate=[self formatter];
        NSString *date = [dateformate stringFromDate:contact.birthdayDate];
        self.birthdayLabel.text = date;
    }
}

- (NSDateFormatter *)formatter {
    if (! _formatter) {
        _formatter = [[NSDateFormatter alloc] init];
        _formatter.dateFormat = @"EEEE MMM dd yyyy";
    }
    return _formatter;
}

- (void)setupNameLabel {
    
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.textColor = [UIColor grayColor];
    [self.nameLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:17]];
    self.nameLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:self.nameLabel];
    [self setupConstraintsToNameLabel];
}

- (void)setupConstraintsToNameLabel {
    [self.nameLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.nameLabel
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1
                                                      constant:10]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.nameLabel
                                                     attribute:NSLayoutAttributeLeading
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self                                                     attribute:NSLayoutAttributeLeading
                                                    multiplier:1
                                                      constant:20]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.nameLabel
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:nil
                                                     attribute:NSLayoutAttributeHeight
                                                    multiplier:0
                                                      constant:20]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.nameLabel
                                                     attribute:NSLayoutAttributeTrailing
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTrailing
                                                    multiplier:1
                                                      constant:10]];
}


- (void)setupConstraintsToBirthdayLabel {
    [self.birthdayLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.birthdayLabel
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.nameLabel
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1
                                                      constant:5]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.birthdayLabel
                                                     attribute:NSLayoutAttributeLeading
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.nameLabel
                                                     attribute:NSLayoutAttributeLeading
                                                    multiplier:1
                                                      constant:0.0f]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.birthdayLabel
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeHeight
                                                    multiplier:0
                                                      constant:25]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.birthdayLabel
                                                     attribute:NSLayoutAttributeTrailing
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTrailing
                                                    multiplier:1
                                                      constant:10]];
}

- (void)setupBirthdayLabel {
    self.birthdayLabel = [[UILabel alloc] init];
    [self.birthdayLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:18]];
    self.birthdayLabel.backgroundColor = [UIColor clearColor];
    self.birthdayLabel.textColor =[UIColor colorWithRed:53.0f/255.0f green:153.0f/255.0f blue:155.0f/255.0f alpha:1.0f];
    [self addSubview:self.birthdayLabel];
    [self setupConstraintsToBirthdayLabel];
}


@end
