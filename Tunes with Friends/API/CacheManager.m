//
//  CacheManager.m
//  Tunes with Friends
//
//  Created by mattpdl on 8/9/21.
//

#import "CacheManager.h"

@implementation CacheManager

+ (void)cacheTracks:(NSDictionary *)tracks {
    [[NSUserDefaults standardUserDefaults] setObject:tracks forKey:@"default_tracks"];
}

+ (NSDictionary *)defaultTracks {
    return [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"default_tracks"];
}

@end
