//
//  GCFloatingWindowAnimatedTransitioning.h
//  GodChat
//
//  Created by money on 2020/10/20.
//  Copyright © 2020 SQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

extern NSString *const GCFloatingWindowHiddenCompletedNotification;
extern NSString *const GCFloatingWindowShowCompletedNotification;
extern NSString *const GCFloatingWindowClickedNotification;

@interface GCFloatingWindowTransitioning : NSObject <UIViewControllerTransitioningDelegate>

+ (instancetype)shareTransition;
@property (nonatomic, assign, getter=isDismissed) BOOL dismissed;
@property (nonatomic, assign, getter=isFloatingWindow) BOOL floatingWindow;
@property (nonatomic, assign) CGRect floatingWindowFrame;

@end

NS_ASSUME_NONNULL_END
