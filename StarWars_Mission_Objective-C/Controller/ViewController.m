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

    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    collectionView=[[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    [collectionView setDataSource:self];
    [collectionView setDelegate:self];
    
    [collectionView registerClass:[HomeCollectionViewCell class] forCellWithReuseIdentifier:cellId];
    [collectionView setBackgroundColor:[UIColor redColor]];
    
    [self.view addSubview:collectionView];
    
    
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
            
            Mission *mission = Mission.new;
            mission.title = title;
            mission.date = date;
            mission.locationline1 = location;
            mission.missionDescription = description;
        
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
    
    cell.title.text = mission.title;
    cell.date.text = mission.date;
    cell.location.text = mission.locationline1;
    cell.missionDescription.text = mission.missionDescription;
    
    
    cell.image.image = [UIImage systemImageNamed:@"person"];
    
//    cell.backgroundColor=[UIColor greenColor];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    Mission *mission = self.missions[indexPath.item];
    NSLog(@"TAPPED");
    
    
    UIViewController *vc = [[DetailViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width, 200);
}

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
