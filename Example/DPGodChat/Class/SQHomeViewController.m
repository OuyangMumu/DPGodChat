//
//  SQHomeViewController.m
//  GodChat
//
//  Created by money on 2020/10/15.
//  Copyright © 2020 SQ. All rights reserved.
//

#import "SQHomeViewController.h"
#import <ChatFramework/GCChatViewController.h>
#import "GCWebViewController.h"
#import <ChatFramework/GodChatSDK.h>

@interface SQHomeViewController ()

@property (nonatomic, strong) UILabel *messageLabel;

@end

@implementation SQHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(lookNewMessage:) name:GCChatMessageUpdateNotification object:nil];
    
    UIButton *customerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    customerButton.bounds = CGRectMake(0, 0, 200, 50);
    customerButton.center = CGPointMake(UIScreen.mainScreen.bounds.size.width * 0.5, UIScreen.mainScreen.bounds.size.height * 0.5 - 50);
    [customerButton setBackgroundColor:[UIColor blueColor]];
    [customerButton setTitle:@"客服聊天" forState:UIControlStateNormal];
    [customerButton addTarget:self action:@selector(clickedCustomer:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:customerButton];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.bounds = CGRectMake(0, 0, 200, 50);
    button.center = CGPointMake(UIScreen.mainScreen.bounds.size.width * 0.5, UIScreen.mainScreen.bounds.size.height * 0.5 + 20);
    [button setBackgroundColor:[UIColor blueColor]];
    [button setTitle:@"视频聊天" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickedVedio) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *htmlButton = [UIButton buttonWithType:UIButtonTypeCustom];
    htmlButton.bounds = CGRectMake(0, 0, 200, 50);
    htmlButton.center = CGPointMake(UIScreen.mainScreen.bounds.size.width * 0.5, UIScreen.mainScreen.bounds.size.height * 0.5 + 20+70);
    [htmlButton setBackgroundColor:[UIColor blueColor]];
    [htmlButton setTitle:@"跳转H5" forState:UIControlStateNormal];
    [htmlButton addTarget:self action:@selector(clickedHtml) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:htmlButton];
    
}

- (void)lookNewMessage:(NSNotification *)notif
{
    NSLog(@"%@", notif.userInfo);
    NSInteger num = [notif.userInfo[GCChatMessageUpdateNumberKey] integerValue];
    NSString *message = [NSString stringWithFormat:@"%ld", num];
    self.messageLabel.text = message;
    [self.messageLabel setHidden:(num<=0)];
}

- (void)clickedCustomer:(UIButton *)button
{
    NSLog(@"客服");
    self.messageLabel.center = CGPointMake(button.center.x + button.bounds.size.width * 0.5, button.center.y - button.bounds.size.height * 0.5);
    [self.messageLabel setHidden:YES];
    [[GCSessionManager shareSessionManager] clearUnreadMessage];
    [[GCSessionManager shareSessionManager] pushGodChatViewControllerWithAnimated:YES];
}

- (void)clickedVedio
{
    NSLog(@"视频");
    [[GCSessionManager shareSessionManager] presentGodCallViewControllerWithAnimated:YES];
}

- (void)clickedHtml
{
    NSLog(@"跳转H5");
    GCWebViewController *webVC = [[GCWebViewController alloc] init];
    [self.navigationController pushViewController:webVC animated:YES];
}

- (UILabel *)messageLabel
{
    if (_messageLabel == nil)
    {
        _messageLabel = [[UILabel alloc] init];
        _messageLabel.backgroundColor = [UIColor redColor];
        _messageLabel.textColor = [UIColor whiteColor];
        _messageLabel.bounds = CGRectMake(0, 0, 30, 30);
        _messageLabel.layer.cornerRadius = 15;
        _messageLabel.layer.masksToBounds = YES;
        _messageLabel.hidden = YES;
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:_messageLabel];
    }
    return _messageLabel;
}

@end
