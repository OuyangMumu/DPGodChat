//
//  EBSessionManager.h
//  GodChat
//
//  Created by money on 2020/10/18.
//  Copyright © 2020 SQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCChatViewController.h"
#import "HDCallViewController.h"
#import "GCFloatingWindowTransitioning.h"

extern NSString * _Nullable const GCChatMessageUpdateNotification;
extern NSString * _Nullable const GCChatMessageUpdateNumberKey;
NS_ASSUME_NONNULL_BEGIN

@interface GCSessionManager : NSObject

@property (nonatomic, strong) NSString *appkey;  // 您客服系统中的appkey()

@property (nonatomic, strong) NSString *cname;  // 您客服系统中的im服务号

@property (nonatomic, strong) NSString *nickname; // 当前登录账号的昵称

@property (nonatomic, strong) NSString *avatarStr; // 当前登录账号的头像url

@property (nonatomic, strong) NSString *username;  // 当前登录账号对应的id

@property (nonatomic, strong) NSString *password;   // 当前登录账号对应的密码

@property (nonatomic, strong) NSString *tenantId;   // 您客服系统中的关联ID

@property (nonatomic, strong) NSString *projectId;  // 您客服系统中的租户ID(留言)

@property (nonatomic, strong) NSString *appGroupID; //创建的 APPGroup的名字
@property (nonatomic, strong) NSString *appExtetionID; //创建的APPExtetion的名字

@property (nonatomic, strong) HDVisitorInfo *visitorInfo; //访客信息

@property (nonatomic, assign, readonly) BOOL isLogged;// 是否已登录

@property (nonatomic, assign, readonly) NSInteger unreadMessageNum;// 未读消息数量

@property (nonatomic, strong, nullable) GCChatViewController *gcChatVC; //当前聊天界面
@property (nonatomic, strong, nullable) HDCallViewController *gcCallVC; //当前视频聊天界面
@property (nonatomic, strong, nullable) GCFloatingWindowTransitioning *floatingWindowTransitioning; //

+ (instancetype)shareSessionManager;

#pragma mark - push一个客服聊天界面
- (void)pushGodChatViewControllerWithAnimated:(BOOL)animated;
- (void)pushGodChatViewControllerWithUsername:(NSString *)username password:(NSString *)password animated:(BOOL)animated;

#pragma mark - 唤起一个客服聊天界面
- (void)presentGodCallViewControllerWithAnimated:(BOOL)animated;
- (void)presentGodCallViewControllerWithUsername:(NSString *)username password:(NSString *)password animated:(BOOL)animated;

#pragma mark - 注册一个与客服的通信的账号
- (BOOL)registerIMNoWithUsername:(NSString *)username password:(NSString *)password;

#pragma mark - 登出（退出）与客服的通信的账号
- (BOOL)logoutIMNoSession;

#pragma mark - 清空未读信息(表示已读)
- (void)clearUnreadMessage;

@end

NS_ASSUME_NONNULL_END
