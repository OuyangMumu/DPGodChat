//
//  GCApplication.h
//  GodChat
//
//  Created by money on 2020/10/18.
//  Copyright © 2020 SQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface GCApplication : NSObject

+ (UIViewController *)windowRootViewController;
+ (UITabBarController *)rootTabViewController;
+ (UINavigationController *)currentSelectedRootNavigationController;

@end

NS_ASSUME_NONNULL_END
