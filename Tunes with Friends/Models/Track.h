//
//  Track.h
//  Tunes with Friends
//
//  Created by mattpdl on 7/26/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Track : NSObject

@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *artist;
@property (nonatomic, strong) NSString *album;
@property (nonatomic, strong) NSURL *coverArt;
@property (nonatomic, strong) NSURL *audioSample;

- (instancetype)initWithDictionary:(NSDictionary *)track;

@end

NS_ASSUME_NONNULL_END
