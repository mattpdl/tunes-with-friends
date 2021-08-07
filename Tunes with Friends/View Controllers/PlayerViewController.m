//
//  PlayerViewController.m
//  Tunes with Friends
//
//  Created by mattpdl on 8/5/21.
//

#import "PlayerViewController.h"
#import "PlayerCell.h"

@interface PlayerViewController () <PlaybackDelegate>

@end

@implementation PlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.player = [[AVPlayer alloc] initWithPlayerItem:nil];
}

- (void)handlePlayback:(AVPlayerItem *)newItem {
    // Check if different track currently playing, or if audio player is otherwise uninitialized
    if (newItem != self.player.currentItem) {
        [self.player replaceCurrentItemWithPlayerItem:newItem];
        [self.player play];
    }
    
    // Pause audio sample if already playing
    else {
        [self.player pause];
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
