//
//  Artist.m
//  Tunes with Friends
//
//  Created by mattpdl on 7/28/21.
//

#import "Artist.h"
#import "SpotifyAPI.h"

@implementation Artist

- (instancetype)initWithDictionary:(NSDictionary *)artist {
    self = [super init];
    
    // Store artist id and name
    self.id = artist[@"id"];
    self.name = artist[@"name"];
    
    // Store URL of artist's profile image
    NSArray *images = artist[@"images"];
    NSDictionary *profileImage = images[0];
    self.profileImage = profileImage[@"url"];
    
    return self;
}

- (NSArray *)topTracks {
    return nil;
}

@end
