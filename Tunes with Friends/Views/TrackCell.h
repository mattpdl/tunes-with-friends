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
@property (weak, nonatomic) IBOutlet UIImageView *coverArtView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *artistAlbumLabel;
@property (weak, nonatomic) IBOutlet UIButton *playButton;

@end

NS_ASSUME_NONNULL_END
