//
//  CacheManager.m
//  Tunes with Friends
//
//  Created by mattpdl on 8/9/21.
//

#import "CacheManager.h"

@implementation CacheManager

+ (void)cacheTracks:(NSArray<NSDictionary *> *)tracks {
    // Add track IDs to a set
    NSMutableSet<NSString *> *trackIDs = [[NSMutableSet alloc] init];
    
    for (NSDictionary *track in tracks) {
        [trackIDs addObject:track[@"id"]];
    }
    
    [self storeIDs:trackIDs andTracks:tracks];
}

+ (void)cachePlaylist:(NSArray<NSDictionary *> *)items {
    // Add track IDs to a set
    NSMutableSet<NSString *> *trackIDs = [[NSMutableSet alloc] init];
    NSMutableArray<NSDictionary *> *tracks = [[NSMutableArray alloc] init];
    
    for (NSDictionary *item in items) {
        NSDictionary *track = item[@"track"];
        [trackIDs addObject:track[@"id"]];
        [tracks addObject:track];
    }
    
    [self storeIDs:trackIDs andTracks:tracks];
}

+ (NSSet<NSString *> *)defaultTrackIDs {
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"default_track_ids"];
}

+ (NSArray<NSDictionary *> *)defaultTracks {
    return [[NSUserDefaults standardUserDefaults] arrayForKey:@"default_tracks"];
}

+ (void)storeIDs:(NSSet<NSString *> *)trackIDs andTracks:(NSArray<NSDictionary *> *)tracks {
    // Cache track IDs and tracks array
    //[[NSUserDefaults standardUserDefaults] setObject:trackIDs forKey:@"default_track_ids"];
    [[NSUserDefaults standardUserDefaults] setObject:tracks forKey:@"default_tracks"];
}

@end
