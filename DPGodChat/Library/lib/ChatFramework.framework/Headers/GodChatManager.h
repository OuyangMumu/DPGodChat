//
//  GodChatManager.h
//  GodChat
//
//  Created by money on 2020/10/15.
//  Copyright © 2020 SQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCError.h"
#import "GCOptions.h"
NS_ASSUME_NONNULL_BEGIN

@interface GodChatManager : NSObject

+ (instancetype)manager;

#pragma mark - 初始化客服聊天的sdk

/// 初始化客服聊天的sdk （如果有更多的设置信息请使用-initiateGodChatSDKWithOptions：）
/// @param appkey 您客服系统中的appkey()
/// @param tenantId 您客服系统中的关联ID
/// @param projectId 您客服系统中的projectID(留言)
/// @param imNo 您客服系统中的im服务号
/// @param host 如果私有化部署, 请传入私有化地址, 默认情况传入 nil
+ (GCError *)initiateGodChatSDKWithAppkey:(NSString *)appkey
                                 tenantId:(NSString *)tenantId
                                projectId:(NSString *)projectId
                                     imNo:(NSString *)imNo
                                hostServe:(NSString *)host;

#pragma mark - 初始化客服聊天的sdk

/// 初始化客服聊天的sdk 
+ (GCError *)initiateGodChatSDKWithOptions:(GCOptions *)options;

@end

NS_ASSUME_NONNULL_END
