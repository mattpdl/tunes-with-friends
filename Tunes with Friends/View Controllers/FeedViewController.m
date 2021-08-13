//
//  FeedViewController.m
//  Tunes with Friends
//
//  Created by mattpdl on 7/17/21.
//

#import "FeedViewController.h"
#import <Parse/Parse.h>
#import "PostCell.h"
#import "SpotifyAPI.h"
#import "SceneDelegate.h"

@interface FeedViewController () <UITableViewDataSource, UITableViewDelegate>

// UI properties
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UITableView *feedView;

@property (strong, nonatomic) NSArray<Post *> *posts;

@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Set data source and delegate for table view
    self.feedView.dataSource = self;
    self.feedView.delegate = self;
    
    // Add UIRefreshControl
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(fetchPosts:) forControlEvents:UIControlEventValueChanged];
    [self.feedView insertSubview:refreshControl atIndex:0];
    
    // Animate activity indicator
    [self.feedView setHidden:YES];
    [self.activityIndicator startAnimating];
    
    // Fetch posts from Parse database
    [self fetchPosts:refreshControl];
}

- (IBAction)didTapSettings:(id)sender {
    UIAlertController *settingsSheet = [UIAlertController alertControllerWithTitle:@"Settings" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    [settingsSheet addAction:[UIAlertAction actionWithTitle:@"Logout" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
        [self logoutUser];
    }]];
    
    [settingsSheet addAction:[UIAlertAction actionWithTitle:@"Exit" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }]];
    
    [self presentViewController:settingsSheet animated:YES completion:nil];
}

- (void)fetchPosts:(UIRefreshControl *)refreshControl {
    // Construct PFQuery
    PFQuery *postQuery = [PFQuery queryWithClassName:@"Post"];
    [postQuery orderByDescending:@"createdAt"];
    [postQuery includeKey:@"author"];
    postQuery.limit = 20;
    
    // Query database
    [postQuery findObjectsInBackgroundWithBlock:^(NSArray * _Nullable posts, NSError * _Nullable error) {
        if (posts) {
            self.posts = posts;
            [self.feedView reloadData];
            [self.feedView setHidden:NO];
        } else {
            NSLog(@"Error: %@", error.localizedDescription);
        }
        
        [self.activityIndicator stopAnimating];
        [refreshControl endRefreshing];
    }];
}

- (void)logoutUser {
    NSString *username = PFUser.currentUser.username;
    
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error: %@", error.localizedDescription);
        }
        
        else {
            NSLog(@"Logged out %@", username);
            
            // Redirect to login screen
            SceneDelegate *sceneDelegate = (SceneDelegate *)self.view.window.windowScene.delegate;
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            UIViewController *loginScreen = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
            sceneDelegate.window.rootViewController = loginScreen;
        }
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
    
    // Dequeue PostCell and set cell contents
    PostCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostCell"];
    cell.playbackDelegate = self;
    [cell updatePost:self.posts[indexPath.row]];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.posts.count;
}

@end
