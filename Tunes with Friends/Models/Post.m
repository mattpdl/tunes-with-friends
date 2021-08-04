//
//  Post.m
//  Tunes with Friends
//
//  Created by mattpdl on 7/19/21.
//

#import "Post.h"

@implementation Post

@dynamic postID;
@dynamic userID;
@dynamic author;
@dynamic text;
@dynamic trackID;
@dynamic numLikes;
@dynamic numComments;

+ (nonnull NSString *)parseClassName {
    return @"Post";
}

+ (void) postSong:(NSString * _Nullable)trackID withText:(NSString * _Nullable)text completion: (PFBooleanResultBlock _Nullable)completion {
    Post *newPost = [Post new];
    newPost.text = text;
    newPost.trackID = trackID;
    newPost.numLikes = @(0);
    newPost.numComments = @(0);
    
    [newPost saveInBackgroundWithBlock:completion];
}

@end
