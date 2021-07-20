//
//  Post.h
//  Tunes with Friends
//
//  Created by mattpdl on 7/19/21.
//

#import <Parse/Parse.h>

NS_ASSUME_NONNULL_BEGIN

@interface Post : PFObject<PFSubclassing>

@property (nonatomic, strong) NSString *postID;
@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) PFUser *author;

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSNumber *numLikes;
@property (nonatomic, strong) NSNumber *numComments;

+ (void) postSong:(NSString * _Nullable)text withCompletion: (PFBooleanResultBlock _Nullable)completion;

@end

NS_ASSUME_NONNULL_END
