//
//  SpotifyAPIWrapper.m
//  Tunes with Friends
//
//  Created by mattpdl on 7/21/21.
//

#import "SpotifyAPI.h"
#import "KeyManager.h"
#import <AFNetworking/AFHTTPSessionManager.h>
#import <AFNetworking/AFURLSessionManager.h>
#import "Track.h"

const static NSString* baseURLString = @"https://api.spotify.com/v1/";

@implementation SpotifyAPI

+ (void)getAccessToken:(void (^)(NSDictionary *, NSError *))completion {
    NSURL *baseURL = [NSURL URLWithString:@"https://accounts.spotify.com/"];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager manager] initWithBaseURL:baseURL];
    
    // Encode client credentials for use in authorization header
    NSString *clientID = KeyManager.spotifyClientID;
    NSString *clientSecret = KeyManager.spotifyClientSecret;
    NSString *credentials = [NSString stringWithFormat:@"%@:%@", clientID, clientSecret];
    NSString *encodedCredentials = [[credentials dataUsingEncoding:NSUTF8StringEncoding] base64EncodedStringWithOptions:0];
    NSString *authVal = [@"Basic " stringByAppendingString:encodedCredentials];
    NSDictionary *authHeader = @{@"Authorization": authVal};
    
    // Construct parameters and make POST request
    NSDictionary *params = @{@"grant_type": @"client_credentials"};
    
    [manager POST:@"api/token" parameters:params headers:authHeader progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            completion(responseObject, nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            completion(nil, error);
        }];
}

+ (void)getArtist:(NSString *)artistID completion:(void (^)(NSDictionary *, NSError *))completion {
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager manager] initWithBaseURL:baseURL];
    
    // Construct endpoint URL and make API call
    NSString *endpoint = [NSString stringWithFormat:@"artists/%@", artistID];
    
    [manager GET:endpoint parameters:nil headers:self.authHeader progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"%@", responseObject);
            completion(responseObject, nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            completion(nil, error);
        }];
}

+ (void)getPlaylist:(NSString *)playlistID completion:(void (^)(NSDictionary *, NSError *))completion {
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager manager] initWithBaseURL:baseURL];
    
    // Construct endpoint URL and make API call
    NSString *endpoint = [NSString stringWithFormat:@"playlists/%@/tracks?market=US", playlistID];
    
    [manager GET:endpoint parameters:nil headers:self.authHeader progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"Fetched tracks for playlist with ID '%@'", playlistID);
            completion(responseObject, nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            completion(nil, error);
        }];
}

+ (void)getTrack:(NSString *)trackID completion:(void (^)(NSDictionary *, NSError *))completion {
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager manager] initWithBaseURL:baseURL];
    
    // Construct endpoint URL and make API call
    NSString *endpoint = [NSString stringWithFormat:@"tracks/%@?market=US", trackID];
    
    [manager GET:endpoint parameters:nil headers:self.authHeader progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            completion(responseObject, nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            completion(nil, error);
        }];
}

+ (void)getTopTracks:(NSString *)artistID completion:(void (^)(NSDictionary *, NSError *))completion {
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager manager] initWithBaseURL:baseURL];
    
    // Construct endpoint URL and make API call
    NSString *endpoint = [NSString stringWithFormat:@"artists/%@/top-tracks?market=US", artistID];
    
    [manager GET:endpoint parameters:nil headers:self.authHeader progress:nil
        success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"Fetched top tracks for artist with ID '%@'", artistID);
            completion(responseObject, nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            completion(nil, error);
        }];
}

+ (void)searchTracks:(NSString *)query completion:(void (^)(NSDictionary *, NSError *))completion {
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager manager] initWithBaseURL:baseURL];
    
    // Construct endpoint URL and make API call
    NSString *endpoint = [NSString stringWithFormat:@"search?q=%@&type=track&market=US", query];
    
    [manager GET:endpoint parameters:nil headers:self.authHeader progress:nil
        success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"Fetched tracks matching query '%@'", query);
            completion(responseObject, nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            completion(nil, error);
        }];
}

+ (NSDictionary *)authHeader {
    NSString *bearerToken = [@"Bearer " stringByAppendingString:KeyManager.spotifyAccessToken];
    return @{@"Authorization": bearerToken};
}

@end
