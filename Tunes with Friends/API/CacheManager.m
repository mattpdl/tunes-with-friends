//
//  CacheManager.m
//  Tunes with Friends
//
//  Created by mattpdl on 8/9/21.
//

#import "CacheManager.h"

@implementation CacheManager

+ (void)cacheTracks:(NSArray <NSDictionary *>*)tracks {
    // Add track IDs to a set
    NSMutableSet<NSString *> *trackIDs;
    
    for (NSDictionary *track in tracks) {
        [trackIDs addObject:track[@"id"]];
    }
    
    // Cache tracks array
    [[NSUserDefaults standardUserDefaults] setObject:tracks forKey:@"default_tracks"];
}

+ (NSSet <NSString *>*)defaultTrackIDs {
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"default_track_ids"];
}

+ (NSArray <NSDictionary *>*)defaultTracks {
    return [[NSUserDefaults standardUserDefaults] arrayForKey:@"default_tracks"];
}

@end
