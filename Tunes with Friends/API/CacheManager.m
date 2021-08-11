//
//  CacheManager.m
//  Tunes with Friends
//
//  Created by mattpdl on 8/9/21.
//

#import "CacheManager.h"

@implementation CacheManager

+ (void)cacheTracks:(NSArray <NSDictionary *>*)tracks {
    [[NSUserDefaults standardUserDefaults] setObject:tracks forKey:@"default_tracks"];
}

+ (NSArray <NSDictionary *>*)defaultTracks {
    return [[NSUserDefaults standardUserDefaults] arrayForKey:@"default_tracks"];
}

@end
