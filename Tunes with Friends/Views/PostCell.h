//
//  PostCell.h
//  Tunes with Friends
//
//  Created by mattpdl on 8/3/21.
//

#import <UIKit/UIKit.h>
#import "Post.h"

NS_ASSUME_NONNULL_BEGIN

@interface PostCell : UITableViewCell

// UI properties
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *postTextLabel;
@property (weak, nonatomic) IBOutlet UIImageView *coverArtView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *artistAlbumLabel;
@property (weak, nonatomic) IBOutlet UIButton *playButton;

- (void)setPost:(Post *)post;

@end

NS_ASSUME_NONNULL_END
