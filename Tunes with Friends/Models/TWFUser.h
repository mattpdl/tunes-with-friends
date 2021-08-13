//
//  TWFUser.h
//  Tunes with Friends
//
//  Created by mattpdl on 8/12/21.
//

#import <Parse/Parse.h>

NS_ASSUME_NONNULL_BEGIN

@interface TWFUser : PFUser<PFSubclassing>

@property (nonatomic, strong) NSMutableArray<NSString *> *groups;

- (void)joinGroup:(NSString *)groupID;
- (void)leaveGroup:(NSString *)groupID;

@end

NS_ASSUME_NONNULL_END
