//
//  DetailCollectionViewCell.h
//  StarWars_Mission_Objective-C
//
//  Created by Kerry Ferguson on 3/25/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailCollectionViewCell : UICollectionViewCell

@property (strong,nonatomic) UIImageView *image;
@property (strong, nonatomic) UILabel *title;
@property (strong, nonatomic) UILabel *date;
@property (strong, nonatomic) UILabel *location;
@property (strong, nonatomic) UILabel *missionDescription;

@end

NS_ASSUME_NONNULL_END
