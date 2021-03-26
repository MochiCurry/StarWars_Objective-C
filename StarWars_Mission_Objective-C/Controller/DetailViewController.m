//
//  DetailViewController.m
//  StarWars_Mission_Objective-C
//
//  Created by Kerry Ferguson on 3/25/21.
//

#import "DetailViewController.h"
#import "Mission.h"
#import "DetailCollectionViewCell.h"

@interface DetailViewController ()

@property (strong, nonatomic) Mission *mission;

@end

@implementation DetailViewController

NSString *detailCellId = @"detailCellId";

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    collectionView=[[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    [collectionView setDataSource:self];
    [collectionView setDelegate:self];
    
    [collectionView registerClass:[DetailCollectionViewCell class] forCellWithReuseIdentifier:detailCellId];
    [collectionView setBackgroundColor:[UIColor blueColor]];
    
    [self.view addSubview:collectionView];

}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DetailCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:detailCellId forIndexPath:indexPath];
        
    cell.title.text = _mission.title;
    cell.date.text = _mission.date;
    cell.location.text = _mission.locationline1;
    cell.missionDescription.text = _mission.missionDescription;
    
    
    cell.image.image = [UIImage systemImageNamed:@"person"];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
}


@end
