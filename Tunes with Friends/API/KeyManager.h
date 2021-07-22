//
//  KeyManager.h
//  Tunes with Friends
//
//  Created by mattpdl on 7/22/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KeyManager : NSObject

+ (NSString *)spotifyAccessToken;
+ (NSString *)spotifyClientID;
+ (NSString *)spotifyClientSecret;

@end

NS_ASSUME_NONNULL_END
