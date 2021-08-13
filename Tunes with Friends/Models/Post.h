//
//  Post.h
//  Tunes with Friends
//
//  Created by mattpdl on 7/19/21.
//

#import <Parse/Parse.h>

NS_ASSUME_NONNULL_BEGIN

@interface Post : PFObject<PFSubclassing>

@property (nonatomic, strong) PFUser *author;
@property (nonatomic, strong) NSString *groupID;

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *trackID;
@property (nonatomic, strong) NSNumber *numLikes;
@property (nonatomic, strong) NSNumber *numComments;

+ (void)postSong:(NSString * _Nullable)trackID inGroup:(NSString * _Nullable)groupID withText:(NSString * _Nullable)text completion:(PFBooleanResultBlock _Nullable)completion;

@end

NS_ASSUME_NONNULL_END
