//
//  SpotifyAPIWrapper.m
//  Tunes with Friends
//
//  Created by mattpdl on 7/21/21.
//

#import "SpotifyAPIWrapper.h"
#import <AFNetworking/AFURLSessionManager.h>

const static NSString* baseURL = @"https://api.spotify.com/v1/";

@implementation SpotifyAPIWrapper

+ (void)getTopTracks:(void (^)(NSDictionary *, NSError *))completion {
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:config];
    
    // Construct endpoint URL (currently hardcoded for the Beatles' top tracks)
    NSURL *URL = [NSURL URLWithString:[baseURL stringByAppendingString:@"artists/3WrFJ7ztbogyGnTHbHJFl2/top-tracks?market=US"]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    
    // TODO: get access token with API keys
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Keys" ofType:@"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
    
    // Add access token to authorization header (currently hardcoded in Keys.plist)
    NSString *bearerToken = [@"Bearer " stringByAppendingString:dict[@"spotify_access_token"]];
    [request addValue:bearerToken forHTTPHeaderField:@"Authorization"];
    
    NSURLSessionDataTask *task = [manager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            completion(nil, error);
        } else {
            NSLog(@"%@ %@", response, responseObject);
            NSDictionary *topSongs = responseObject;
            completion(topSongs, nil);
        }
    }];
    
    [task resume];
}

@end
