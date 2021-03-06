//
//  SpotifyAPIWrapper.h
//  Tunes with Friends
//
//  Created by mattpdl on 7/21/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SpotifyAPI : NSObject

+ (void)getAccessToken:(void(^)(NSDictionary *, NSError *))completion;
+ (void)getArtist:(NSString *)artistID completion:(void (^)(NSDictionary *, NSError *))completion;
+ (void)getPlaylist:(NSString *)playlistID completion:(void (^)(NSDictionary *, NSError *))completion;
+ (void)getTrack:(NSString *)trackID completion:(void (^)(NSDictionary *, NSError *))completion;
+ (void)getTopTracks:(NSString *)artistID completion:(void (^)(NSDictionary *, NSError *))completion;
+ (void)searchTracks:(NSString *)query completion:(void (^)(NSDictionary *, NSError *))completion;

@end

NS_ASSUME_NONNULL_END
