//
//  GroupCell.h
//  Tunes with Friends
//
//  Created by mattpdl on 8/13/21.
//

#import <UIKit/UIKit.h>
#import "Group.h"

NS_ASSUME_NONNULL_BEGIN

@interface GroupCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

- (void)updateGroup:(Group *)group;

@end

NS_ASSUME_NONNULL_END
