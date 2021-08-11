//
//  Track.m
//  Tunes with Friends
//
//  Created by mattpdl on 7/26/21.
//

#import "Track.h"
#import "SpotifyAPI.h"

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
    NSDictionary *coverArt = images[2];
    
    self.album = album[@"name"];
    self.coverArtURL = [NSURL URLWithString:coverArt[@"url"]];
    
    // Store URL of 30 second audio sample
    self.sampleURL = (track[@"preview_url"] != [NSNull null]) ? [NSURL URLWithString:track[@"preview_url"]] : nil;
    
    return self;
}

- (BOOL)isEqualToTrack:(Track *)track {
    return [self.id isEqualToString:track.id] && [self.title isEqualToString:track.title] && [self.artist isEqualToString:track.artist] && [self.album isEqualToString:track.album] && [self.coverArtURL isEqual:track.coverArtURL] && [self.sampleURL isEqual:track.sampleURL];
}

@end
