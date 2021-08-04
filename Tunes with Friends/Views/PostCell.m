//
//  PostCell.m
//  Tunes with Friends
//
//  Created by mattpdl on 8/3/21.
//

#import "PostCell.h"
#import "SpotifyAPI.h"
#import "Track.h"
#import "UIImageView+AFNetworking.h"

@implementation PostCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setPost:(Post *)post {
    // Set username and text labels
    self.usernameLabel.text = post.author.username;
    self.postTextLabel.text = post.text;
    
    // Fetch track from Spotify API and set cover art, title and artist/album labels
    [SpotifyAPI getTrack:post.trackID completion:^(NSDictionary * _Nonnull responseObject, NSError * _Nonnull error) {
        Track *track = [[Track alloc] initWithDictionary:responseObject];
        [self setTrack:track];
    }];
}

- (void)setTrack:(Track *)track {
    // Update cover art image
    NSURLRequest *coverArtRequest = [NSURLRequest requestWithURL:track.coverArt];
    
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
            
            NSLog(@"Failed to load cover art for '%@'", track.title);
        }];
    
    // Update title, artist, and album labels
    self.titleLabel.text = track.title;
    self.artistAlbumLabel.text = [NSString stringWithFormat:@"%@ · %@", track.artist, track.album];
}

@end
