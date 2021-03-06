//
//  HomeCollectionViewCell.m
//  StarWars_Mission_Objective-C
//
//  Created by Kerry Ferguson on 3/25/21.
//

#import "HomeCollectionViewCell.h"
#import "Mission.h"
#import <SDWebImage/SDWebImage.h>

@interface HomeCollectionViewCell (MyPrivateMethods)

@end

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

-(void)configure:(Mission *) item {
        
    if ([item.image isEqual: [NSNull null]]) {
        _imageView.image = [UIImage imageNamed:@"Empire"];
    } else {
        [_imageView sd_setImageWithURL:[NSURL URLWithString:item.image]
                     placeholderImage:[UIImage imageNamed:@"Empire"]];
    }
   
    _date.text = item.date;
    _title.text = item.title;
    _location.text = item.locationline1;
    _missionDescription.text = item.missionDescription;
}

-(void)setup {
    
    _imageView = [UIImageView new];
    [self addSubview:_imageView];
//    _imageView = [[UIImageView alloc] initWithFrame:(CGRectInset(self.bounds, IMAGEVIEW_BORDER_LENGTH, IMAGEVIEW_BORDER_LENGTH))];
    _imageView.translatesAutoresizingMaskIntoConstraints = NO;
    _imageView.layer.cornerRadius = 12;
    _imageView.clipsToBounds = YES;
    [_imageView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor].active = YES;
    [_imageView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor].active = YES;
    [_imageView.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor].active = YES;
    [_imageView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor].active = YES;
    
    _transparentView = [UIView new];
    [self addSubview:_transparentView];
    _transparentView.layer.cornerRadius = 12;
    _transparentView.clipsToBounds = YES;
    [_transparentView setBackgroundColor:[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.4]];
    _transparentView.translatesAutoresizingMaskIntoConstraints = NO;
    [_transparentView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor].active = YES;
    [_transparentView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor].active = YES;
    [_transparentView.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor].active = YES;
    [_transparentView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor].active = YES;
    
    _date = [UILabel new];
    [self addSubview:_date];
    _date.translatesAutoresizingMaskIntoConstraints = NO;
    _date.textColor = UIColor.whiteColor;
    [_date.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:20.0].active = YES;
    [_date.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:20.0].active = YES;
    [_date.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-20.0].active = YES;
    
    _title = [UILabel new];
    [self addSubview:_title];
    _title.translatesAutoresizingMaskIntoConstraints = NO;
    _title.textColor = UIColor.whiteColor;
    _title.numberOfLines = 2;
    _title.font = [UIFont boldSystemFontOfSize:24.0f];
    [_title.topAnchor constraintEqualToAnchor:self.date.bottomAnchor constant:20.0].active = YES;
    [_title.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:20.0].active = YES;
    [_title.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-20.0].active = YES;
    
    _location = [UILabel new];
    [self addSubview:_location];
    _location.translatesAutoresizingMaskIntoConstraints = NO;
    _location.textColor = UIColor.whiteColor;
//    [_location.topAnchor constraintEqualToAnchor:self.title.bottomAnchor constant:24.0].active = YES;
    [_location.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:20.0].active = YES;
    [_location.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-20.0].active = YES;

    _missionDescription = [UILabel new];
    _missionDescription.numberOfLines = 2;
    [self addSubview:_missionDescription];
    _missionDescription.translatesAutoresizingMaskIntoConstraints = NO;
    _missionDescription.textColor = UIColor.whiteColor;
//    [_missionDescription.topAnchor constraintEqualToAnchor:self.location.bottomAnchor constant:14.0].active = YES;
    [_missionDescription.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:20.0].active = YES;
    [_missionDescription.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-20.0].active = YES;
    [_missionDescription.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-20.0].active = YES;

    [_location.bottomAnchor constraintEqualToAnchor:self.missionDescription.topAnchor constant:-10.0].active = YES;

    

}

@end
