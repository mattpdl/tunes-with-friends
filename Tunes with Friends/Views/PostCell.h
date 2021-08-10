//
//  PostCell.h
//  Tunes with Friends
//
//  Created by mattpdl on 8/3/21.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVPlayer.h>
#import "PlayerCell.h"
#import "Post.h"
#import "Track.h"

NS_ASSUME_NONNULL_BEGIN

@interface PostCell : PlayerCell

// UI properties
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *postTextLabel;
@property (weak, nonatomic) IBOutlet UIImageView *postCoverArtView;
@property (weak, nonatomic) IBOutlet UILabel *postTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *postArtistAlbumLabel;
@property (weak, nonatomic) IBOutlet UIButton *postPlaybackButton;

- (void)updatePost:(Post *)post;

@end

NS_ASSUME_NONNULL_END
