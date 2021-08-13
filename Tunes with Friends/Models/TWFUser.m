//
//  TWFUser.m
//  Tunes with Friends
//
//  Created by mattpdl on 8/12/21.
//

#import "TWFUser.h"
#import <PFObject+Subclass.h>

@implementation TWFUser

@dynamic groups;

+ (NSString *)parseClassName {
    return @"_User";
}

- (void)joinGroup:(NSString *)groupID {
    
}

- (void)leaveGroup:(NSString *)groupID {
    
}

@end
