//
//  ViewController.m
//  StarWars_Mission_Objective-C
//
//  Created by Kerry Ferguson on 3/24/21.
//

#import "ViewController.h"
#import "Mission.h"
#import "HomeCollectionViewCell.h"
#import "DetailViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray<Mission *> *missions;

@end

@implementation ViewController

NSString *cellId = @"cellId";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self fetchData];

    self.navigationItem.title = @"Star Wars";
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    self.navigationController.navigationBarHidden = NO;

    
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    collectionView=[[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    [collectionView setDataSource:self];
    [collectionView setDelegate:self];
    
    [collectionView registerClass:[HomeCollectionViewCell class] forCellWithReuseIdentifier:cellId];
    [collectionView setBackgroundColor:[UIColor whiteColor]];
    
    [self.view addSubview:collectionView];
    
}

- (void)viewWillAppear:(BOOL)animated {

    self.navigationController.navigationBarHidden = NO;
//    [self.navigationController setNavigationBarHidden:NO animated:NO];
}



- (void)fetchData {
    NSString *urlString = @"https://raw.githubusercontent.com/MochiCurry/mockjson/main/StarWars.json";
    NSURL *url = [NSURL URLWithString: urlString];
    
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSError *err;
        NSArray *missionJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
        if (err){
            NSLog(@"Failed to serialize into JSON: %@", err);
            return;
        }
        
        NSMutableArray<Mission *> *missions = NSMutableArray.new;
        
        for (NSDictionary *missionDict in missionJSON) {
            NSString *title = missionDict[@"title"];
            NSString *date = missionDict[@"date"];
            NSString *location = missionDict[@"locationline1"];
            NSString *description = missionDict[@"description"];
            NSString *imageUrl = missionDict[@"image"];
            
            Mission *mission = Mission.new;
            mission.title = title;
            mission.date = date;
            mission.locationline1 = location;
            mission.missionDescription = description;
            mission.image = imageUrl;
        
            [missions addObject:mission];
        }
        
        self.missions = missions;
        
        dispatch_async(dispatch_get_main_queue(), ^{
//            [self.tableView reloadData];
            [self->collectionView reloadData];
        });
    }] resume];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.missions.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HomeCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    
    Mission *mission = self.missions[indexPath.item];
    
    [cell configure: mission];
     
//    cell.backgroundColor=[UIColor greenColor];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    Mission *mission = self.missions[indexPath.item];
    NSLog(@"TAPPED");
    
    
//    DetailViewController *vc = [[DetailViewController alloc] init];
    DetailViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];

//    [self presentViewController:vc animated:YES completion:nil];
    [self.navigationController pushViewController:vc animated:YES];

}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width - 24, 200);
}


///Dismiss keyboard.
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self.view endEditing:YES];
//}














//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//
//    [self fetchData];table
//
//    self.navigationItem.title = @"Curry";
//    self.navigationController.navigationBar.prefersLargeTitles = YES;
//
//    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier: cellId];
//}
//
//- (void)fetchData {
//    NSString *urlString = @"https://raw.githubusercontent.com/MochiCurry/mockjson/main/StarWars.json";
//    NSURL *url = [NSURL URLWithString: urlString];
//
//    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//
//        NSError *err;
//        NSArray *missionJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
//        if (err){
//            NSLog(@"Failed to serialize into JSON: %@", err);
//            return;
//        }
//
//        NSMutableArray<Mission *> *missions = NSMutableArray.new;
//        for (NSDictionary *courseDict in missionJSON) {
//            NSString *title = courseDict[@"title"];
//            NSString *date = courseDict[@"date"];
//            Mission *mission = Mission.new;
//            mission.title = title;
//            mission.date = date;
//            [missions addObject:mission];
//        }
//
//        self.missions = missions;
//
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self.tableView reloadData];
//        });
//    }] resume];
//}
//
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return self.missions.count;
//}
//
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//
//    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
//    Mission *mission = self.missions[indexPath.row];
//
//    cell.textLabel.text = mission.title;
//    cell.detailTextLabel.text = mission.description;
//    return cell;
//}

@end
