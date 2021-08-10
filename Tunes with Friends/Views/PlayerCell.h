//
//  PlayerCell.h
//  Tunes with Friends
//
//  Created by mattpdl on 8/6/21.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVPlayerItem.h>
#import "Track.h"

NS_ASSUME_NONNULL_BEGIN

@protocol PlaybackDelegate

- (void)handlePlayback:(AVPlayerItem *)newItem forButton:(UIButton *)newButton;

@end

@interface PlayerCell : UITableViewCell

// UI properties
@property (weak, nonatomic) UIImageView *coverArtView;
@property (weak, nonatomic) UILabel *titleLabel;
@property (weak, nonatomic) UILabel *artistAlbumLabel;
@property (weak, nonatomic) UIButton *playbackButton;

@property (weak, nonatomic) id<PlaybackDelegate> playbackDelegate;
@property (strong, nonatomic) AVPlayerItem *playerItem;
@property (strong, nonatomic) Track *track;

- (void)didTapPlay;
- (void)updateTrack;

@end

NS_ASSUME_NONNULL_END
