//
//  Group.h
//  Tunes with Friends
//
//  Created by mattpdl on 8/12/21.
//

#import <Parse/Parse.h>

NS_ASSUME_NONNULL_BEGIN

@interface Group : PFObject<PFSubclassing>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *groupDescription;
@property (nonatomic, strong) NSNumber *numMembers;
@property (nonatomic, strong) PFUser *owner;

+ (void)createGroup:(NSString * _Nullable)name withDescription:(NSString * _Nullable)description completion:(PFBooleanResultBlock _Nullable)completion;

@end

NS_ASSUME_NONNULL_END
