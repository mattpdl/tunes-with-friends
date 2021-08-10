//
//  TrackCell.h
//  Tunes with Friends
//
//  Created by mattpdl on 7/28/21.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVPlayer.h>
#import <AVFoundation/AVPlayerItem.h>
#import "PlayerCell.h"
#import "Track.h"

NS_ASSUME_NONNULL_BEGIN

@interface TrackCell : PlayerCell

// UI properties
@property (weak, nonatomic) IBOutlet UIImageView *trackCoverArtView;
@property (weak, nonatomic) IBOutlet UILabel *trackTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *trackArtistAlbumLabel;
@property (weak, nonatomic) IBOutlet UIButton *trackPlaybackButton;

@end

NS_ASSUME_NONNULL_END
