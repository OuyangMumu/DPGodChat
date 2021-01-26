//
//  DPAppDelegate.m
//  DPGodChat
//
//  Created by 804716454@qq.com on 01/22/2021.
//  Copyright (c) 2021 804716454@qq.com. All rights reserved.
//

#import "DPAppDelegate.h"
#import <ChatFramework/GodChatSDK.h>

@implementation DPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self initializeGodChatSDK];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.mainViewController = [[SQMainViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:self.mainViewController];
    [self configureNavigationController:navigationController];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

//初始化客服sdk
- (void)initializeGodChatSDK {
    
//    GCOptions *option = [[GCOptions alloc] init];
//    ///app唯一标识符
//    option.appkey = @"1431201109092031#kefuchannelapp87340";
//    ///租户ID
//    option.tenantId = @"87340";
//    ///您客服系统中的projectId
//    option.projectId = @"4138149";
//    ///IM 服务号
//    option.imNo = @"kefuchannelimid_617016";
//    option.kefuRestServer = @"https://kefu.easemob.com";
//        ///私有化部署禁用 DNS
//        option.enableDnsConfig = YES;
    
    GCOptions *option = [[GCOptions alloc] init];
    ///app唯一标识符
    option.appkey = @"100201023001656#kefuchannelapp1";
    ///租户ID
    option.tenantId = @"1";
    ///您客服系统中的projectId
    option.projectId = @"1001";
    ///IM 服务号
    option.imNo = @"kefuchannelimid_133710";

    ///私有化部署禁用 DNS
    option.enableDnsConfig = NO;
    ///客服REST服务器地址,默认:https://kefu.easemob.com, 私有化部署的话设置相应链接
    option.kefuRestServer = @"https://zwyt.szlhq.gov.cn";
    ///IM服务器端口, 私有化部署的话设置相应端口
    option.chatPort = 16717;
    ///IM服务器地址, 私有化部署的话设置相应链接
    option.chatServer = @"183.56.159.146";
    ///REST服务器地址, 私有化部署的话设置相应链接
    option.restServer = @"https://zwyt.szlhq.gov.cn:12002";
    
    option.appGroupID = @"group.deepexi.mobiebase.com";
    option.appExtetionID = @"deepexi.mobiebase.com.ShareScreen";
    
    GCError *initError = [GodChatManager initiateGodChatSDKWithOptions:option];
    if (initError) {
        NSLog(@"initialization_error");
        return;
    }
    
    //初始化sdk之后打印
    NSString *kfver = [HDClient sharedClient].sdkVersion;
    NSString *imver = [HDClient sharedClient].imSdkVersion;
    
    NSLog(@"kfver版本: %@  imver版本: %@", kfver, imver);
}

- (void)configureNavigationController:(UINavigationController *)navigationController {
    if ([UIDevice currentDevice].systemVersion.floatValue >= 7.0) {
        // dujiepeng  设置title
        [[UINavigationBar appearance] setBarTintColor:RGBACOLOR(184, 22, 22, 1)];
        [[UINavigationBar appearance] setTitleTextAttributes:
        [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:18.0], NSFontAttributeName, nil]];
        // 关闭导航半透明
        [[UINavigationBar appearance] setTranslucent:NO];
    }
    //设置7.0以下的导航栏
    if ([UIDevice currentDevice].systemVersion.floatValue < 7.0)
    {
        navigationController.navigationBar.barStyle = UIBarStyleDefault;
        [navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"titleBar"] forBarMetrics: UIBarMetricsDefault];
        [navigationController.navigationBar.layer setMasksToBounds:YES];
    }
}

@end
