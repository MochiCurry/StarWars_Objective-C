//
//  DetailCollectionReusableView.m
//  StarWars_Mission_Objective-C
//
//  Created by Kerry Ferguson on 3/27/21.
//

#import "DetailCollectionReusableView.h"
#import <SDWebImage/SDWebImage.h>

@implementation DetailCollectionReusableView


- (void)initialize
{
    [self setup];
}

- (void)setup {
    
    
    _imageView = [UIImageView new];
    [_imageView setContentMode:UIViewContentModeScaleAspectFill];
    [_imageView setClipsToBounds:YES];
    [_imageView setAutoresizingMask:UIViewAutoresizingFlexibleHeight];
    [self addSubview:_imageView];
    [_imageView.topAnchor constraintEqualToAnchor:self.superview.topAnchor].active = YES;
    [_imageView.leadingAnchor constraintEqualToAnchor:self.superview.leadingAnchor].active = YES;
    [_imageView.trailingAnchor constraintEqualToAnchor:self.superview.trailingAnchor].active = YES;
    [_imageView.bottomAnchor constraintEqualToAnchor:self.superview.bottomAnchor].active = YES;

    
    _title = [UILabel new];
    [self addSubview:_title];
    _title.translatesAutoresizingMaskIntoConstraints = NO;
    _title.textColor = UIColor.whiteColor;
    _title.numberOfLines = 2;
    _title.font = [UIFont boldSystemFontOfSize:24.0f];
    [_title.topAnchor constraintEqualToAnchor:self.superview.topAnchor constant:20.0].active = YES;
    [_title.leadingAnchor constraintEqualToAnchor:self.superview.leadingAnchor constant:20.0].active = YES;
    [_title.trailingAnchor constraintEqualToAnchor:self.superview.trailingAnchor constant:-20.0].active = YES;
    
    _backButton = [UIButton new];
    [self addSubview:_backButton];
    _backButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    UIImage *btnImage = [UIImage systemImageNamed:@"chevron.backward.circle.fill"];
    _backButton.imageView.image = btnImage;
    [_backButton.topAnchor constraintEqualToAnchor:self.superview.topAnchor constant:20.0].active = YES;
    [_backButton.leadingAnchor constraintEqualToAnchor:self.superview.leadingAnchor constant:20.0].active = YES;
    [_backButton.trailingAnchor constraintEqualToAnchor:self.superview.trailingAnchor constant:-20.0].active = YES;

}

-(void)configure:(NSString *) imageUrl {
    
    if (imageUrl != nil) {
        [_imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl]
                     placeholderImage:[UIImage imageNamed:@"Empire"]];
    } else {
        _imageView.image = [UIImage imageNamed:@"Empire"];
    }
    
}
@end
