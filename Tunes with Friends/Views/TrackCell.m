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

@end
