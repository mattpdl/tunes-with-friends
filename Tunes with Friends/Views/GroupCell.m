//
//  GroupCell.m
//  Tunes with Friends
//
//  Created by mattpdl on 8/13/21.
//

#import "GroupCell.h"

@implementation GroupCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateGroup:(Group *)group {
    // Set name and description labels
    self.nameLabel.text = group.name;
    self.descriptionLabel.text = group.groupDescription;
}

@end
