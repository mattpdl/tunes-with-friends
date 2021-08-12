//
//  CacheManager.h
//  Tunes with Friends
//
//  Created by mattpdl on 8/9/21.
//

#import <Foundation/Foundation.h>
#import "Track.h"

NS_ASSUME_NONNULL_BEGIN

@interface CacheManager : NSObject

+ (void)cacheTracks:(NSArray<NSDictionary *> *)tracks;
+ (NSDictionary<NSString *, NSDictionary *> *)cachedTracks;
+ (NSArray<NSString *> *)cachedTracksOrder;

@end

NS_ASSUME_NONNULL_END
