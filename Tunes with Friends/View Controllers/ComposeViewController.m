//
//  ComposeViewController.m
//  Tunes with Friends
//
//  Created by mattpdl on 7/19/21.
//

#import "ComposeViewController.h"
#import <Parse/Parse.h>
#import "Post.h"
#import "ReusableAlert.h"

@interface ComposeViewController () <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *placeholderLabel;
@property (weak, nonatomic) IBOutlet UITextView *postTextView;

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.postTextView.delegate = self;
}

- (IBAction)didTapPost:(id)sender {
    // Save post in backend
    [Post postSong:self.selectedTrackID withText:self.postTextView.text completion:^(BOOL succeeded, NSError * _Nullable error) {
        if (succeeded) {
            NSLog(@"%@ posted song ID %@ with text: %@", [PFUser currentUser].username, self.selectedTrackID, self.postTextView.text);
            [self dismissViewControllerAnimated:YES completion:nil];
        } else {
            NSLog(@"Error: %@", error.localizedDescription);
            [ReusableAlert show:self withTitle:@"Post Submission Failed" withMsg:@"Check your internet connection and try again."];
        }
    }];
}

- (void)textViewDidChange:(UITextView *)textView {
    // Display placeholder text if no text entered
    if ([textView hasText]) {
        [self.placeholderLabel setHidden:YES];
    } else {
        [self.placeholderLabel setHidden:NO];
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
