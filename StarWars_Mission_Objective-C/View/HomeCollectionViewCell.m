//
//  HomeCollectionViewCell.m
//  StarWars_Mission_Objective-C
//
//  Created by Kerry Ferguson on 3/25/21.
//

#import "HomeCollectionViewCell.h"

@implementation HomeCollectionViewCell

#define IMAGEVIEW_BORDER_LENGTH 5


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}


-(void)setup {
    
    _date = [UILabel new];
    [self addSubview:_date];
    _date.translatesAutoresizingMaskIntoConstraints = NO;
    [_date.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:20.0].active = YES;
    [_date.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:20.0].active = YES;
    [_date.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-20.0].active = YES;
    
    _title = [UILabel new];
    [self addSubview:_title];
    _title.translatesAutoresizingMaskIntoConstraints = NO;
    [_title.topAnchor constraintEqualToAnchor:self.date.bottomAnchor constant:20.0].active = YES;
    [_title.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:20.0].active = YES;
    [_title.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-20.0].active = YES;
    
    _location = [UILabel new];
    [self addSubview:_location];
    _location.translatesAutoresizingMaskIntoConstraints = NO;
    [_location.topAnchor constraintEqualToAnchor:self.title.bottomAnchor constant:20.0].active = YES;
    [_location.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:20.0].active = YES;
    [_location.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-20.0].active = YES;
    
    _missionDescription = [UILabel new];
    _missionDescription.numberOfLines = 2;
    [self addSubview:_missionDescription];
    _missionDescription.translatesAutoresizingMaskIntoConstraints = NO;
    [_missionDescription.topAnchor constraintEqualToAnchor:self.location.bottomAnchor constant:20.0].active = YES;
    [_missionDescription.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:20.0].active = YES;
    [_missionDescription.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-20.0].active = YES;
    

//    _title = [[UILabel alloc] initWithFrame:(CGRectInset(self.bounds, IMAGEVIEW_BORDER_LENGTH, IMAGEVIEW_BORDER_LENGTH))];
    
  
    
//    _date = [[UILabel alloc] initWithFrame:(CGRectInset(self.bounds, IMAGEVIEW_BORDER_LENGTH, IMAGEVIEW_BORDER_LENGTH))];
    
    [self addSubview:_image];
    _image = [[UIImageView alloc] initWithFrame:(CGRectInset(self.bounds, IMAGEVIEW_BORDER_LENGTH, IMAGEVIEW_BORDER_LENGTH))];
}

@end
