//
//  PlayerCell.h
//  Tunes with Friends
//
//  Created by mattpdl on 8/6/21.
//

#import <UIKit/UIKit.h>
#import "Track.h"

NS_ASSUME_NONNULL_BEGIN

@interface PlayerCell : UITableViewCell

// UI properties
@property (weak, nonatomic) UIImageView *coverArt;
@property (weak, nonatomic) UILabel *title;
@property (weak, nonatomic) UILabel *artistAlbum;

@property (strong, nonatomic) Track *track;

- (void)updateTrack;

@end

NS_ASSUME_NONNULL_END
