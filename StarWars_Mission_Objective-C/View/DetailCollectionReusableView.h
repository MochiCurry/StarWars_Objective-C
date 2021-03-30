//
//  DetailCollectionReusableView.h
//  StarWars_Mission_Objective-C
//
//  Created by Kerry Ferguson on 3/27/21.
//

#import <UIKit/UIKit.h>
#import "Mission.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailCollectionReusableView : UICollectionReusableView

@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UILabel *title;
@property (strong, nonatomic) UIButton *backButton;
@property (strong, nonatomic) UIButton *shareButton;

-(void)configure:(NSString *) imageUrl;

@end

NS_ASSUME_NONNULL_END
