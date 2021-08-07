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
    // TODO: use key value observing to fix pause button after playback finishes
    //[self.player addObserver:self forKeyPath:@"rate" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionInitial context:nil];
}

- (void)handlePlayback:(AVPlayerItem *)newItem forButton:(UIButton *)newButton {
    // Check if different track currently playing, or if audio not playing
    if (newItem != self.player.currentItem || self.player.rate == 0.0) {
        [self.player replaceCurrentItemWithPlayerItem:newItem];
        [self.player play];
        
        // Reset previous track's play button
        if (self.playbackButton) {
            [self.playbackButton setBackgroundImage:[UIImage systemImageNamed:@"play.circle"] forState:UIControlStateNormal];
        }
        
        [newButton setBackgroundImage:[UIImage systemImageNamed:@"pause.circle"] forState:UIControlStateNormal];
        self.playbackButton = newButton;
    }
    
    // Pause audio if already playing
    else {
        [self.player pause];
        [self.playbackButton setBackgroundImage:[UIImage systemImageNamed:@"play.circle"] forState:UIControlStateNormal];
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
