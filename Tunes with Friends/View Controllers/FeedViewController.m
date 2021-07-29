//
//  FeedViewController.m
//  Tunes with Friends
//
//  Created by mattpdl on 7/17/21.
//

#import "FeedViewController.h"
#import <Parse/Parse.h>
#import "SpotifyAPI.h"
#import "SceneDelegate.h"

@interface FeedViewController ()

@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
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

@end
