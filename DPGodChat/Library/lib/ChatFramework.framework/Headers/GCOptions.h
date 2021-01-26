//
//  GCOptions.h
//  GodChat
//
//  Created by money on 2020/10/15.
//  Copyright © 2020 SQ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GCOptions : NSObject


/*!
 *  屏幕共享使用
 * 创建的 APPGroup的名字
 */
@property (nonatomic, strong) NSString *appGroupID;


/*!
 *  屏幕共享使用
 * 创建的APPExtetion的名字
 */
@property (nonatomic, strong) NSString *appExtetionID;


/*!
 *  \~chinese
 *  app唯一标识符
 */
@property (nonatomic, strong) NSString *appkey;

/*!
*  \~chinese
*  IM 服务号
*/
@property (nonatomic, strong) NSString *imNo;

/*!
 *  \~chinese
 *  租户ID
 */
@property (nonatomic,copy) NSString *tenantId;

@property (nonatomic, strong) NSString *projectId;  // 您客服系统中的projectId（留言）

/*!
 *  \~chinese
 *  控制台是否输出log, 默认为NO
 */
@property (nonatomic, assign) BOOL enableConsoleLog;

/*!
 *  \~chinese
 *  iOS特有属性，推送证书的名称
 *
 *  只能在[HDClient initializeSDKWithOptions:]时设置，不能在程序运行过程中动态修改
 */
@property (nonatomic, strong) NSString *apnsCertName;

/***************SDK 私有部署属性*************/

/*!
 *  \~chinese
 *  是否允许使用DNS, 默认为YES
 *
 *  只能在[HDClient initializeSDKWithOptions:]中设置，不能在程序运行过程中动态修改。 runtime
 */
@property (nonatomic, assign) BOOL enableDnsConfig;

/*!
 *  \~chinese
 *  IM服务器端口
 *
 *  enableDnsConfig为NO时有效。只能在[HDClient initializeSDKWithOptions:]中设置，不能在程序运行过程中动态修改 in runtime
 */
@property (nonatomic, assign) int chatPort;

/*!
 *  \~chinese
 *  IM服务器地址
 *
 *  enableDnsConfig为NO时生效。只能在[HDClient initializeSDKWithOptions:]中设置，不能在程序运行过程中动态修改
 */
@property (nonatomic, copy) NSString *chatServer;

/*!
 *  \~chinese
 *  REST服务器地址
 *
 *  enableDnsConfig为NO时生效。只能在[HDClient initializeSDKWithOptions:]中设置，不能在程序运行过程中动态修改
 */

@property (nonatomic, copy) NSString *restServer;

/**
 *  客服REST服务器地址,默认:https://kefu.easemob.com ,没有设置的情况下都使用默认地址
 *  只能在[HDClient initializeSDKWithOptions:]中设置，不能在程序运行过程中动态修改
 */
@property (nonatomic,copy) NSString *kefuRestServer;

/**
 是否需要待接入排队功能
 */
@property (nonatomic, assign) BOOL visitorWaitCount;


/**
 是否显示坐席输入状态
 */
@property (nonatomic, assign) BOOL showAgentInputState;

@property (nonatomic, assign) BOOL useIm;

@property (nonatomic) BOOL isAutoLogin;

@end

NS_ASSUME_NONNULL_END
