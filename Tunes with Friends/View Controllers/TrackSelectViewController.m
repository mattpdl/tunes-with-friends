//
//  TrackSelectViewController.m
//  Tunes with Friends
//
//  Created by mattpdl on 7/28/21.
//

#import "TrackSelectViewController.h"
#import "CacheManager.h"
#import "ComposeViewController.h"
#import "SpotifyAPI.h"
#import "Track.h"
#import "TrackCell.h"

const NSString *testArtistID = @"7Ln80lUS6He07XvHI8qqHH";

@interface TrackSelectViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tracksView;

@property (strong, nonatomic) NSMutableArray<Track *> *tracks;

@end

@implementation TrackSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tracksView.dataSource = self;
    self.tracksView.delegate = self;
    
    self.tracks = [[NSMutableArray alloc] init];
    [self fetchTracks];
}

- (IBAction)didTapClose:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)fetchCachedTracks {
    // Initialize Track objects from cache and reload table view
    for (NSDictionary *track in CacheManager.defaultTracks) {
        [self.tracks addObject:[[Track alloc] initWithDictionary:track]];
    }
    
    [self.tracksView reloadData];
}

- (void)fetchTracks {
    // Load tracks from cache
    [self fetchCachedTracks];
    
    [SpotifyAPI getTopTracks:testArtistID completion:^(NSDictionary * _Nonnull responseObject, NSError * _Nonnull error) {
        
        if (error) {
            NSLog(@"Error: %@", error.localizedDescription);
        }
        
        else {
            // Update cached tracks with network data
            [self updateCachedTracks:responseObject];
        }
    }];
}

- (void)updateCachedTracks:(NSDictionary *)responseObject {
    NSArray<NSDictionary *> *newTracks = responseObject[@"tracks"];
    
    for (NSDictionary *newTrackDict in newTracks) {
        Track *newTrack = [[Track alloc] initWithDictionary:newTrackDict];
        
        // Update cached track with fetched track's metadata
        if ([CacheManager.defaultTrackIDs containsObject:newTrack.id]) {
            for (Track *cachedTrack in self.tracks) {
                if ([cachedTrack isEqualToTrack:newTrack]) {
                    [cachedTrack updateWithTrack:newTrack];
                }
            }
        }
        
        // New track not in cache
        else {
            [self.tracks addObject:newTrack];
        }
    }
    
    [self.tracksView reloadData];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Pass selected track to compose view controller
    UITableViewCell *selectedCell = sender;
    NSIndexPath *indexPath = [self.tracksView indexPathForCell:selectedCell];
    Track *selectedTrack = self.tracks[indexPath.row];
    NSString *selectedTrackID = selectedTrack.id;
    
    ComposeViewController *composeVC = [segue destinationViewController];
    composeVC.selectedTrackID = selectedTrackID;
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    TrackCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TrackCell" forIndexPath:indexPath];
    
    // Update cell only when new tracks fetched
    if (cell.track != self.tracks[indexPath.row]) {
        cell.playbackDelegate = self;
        cell.track = self.tracks[indexPath.row];
        [cell updateTrack];
    }
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tracks.count;
}

@end
