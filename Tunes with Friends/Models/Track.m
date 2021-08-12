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
    
    // Store URL of 30 second audio sample
    if (track[@"preview_url"] != [NSNull null]) {
        self.sampleURL = [NSURL URLWithString:track[@"preview_url"]];
    }
    
    // Parse data from API call
    if (track[@"artists"]) {
        
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
    }
    
    // Parse data from cache
    else {
        self.artist = track[@"artist"];
        self.album = track[@"album"];
        self.coverArtURL = [NSURL URLWithString:track[@"cover_art_url"]];
    }
    
    return self;
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    [dict setValue:self.id forKey:@"id"];
    [dict setValue:self.title forKey:@"name"];
    [dict setValue:self.artist forKey:@"artist"];
    [dict setValue:self.album forKey:@"album"];
    [dict setValue:self.coverArtURL.absoluteString forKey:@"cover_art_url"];
    [dict setValue:self.sampleURL.absoluteString forKey:@"preview_url"];
    
    return dict;
}

- (BOOL)isEqualToTrack:(Track *)track {
    // Return whether both track IDs are equivalent
    return [self.id isEqualToString:track.id];
}

- (void)updateWithTrack:(Track *)track {
    // Change all properties to match the other track
    self.id = track.id;
    self.title = track.title;
    self.artist = track.artist;
    self.album = track.album;
    self.coverArtURL = track.coverArtURL;
    self.sampleURL = track.sampleURL;
}

@end
