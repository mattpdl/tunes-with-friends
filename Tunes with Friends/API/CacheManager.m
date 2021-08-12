//
//  CacheManager.m
//  Tunes with Friends
//
//  Created by mattpdl on 8/9/21.
//

#import "CacheManager.h"

@implementation CacheManager

+ (void)cacheTracks:(NSArray<NSDictionary *> *)tracks {
    NSMutableDictionary<NSString *, NSDictionary *> *tracksDict = [NSMutableDictionary dictionary];
    NSMutableArray<NSString *> *tracksOrder = [NSMutableArray array];
    
    // Store order of track IDs in an array
    for (NSDictionary *track in tracks) {
        [tracksDict setObject:track forKey:track[@"id"]];
        [tracksOrder addObject:track[@"id"]];
    }
    
    [self storeTracks:tracksDict andOrder:tracksOrder];
}

+ (NSDictionary<NSString *,NSDictionary *> *)cachedTracks {
    return [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"cached_tracks"];
}

+ (NSArray<NSString *> *)cachedTracksOrder {
    return [[NSUserDefaults standardUserDefaults] arrayForKey:@"cached_tracks_order"];
}

+ (void)storeTracks:(NSDictionary<NSString *,NSDictionary *> *)tracks andOrder:(NSArray<NSString *> *)tracksOrder {
    // Cache track IDs, corresponding track dictionaries, and order of track IDs
    [[NSUserDefaults standardUserDefaults] setObject:tracks forKey:@"cached_tracks"];
    [[NSUserDefaults standardUserDefaults] setObject:tracksOrder forKey:@"cached_tracks_order"];
}

@end
