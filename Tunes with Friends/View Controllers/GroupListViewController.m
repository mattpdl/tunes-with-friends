//
//  GroupListViewController.m
//  Tunes with Friends
//
//  Created by mattpdl on 8/12/21.
//

#import "GroupListViewController.h"
#import "GroupCell.h"
#import "GroupCreationViewController.h"
#import <Parse/Parse.h>

@interface GroupListViewController () <UITableViewDataSource, UITableViewDelegate>

// UI properties
@property (weak, nonatomic) IBOutlet UITableView *groupsView;

@property (strong, nonatomic) NSArray<Group *> *groups;

@end

@implementation GroupListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Set data source and delegate for table view
    self.groupsView.dataSource = self;
    self.groupsView.delegate = self;
    
    // Add UIRefreshControl
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(fetchGroups:) forControlEvents:UIControlEventValueChanged];
    [self.groupsView insertSubview:refreshControl atIndex:0];
    
    // Fetch posts from Parse database
    [self fetchGroups:refreshControl];
}

- (void)fetchGroups:(UIRefreshControl *)refreshControl {
    // Construct PFQuery
    PFQuery *groupsQuery = [PFQuery queryWithClassName:@"Group"];
    [groupsQuery orderByDescending:@"numMembers"];
    [groupsQuery includeKey:@"owner"];
    groupsQuery.limit = 20;
    
    // Query database
    [groupsQuery findObjectsInBackgroundWithBlock:^(NSArray * _Nullable groups, NSError * _Nullable error) {
            
        if (groups) {
            self.groups = groups;
            [self.groupsView reloadData];
        } else {
            NSLog(@"Error: %@", error.localizedDescription);
        }
        
        [refreshControl endRefreshing];
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    GroupCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GroupCell"];
    [cell updateGroup:self.groups[indexPath.row]];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.groups.count;
}

@end
