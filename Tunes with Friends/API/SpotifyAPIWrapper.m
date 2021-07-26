//
//  SpotifyAPIWrapper.m
//  Tunes with Friends
//
//  Created by mattpdl on 7/21/21.
//

#import "SpotifyAPIWrapper.h"
#import "KeyManager.h"
#import <AFNetworking/AFHTTPSessionManager.h>
#import <AFNetworking/AFURLSessionManager.h>

const static NSString* baseURLString = @"https://api.spotify.com/v1/";

@implementation SpotifyAPIWrapper

+ (void)getAccessToken:(void(^)(NSDictionary *, NSError *))completion {
    NSURL *baseURL = [NSURL URLWithString:@"https://accounts.spotify.com/"];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager manager] initWithBaseURL:baseURL];
    
    // Encode client credentials for use in authorization header
    NSString *clientID = [KeyManager spotifyClientID];
    NSString *clientSecret = [KeyManager spotifyClientSecret];
    NSString *credentials = [NSString stringWithFormat:@"%@:%@", clientID, clientSecret];
    NSString *encodedCredentials = [[credentials dataUsingEncoding:NSUTF8StringEncoding] base64EncodedStringWithOptions:0];
    NSString *authVal = [@"Basic " stringByAppendingString:encodedCredentials];
    NSDictionary *authHeader = @{@"Authorization": authVal};
    
    // Construct parameters and make POST request
    NSDictionary *params = @{@"grant_type": @"client_credentials"};
    
    [manager POST:@"api/token" parameters:params headers:authHeader progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"%@", responseObject);
            completion(responseObject, nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            completion(nil, error);
        }];
}

+ (void)getTrack:(NSString *)trackID completion:(void (^)(NSDictionary *, NSError *))completion {
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager manager] initWithBaseURL:baseURL];
    
    // Construct authorization header and API endpoint
    NSString *bearerToken = [@"Bearer " stringByAppendingString:[KeyManager spotifyAccessToken]];
    NSDictionary *authHeader = @{@"Authorization": bearerToken};
    NSString *endpoint = [NSString stringWithFormat:@"tracks/%@?market=US", trackID];
    
    [manager GET:endpoint parameters:nil headers:authHeader progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"%@", responseObject);
            completion(responseObject, nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            completion(nil, error);
        }];
}

+ (void)getTopTracks:(NSString *)artistID completion:(void (^)(NSDictionary *, NSError *))completion {
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:config];
    
    // Construct endpoint URL
    NSURL *URL = [NSURL URLWithString:[baseURLString stringByAppendingFormat:@"artists/%@/top-tracks?market=US", artistID]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    
    // Add access token to authorization header (currently hardcoded in Keys.plist)
    NSString *accessToken = [KeyManager spotifyAccessToken];
    NSString *bearerToken = [@"Bearer " stringByAppendingString:accessToken];
    [request addValue:bearerToken forHTTPHeaderField:@"Authorization"];
    
    NSURLSessionDataTask *task = [manager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            completion(nil, error);
        } else {
            NSLog(@"%@", responseObject);
            NSDictionary *topSongs = responseObject;
            completion(topSongs, nil);
        }
    }];
    
    [task resume];
}

@end
