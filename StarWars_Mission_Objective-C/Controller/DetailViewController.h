//
//  DetailViewController.h
//  StarWars_Mission_Objective-C
//
//  Created by Kerry Ferguson on 3/25/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//@interface DetailViewController : UIViewController

@interface DetailViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *collectionView;
}

@end

NS_ASSUME_NONNULL_END
