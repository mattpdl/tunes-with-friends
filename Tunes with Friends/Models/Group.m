//
//  Group.m
//  Tunes with Friends
//
//  Created by mattpdl on 8/12/21.
//

#import "Group.h"

@implementation Group

@dynamic name;
@dynamic description;
@dynamic numMembers;
@dynamic owner;

+ (nonnull NSString *)parseClassName {
    return @"Group";
}

+ (void)createGroup:(NSString * _Nullable)name withDescription:(NSString * _Nullable)description completion:(PFBooleanResultBlock _Nullable)completion {
    
    Group *newGroup = [Group new];
    newGroup.name = name;
    newGroup.groupDescription = description;
    newGroup.numMembers = @(0);
    newGroup.owner = PFUser.currentUser;
    
    [newGroup saveInBackgroundWithBlock:completion];
}

@end
