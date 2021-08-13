//
//  GroupListViewController.m
//  Tunes with Friends
//
//  Created by mattpdl on 8/12/21.
//

#import "GroupListViewController.h"

@interface GroupListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *groupsView;

@end

@implementation GroupListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.groupsView.dataSource = self;
    self.groupsView.delegate = self;
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
    
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

@end
