//
//  FeedViewController.m
//  Tunes with Friends
//
//  Created by mattpdl on 7/17/21.
//

#import "FeedViewController.h"
#import "SpotifyAPIWrapper.h"

@interface FeedViewController ()

@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [SpotifyAPIWrapper getAccessToken:^(NSDictionary * _Nonnull response, NSError * _Nonnull error) {
        
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
