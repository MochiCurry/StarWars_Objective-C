//
//  ViewController.m
//  StarWars_Mission_Objective-C
//
//  Created by Kerry Ferguson on 3/24/21.
//

#import "ViewController.h"
#import "Mission.h"

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray<Mission *> *missions;

@end

@implementation ViewController

NSString *cellId = @"cellId";

- (void)viewDidLoad {
    [super viewDidLoad];

    [self fetchData];
    
    self.navigationItem.title = @"Curry";
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier: cellId];
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
        for (NSDictionary *courseDict in missionJSON) {
            NSString *title = courseDict[@"title"];
            NSString *date = courseDict[@"date"];
            Mission *mission = Mission.new;
            mission.title = title;
            mission.date = date;
            [missions addObject:mission];
        }
        
        self.missions = missions;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }] resume];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.missions.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    Mission *mission = self.missions[indexPath.row];
    
    cell.textLabel.text = mission.title;
    cell.detailTextLabel.text = mission.description;
    return cell;
}

@end
