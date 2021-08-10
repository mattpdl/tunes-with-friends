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

@interface TrackSelectViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tracksView;

@property (strong, nonatomic) NSMutableArray<Track *> *topTracks;

@end

@implementation TrackSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tracksView.dataSource = self;
    self.tracksView.delegate = self;
    
    self.topTracks = [[NSMutableArray alloc] init];
    [self fetchTracks];
}

- (IBAction)didTapClose:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)fetchTracks {
    const NSString *testArtistID = @"7Ln80lUS6He07XvHI8qqHH";
    
    [SpotifyAPI getTopTracks:testArtistID completion:^(NSDictionary * _Nonnull responseObject, NSError * _Nonnull error) {
        
        NSArray *tracks;
        
        // Load tracks from cache if no network response
        if (error) {
            NSLog(@"Error: %@", error.localizedDescription);
            tracks = CacheManager.defaultTracks;
        }
        
        // Cache tracks if loaded from network
        else {
            tracks = responseObject[@"tracks"];
            [CacheManager cacheTracks:tracks];
        }
            
        // Initialize topTracks with Track objects
        for (NSDictionary *track in tracks) {
            [self.topTracks addObject:[[Track alloc] initWithDictionary:track]];
        }
        
        [self.tracksView reloadData];
    }];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Pass selected track to compose view controller
    UITableViewCell *selectedCell = sender;
    NSIndexPath *indexPath = [self.tracksView indexPathForCell:selectedCell];
    Track *selectedTrack = self.topTracks[indexPath.row];
    NSString *selectedTrackID = selectedTrack.id;
    
    ComposeViewController *composeVC = [segue destinationViewController];
    composeVC.selectedTrackID = selectedTrackID;
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    TrackCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TrackCell" forIndexPath:indexPath];
    
    // Update cell only when new tracks fetched
    if (cell.track != self.topTracks[indexPath.row]) {
        cell.playbackDelegate = self;
        cell.track = self.topTracks[indexPath.row];
        [cell updateTrack];
    }
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.topTracks.count;
}

@end
