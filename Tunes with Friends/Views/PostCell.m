//
//  PostCell.m
//  Tunes with Friends
//
//  Created by mattpdl on 8/3/21.
//

#import "PostCell.h"
#import "SpotifyAPI.h"

@implementation PostCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // Pass references to IBOutlets to PlayerCell class
    self.coverArt = self.coverArtView;
    self.title = self.titleLabel;
    self.artistAlbum = self.artistAlbumLabel;
    self.playbackButton = self.playButton;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)didTapPlay:(id)sender {
    [self didTapPlay];
}

- (void)updatePost:(Post *)post {
    // Set username and text labels
    self.usernameLabel.text = post.author.username;
    self.postTextLabel.text = post.text;
    
    // Fetch track from Spotify API and set cover art, title and artist/album labels
    [SpotifyAPI getTrack:post.trackID completion:^(NSDictionary * _Nonnull responseObject, NSError * _Nonnull error) {
        self.track = [[Track alloc] initWithDictionary:responseObject];
        [self updateTrack];
    }];
}

@end
