//
//  TrackSelectViewController.m
//  Tunes with Friends
//
//  Created by mattpdl on 7/28/21.
//

#import "TrackSelectViewController.h"
#import "SpotifyAPI.h"
#import "Track.h"
#import "TrackCell.h"

@interface TrackSelectViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tracksView;

@property (strong, nonatomic) Track *selectedTrack;
@property (strong, nonatomic) NSMutableArray *topTracks;

@end

@implementation TrackSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tracksView.dataSource = self;
    self.tracksView.delegate = self;
    
    const NSString *testArtistID = @"5INjqkS1o8h1imAzPqGZBb";
    self.topTracks = [[NSMutableArray alloc] init];
    
    [SpotifyAPI getTopTracks:testArtistID completion:^(NSDictionary * _Nonnull responseObject, NSError * _Nonnull error) {
        
        if (error) {
            NSLog(@"Error: %@", error.localizedDescription);
        } else {
            NSArray *tracks = responseObject[@"tracks"];
            
            for (NSDictionary *track in tracks) {
                [self.topTracks addObject:[[Track alloc] initWithDictionary:track]];
            }
            
            [self.tracksView reloadData];
        }
    }];
}

- (IBAction)didTapClose:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    TrackCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TrackCell" forIndexPath:indexPath];
    
    // Update cell only when new tracks fetched
    if (cell.track != self.topTracks[indexPath.row]) {
        cell.track = self.topTracks[indexPath.row];
        [cell updateCell];
    }
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.topTracks.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Set selected track property before segue
    self.selectedTrack = self.topTracks[indexPath.row];
}

@end
