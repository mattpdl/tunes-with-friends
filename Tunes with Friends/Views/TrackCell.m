//
//  TrackCell.m
//  Tunes with Friends
//
//  Created by mattpdl on 7/28/21.
//

#import "TrackCell.h"
#import "PlayerViewController.h"
#import "UIImageView+AFNetworking.h"

@implementation TrackCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // Pass references to IBOutlets to PlayerCell class
    self.coverArt = self.coverArtView;
    self.title = self.titleLabel;
    self.artistAlbum = self.artistAlbumLabel;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)didTapPlay:(id)sender {
    self.playerItem = [[AVPlayerItem alloc] initWithURL:self.track.audioSample];;
    
    // Check if different track currently playing, or if audio player is otherwise uninitialized
    if (self.playerItem != self.player.currentItem) {
        [self.player replaceCurrentItemWithPlayerItem:self.playerItem];
        [self.player play];
        [self.playButton setBackgroundImage:[UIImage systemImageNamed:@"pause.circle"] forState:UIControlStateNormal];
    }
    
    // Pause audio sample if already playing
    else {
        [self.player pause];
        [self.playButton setBackgroundImage:[UIImage systemImageNamed:@"play.circle"] forState:UIControlStateNormal];
    }
}

@end
