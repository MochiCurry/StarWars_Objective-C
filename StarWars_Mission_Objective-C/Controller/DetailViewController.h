//
//  DetailViewController.h
//  StarWars_Mission_Objective-C
//
//  Created by Kerry Ferguson on 3/25/21.
//

#import <UIKit/UIKit.h>
#import "Mission.h"

NS_ASSUME_NONNULL_BEGIN

//@interface DetailViewController : UIViewController


@interface DetailViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *collectionView;
}

@property (strong, nonatomic) Mission *mission;

@property (nonatomic, readonly) UICollectionView *collectionView;
@property (nonatomic, readonly) UICollectionReusableView *header;

@end

NS_ASSUME_NONNULL_END
