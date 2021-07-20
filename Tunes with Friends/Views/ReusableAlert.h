//
//  ReusableAlert.h
//  Tunes with Friends
//
//  Created by mattpdl on 7/17/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ReusableAlert : NSObject

+ (void)show:(UIViewController *)vc withTitle:(NSString *)title withMsg:(NSString *)msg;

@end

NS_ASSUME_NONNULL_END
