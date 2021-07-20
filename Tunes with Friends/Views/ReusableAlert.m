//
//  ReusableAlert.m
//  Tunes with Friends
//
//  Created by mattpdl on 7/17/21.
//

#import "ReusableAlert.h"

@implementation ReusableAlert

+ (void)show:(UIViewController *)vc withTitle:(NSString *)title withMsg:(NSString *)msg {
    // Create a UIAlertController object
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                               message:msg
                               preferredStyle:(UIAlertControllerStyleAlert)];
    
    // Create a dismiss action
    UIAlertAction *dismissAction = [UIAlertAction actionWithTitle:@"Dismiss" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {}];
    [alert addAction:dismissAction];
    
    // Display alert
    [vc presentViewController:alert animated:YES completion:nil];
}

@end
