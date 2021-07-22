//
//  KeyManager.m
//  Tunes with Friends
//
//  Created by mattpdl on 7/22/21.
//

#import "KeyManager.h"

@implementation KeyManager

+ (NSDictionary *)keyDict {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Keys" ofType:@"plist"];
    return [NSDictionary dictionaryWithContentsOfFile:path];
}

+ (NSString *)spotifyAccessToken {
    return [[self keyDict] valueForKey:@"spotify_access_token"];
}

+ (NSString *)spotifyClientID {
    return [[self keyDict] valueForKey:@"spotify_client_id"];
}

+ (NSString *)spotifyClientSecret {
    return [[self keyDict] valueForKey:@"spotify_client_secret"];
}

@end
