//
//  ViewController.h
//  StarWars_Mission_Objective-C
//
//  Created by Kerry Ferguson on 3/24/21.
//

#import <UIKit/UIKit.h>

//@interface ViewController : UITableViewController

@interface ViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *collectionView;
}

@end
