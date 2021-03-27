//
//  DetailCollectionViewCell.h
//  StarWars_Mission_Objective-C
//
//  Created by Kerry Ferguson on 3/25/21.
//

#import <UIKit/UIKit.h>
#import "Mission.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailCollectionViewCell : UICollectionViewCell

@property (strong,nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UILabel *title;
@property (strong, nonatomic) UILabel *date;
@property (strong, nonatomic) UILabel *location;
@property (strong, nonatomic) UILabel *missionDescription;

-(void)configure:(Mission *) item;

@end

NS_ASSUME_NONNULL_END
