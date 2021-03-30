//
//  DetailViewController.m
//  StarWars_Mission_Objective-C
//
//  Created by Kerry Ferguson on 3/25/21.
//

#import "DetailViewController.h"
#import "Mission.h"
#import "DetailCollectionViewCell.h"
#import "DetailCollectionReusableView.h"
#import "StretchyHeaderCollectionViewLayout.h"
#import <SDWebImage/SDWebImage.h>

@interface DetailViewController ()

//@property (strong, nonatomic) Mission *mission;

@end

@implementation DetailViewController

NSString *detailCellId = @"detailCellId";
NSString *headerCellId = @"headerCellId";

UICollectionViewFlowLayout *layout;

- (void)viewDidLoad {
    [super viewDidLoad];

    CGRect bounds;
    bounds = [[self view] bounds];
    
    
    ///For dynamic cell height
    layout.estimatedItemSize = CGSizeMake(bounds.size.width, 10);
    
    
    
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.navigationController.navigationBarHidden = true;
        
    UIImage* shareImage = [UIImage systemImageNamed:@"square.and.arrow.up.fill"];
    UIBarButtonItem *shareButton = [[UIBarButtonItem alloc]
                                   initWithImage:shareImage
                                   style:UIBarButtonItemStylePlain
                                   target:self
                                   action:@selector(share:)
                                    ];
//    shareButton.tintColor = [UIColor blackColor];
    self.navigationItem.rightBarButtonItem = shareButton;
    
    
    StretchyHeaderCollectionViewLayout *stretchyLayout;
    stretchyLayout = [[StretchyHeaderCollectionViewLayout alloc] init];
    [stretchyLayout setSectionInset:UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0)];
    [stretchyLayout setItemSize:CGSizeMake(300.0, 494.0)];
    [stretchyLayout setHeaderReferenceSize:CGSizeMake(320.0, 160.0)];
    
    collectionView = [[UICollectionView alloc] initWithFrame:bounds collectionViewLayout:stretchyLayout];
//    collectionView = [[UICollectionView alloc] initWithFrame:bounds collectionViewLayout:layout];

    [collectionView setBackgroundColor:[UIColor blackColor]];
    [collectionView setAlwaysBounceVertical:YES];
    [collectionView setShowsVerticalScrollIndicator:NO];
    
    
    
//    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
//    collectionView=[[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    [collectionView setDataSource:self];
    [collectionView setDelegate:self];
//    [collectionView setBackgroundColor:[UIColor blueColor]];
    
//    collectionView.translatesAutoresizingMaskIntoConstraints = false;
//    [collectionView sdc_alignEdgesWithSuperview:UIRectEdgeAll];
    
    [self.view addSubview:collectionView];
    [collectionView registerClass:[DetailCollectionViewCell class] forCellWithReuseIdentifier:detailCellId];
    [collectionView registerClass:[DetailCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerCellId];

}

- (void)share:(UIButton *)sender {
    NSLog(@"Share button tapped");
}


- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    
}

/// For dynamic cell height
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    [collectionView.collectionViewLayout invalidateLayout];
}




- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DetailCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:detailCellId forIndexPath:indexPath];
    
    [cell configure: _mission];

    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
}




















/// For Stretchy Header.
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
//    UICollectionReusableView *reusableview = nil;
//    DetailCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerCellId forIndexPath:indexPath];
//    headerView.backgroundColor = [UIColor blackColor];
//    headerView.title.text = @"ABC";
//    reusableview = headerView;
//
//    [headerView configure: _mission.image];
//
//    return reusableview;
//
    
    if (!_header) {

        _header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerCellId forIndexPath:indexPath];
        CGRect bounds;
        bounds = [_header bounds];

        UIImageView *imageView;
        imageView = [[UIImageView alloc] initWithFrame:bounds];

        if (_mission.image != nil) {
            [imageView sd_setImageWithURL:[NSURL URLWithString:_mission.image]
                         placeholderImage:[UIImage imageNamed:@"Empire"]];
        } else {
            imageView.image = [UIImage imageNamed:@"Empire"];
        }



        [imageView setContentMode:UIViewContentModeScaleAspectFill];
        [imageView setClipsToBounds:YES];
        [imageView setAutoresizingMask:UIViewAutoresizingFlexibleHeight];
        [_header addSubview:imageView];

        UIButton *backButton;
        backButton = [UIButton new];
        backButton.translatesAutoresizingMaskIntoConstraints = NO;

        UIImage *btnImage = [UIImage systemImageNamed:@"chevron.backward.circle.fill"];
        backButton.imageView.image = btnImage;
        backButton.backgroundColor = [UIColor whiteColor];
        
        CGRect buttonFrame = backButton.frame;
        buttonFrame.size = CGSizeMake(45, 45);
        backButton.frame = buttonFrame;
        
        [backButton setContentMode:UIViewContentModeScaleAspectFill];
        [backButton setClipsToBounds:YES];
        [backButton setAutoresizingMask:UIViewAutoresizingFlexibleHeight];
//        [_header addSubview:backButton];

////        [backButton.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:20.0].active = YES;
////        [backButton.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20.0].active = YES;
//
    }
    return _header;
    
}




@end
