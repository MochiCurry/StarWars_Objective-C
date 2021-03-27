//
//  DetailCollectionReusableView.m
//  StarWars_Mission_Objective-C
//
//  Created by Kerry Ferguson on 3/27/21.
//

#import "DetailCollectionReusableView.h"

@implementation DetailCollectionReusableView


- (void)initialize
{
    [self setup];
}

- (void)setup {
    _title = [UILabel new];
    [self addSubview:_title];
    _title.translatesAutoresizingMaskIntoConstraints = NO;
    _title.textColor = UIColor.whiteColor;
    _title.numberOfLines = 2;
    _title.font = [UIFont boldSystemFontOfSize:24.0f];
    [_title.topAnchor constraintEqualToAnchor:self.superview.topAnchor constant:20.0].active = YES;
    [_title.leadingAnchor constraintEqualToAnchor:self.superview.leadingAnchor constant:20.0].active = YES;
    [_title.trailingAnchor constraintEqualToAnchor:self.superview.trailingAnchor constant:-20.0].active = YES;
}

@end
