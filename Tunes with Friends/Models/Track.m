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
    if (track[@"preview_url"] != [NSNull null]) {
        self.sampleURL = [NSURL URLWithString:track[@"preview_url"]];
    }
    
    return self;
}

- (BOOL)isEqualToTrack:(Track *)track {
    // Return whether both track IDs are equivalent
    return [self.id isEqualToString:track.id];
}

- (void)updateWithTrack:(Track *)track {
    // Change any properties that don't match the other track
    if (![self.id isEqualToString:track.id]) {
        self.id = track.id;
    }
    
    else if (![self.title isEqualToString:track.title]) {
        self.title = track.title;
    }
    
    else if (![self.artist isEqualToString:track.artist]) {
        self.artist = track.artist;
    }
    
    else if (![self.album isEqualToString:track.album]) {
        self.album = track.album;
    }
    
    else if (![self.coverArtURL isEqual:track.coverArtURL]) {
        self.coverArtURL = track.coverArtURL;
    }
    
    else if (![self.sampleURL isEqual:track.sampleURL]) {
        self.sampleURL = track.sampleURL;
    }
}

@end
