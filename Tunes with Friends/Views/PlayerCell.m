//
//  PlayerCell.m
//  Tunes with Friends
//
//  Created by mattpdl on 8/6/21.
//

#import "PlayerCell.h"
#import "UIImageView+AFNetworking.h"

@implementation PlayerCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)didTapPlay {
    if (!self.playerItem) {
        self.playerItem = [[AVPlayerItem alloc] initWithURL:self.track.sampleURL];
    }
    
    [self.playbackDelegate handlePlayback:self.playerItem forButton:self.playbackButton];
}

- (void)updateTrack {
    // Hide playback button if audio sample not available
    if (!self.track.sampleURL) {
        [self.playbackButton setHidden:YES];
    }
    
    // Update cover art image
    [self updateCoverArt];
    
    // Update title, artist, and album labels
    self.titleLabel.text = self.track.title;
    self.artistAlbumLabel.text = [NSString stringWithFormat:@"%@ · %@", self.track.artist, self.track.album];
}

- (void)updateCoverArt {
    NSURLRequest *coverArtRequest = [NSURLRequest requestWithURL:self.track.coverArtURL];
    
    [self.coverArtView setImageWithURLRequest:coverArtRequest placeholderImage:nil success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
        
            // Image loaded from network request
            if (response) {
                
                // Fade in cover art
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
            
            // Load cover art from cache
            if (self.track.coverArt) {
                self.coverArtView.image = self.track.coverArt;
            }
            
            else {
                NSLog(@"Failed to load cover art for '%@'", self.track.title);
            }
        }];
}

@end
