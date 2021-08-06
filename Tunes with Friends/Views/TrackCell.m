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
    // Initialization code
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

- (void)updateCell {
    // Update cover art image
    NSURLRequest *coverArtRequest = [NSURLRequest requestWithURL:self.track.coverArt];
    
    [self.coverArtView setImageWithURLRequest:coverArtRequest placeholderImage:nil success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
        
            // Image loaded from network request
            if (response) {
                self.coverArtView.alpha = 0.0;
                self.coverArtView.image = image;
                
                [UIView animateWithDuration:0.3 animations:^{
                    self.coverArtView.alpha = 1.0;
                }];
            }
            
            // Image already cached
            else {
                self.coverArtView.image = image;
            }
        
        } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
            
            NSLog(@"Failed to load cover art for '%@'", self.track.title);
        }];
    
    // Update title, artist, and album labels
    self.titleLabel.text = self.track.title;
    self.artistAlbumLabel.text = [NSString stringWithFormat:@"%@ · %@", self.track.artist, self.track.album];
}

@end
