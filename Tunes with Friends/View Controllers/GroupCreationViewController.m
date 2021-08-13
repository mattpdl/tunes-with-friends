//
//  GroupCreationViewController.m
//  Tunes with Friends
//
//  Created by mattpdl on 8/12/21.
//

#import "GroupCreationViewController.h"
#import "Group.h"
#import "ReusableAlert.h"

@interface GroupCreationViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionField;

@end

@implementation GroupCreationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.nameField becomeFirstResponder];
}

- (IBAction)didTapCancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)didTapCreate:(id)sender {
    [Group createGroup:self.nameField.text withDescription:self.descriptionField.text completion:^(BOOL succeeded, NSError * _Nullable error) {
        
        if (succeeded) {
            NSLog(@"Created group '%@'", self.nameField.text);
            [self dismissViewControllerAnimated:YES completion:nil];
        } else {
            NSLog(@"Error: %@", error.localizedDescription);
            [ReusableAlert show:self withTitle:@"Group Creation Failed" withMsg:@"Check your internet connection and try again."];
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
