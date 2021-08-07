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
        self.playerItem = [[AVPlayerItem alloc] initWithURL:self.track.audioSample];
    }
    
    [self.playbackDelegate handlePlayback:self.playerItem forButton:self.playbackButton];
}

- (void)updateTrack {
    // Update cover art image
    NSURLRequest *coverArtRequest = [NSURLRequest requestWithURL:self.track.coverArt];
    
    [self.coverArt setImageWithURLRequest:coverArtRequest placeholderImage:nil success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
        
            // Image loaded from network request
            if (response) {
                self.coverArt.alpha = 0.0;
                self.coverArt.image = image;
                
                [UIView animateWithDuration:0.3 animations:^{
                    self.coverArt.alpha = 1.0;
                }];
            }
            
            // Image already cached
            else {
                self.coverArt.image = image;
            }
        
        } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
            
            NSLog(@"Failed to load cover art for '%@'", self.track.title);
        }];
    
    // Update title, artist, and album labels
    self.title.text = self.track.title;
    self.artistAlbum.text = [NSString stringWithFormat:@"%@ · %@", self.track.artist, self.track.album];
}

@end
