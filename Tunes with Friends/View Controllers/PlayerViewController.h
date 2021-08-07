//
//  PlayerViewController.h
//  Tunes with Friends
//
//  Created by mattpdl on 8/5/21.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVPlayer.h>
#import <AVFoundation/AVPlayerItem.h>

NS_ASSUME_NONNULL_BEGIN

@interface PlayerViewController : UIViewController

@property (strong, nonatomic) AVPlayer *player;
@property (weak, nonatomic) UIButton *playbackButton;

@end

NS_ASSUME_NONNULL_END
