//
//  TrackCell.m
//  Tunes with Friends
//
//  Created by mattpdl on 7/28/21.
//

#import "TrackCell.h"

@implementation TrackCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // Pass references to IBOutlets to PlayerCell class
    self.coverArtView = self.trackCoverArtView;
    self.titleLabel = self.trackTitleLabel;
    self.artistAlbumLabel = self.trackArtistAlbumLabel;
    self.playbackButton = self.trackPlaybackButton;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)didTapPlay:(id)sender {
    [self didTapPlay];
}

@end
