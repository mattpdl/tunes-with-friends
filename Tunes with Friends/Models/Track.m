//
//  Track.m
//  Tunes with Friends
//
//  Created by mattpdl on 7/26/21.
//

#import "Track.h"
#import "SpotifyAPIWrapper.h"

@implementation Track

- (instancetype)initWithDictionary:(NSDictionary *)track {
    
    self = [super init];
    
    // Store track id and title
    self.id = track[@"id"];
    self.title = track[@"name"];
    
    // Store name of first artist listed
    NSArray *artists = track[@"artists"];
    NSDictionary *primaryArtist = artists[0];
    self.artist = primaryArtist[@"name"];
    
    // Store name and cover art of the track's album
    NSDictionary *album = track[@"album"];
    NSArray *images = album[@"images"];
    NSDictionary *coverArt = images[0];
    
    self.album = album[@"name"];
    self.coverArt = coverArt[@"url"];
    
    // Store URL of 30 second audio sample
    self.audioSample = track[@"preview_url"];
    
    return self;
}

- (instancetype)initWithID:(NSString *)trackID {
    
    __block NSDictionary *track = nil;
    
    // Fetch track object with given ID from Spotify API
    [SpotifyAPIWrapper getTrack:trackID completion:^(NSDictionary * _Nonnull responseObject, NSError * _Nonnull error) {
        
        if (error) {
            NSLog(@"Failed to fetch track with given ID");
        } else {
            track = responseObject;
        }
    }];
    
    // Call initWithDictionary on track object, or return nil if track not found
    if (track) {
        return [self initWithDictionary:track];
    } else {
        return nil;
    }
}

@end
