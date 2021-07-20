//
//  LoginViewController.m
//  Tunes with Friends
//
//  Created by mattpdl on 7/16/21.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>
#import "ReusableAlert.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)didTapLogin:(id)sender {
    [self loginUser];
}

- (IBAction)didTapSignUp:(id)sender {
    [self registerUser];
}

- (void)loginUser {
    // Get entered user credentials
    PFUser *userToLogin = [PFUser user];
    if ([self setUserCredentials:userToLogin]) {
        
        // Call login function with given credentials
        [PFUser logInWithUsernameInBackground:userToLogin.username password:userToLogin.password block:^(PFUser * user, NSError *  error) {
            if (error != nil) {
                NSLog(@"User log in failed: %@", error.localizedDescription);
                [ReusableAlert show:self withTitle:@"Login Failure" withMsg:@"Check your user credentials and internet connection and try again."];
            } else {
                NSLog(@"User logged in successfully");
                
                // Display home feed after successful login
                [self performSegueWithIdentifier:@"LoginSegue" sender:self];
            }
        }];
    }
}

- (void)registerUser {
    // Set new user credentials
    PFUser *newUser = [PFUser user];
    if ([self setUserCredentials:newUser]) {
    
        // Call sign up function on the object
        [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
            if (error != nil) {
                NSLog(@"Error: %@", error.localizedDescription);
                [ReusableAlert show:self withTitle:@"User Registration Failure"
                    withMsg:@"This likely means your selected username is taken, or you are not connected to the internet."];
            } else {
                NSLog(@"User registered successfully");
                
                // Manually segue to logged in view
                [self performSegueWithIdentifier:@"LoginSegue" sender:nil];
            }
        }];
    }
}

- (BOOL)setUserCredentials:(PFUser *)user {
    // Display alert if empty credentials given
    if ([self.usernameField.text isEqualToString:@""]) {
        [ReusableAlert show:self withTitle:@"Empty Username" withMsg:@"Your username cannot be empty."];
        return NO;
    } else if ([self.passwordField.text isEqualToString:@""]) {
        [ReusableAlert show:self withTitle:@"Empty Password" withMsg:@"Your password cannot be empty."];
        return NO;
    }
    
    // Otherwise set username and password from text fields
    else {
        user.username = self.usernameField.text;
        user.password = self.passwordField.text;
        return YES;
    }
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
