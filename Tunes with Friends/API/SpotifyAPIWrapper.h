//
//  SpotifyAPIWrapper.h
//  Tunes with Friends
//
//  Created by mattpdl on 7/21/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SpotifyAPIWrapper : NSObject

+ (void)getTopTracks:(void (^)(NSDictionary *, NSError *))completion;

@end

NS_ASSUME_NONNULL_END