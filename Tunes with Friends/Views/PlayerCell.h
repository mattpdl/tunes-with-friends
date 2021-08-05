//
//  PlayerCell.h
//  Tunes with Friends
//
//  Created by mattpdl on 8/4/21.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVPlayer.h>
#import "Track.h"

NS_ASSUME_NONNULL_BEGIN

@interface PlayerCell : UITableViewCell

@property (strong, nonatomic) AVPlayer *player;
@property (strong, nonatomic) Track *track;

@end

NS_ASSUME_NONNULL_END
