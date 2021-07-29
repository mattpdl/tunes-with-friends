//
//  Artist.h
//  Tunes with Friends
//
//  Created by mattpdl on 7/28/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Artist : NSObject

@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSURL *profileImage;

- (instancetype)initWithDictionary:(NSDictionary *)artist;
- (NSArray *)topTracks;

@end

NS_ASSUME_NONNULL_END
