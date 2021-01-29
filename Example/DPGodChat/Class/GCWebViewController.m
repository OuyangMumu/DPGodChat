//
//  GCWebViewController.m
//  GodChat
//
//  Created by money on 2020/10/21.
//  Copyright © 2020 SQ. All rights reserved.
//

#import "GCWebViewController.h"
#import <WebKit/WebKit.h>
#import <ChatFramework/GodChatSDK.h>

@interface GCWebViewController ()<WKNavigationDelegate, WKUIDelegate, WKScriptMessageHandler>

@property (nonatomic, strong) WKWebView *wkWebView;
@property (nonatomic, strong) UIProgressView *progressView;

@end

@implementation GCWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.view addSubview:self.wkWebView];
    [self.wkWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://zwyt.szlhq.gov.cn/one-hall-dev/?userType=3"]]];
    [self.view addSubview:self.progressView];
}

#pragma mark - WKScriptMessageHandler

/** 通过网页返回的方法名调用我们写的方法 */
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    if ([message.name isEqualToString:@"videoChat"]) {
        [self videoChat:message.body];
    }
}

- (void)videoChat:(NSDictionary *)params {
    NSLog(@"videoChat");
    NSLog(@"视频");
   
    [[GCSessionManager shareSessionManager] presentGodCallViewControllerWithUsername:params[@"username"] token:params[@"token"] animated:YES];
    [[GCSessionManager shareSessionManager] presentGodCallViewControllerWithAnimated:YES];
}

#pragma mark - 设置网页加载的进度条KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"estimatedProgress"] && object == self.wkWebView) {
        [self.progressView setProgress:self.wkWebView.estimatedProgress animated:YES];
        if (self.wkWebView.estimatedProgress >= 1.0) {
            [UIView animateWithDuration:0.3 delay:0.3 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                [self.progressView setAlpha:0.0];
            } completion:^(BOOL finished) {
                [self.progressView setAlpha:1.0];
                [self.progressView setProgress:0.0f animated:NO];
            }];
        }
    }
}

#pragma mark - private getter

- (WKWebView *)wkWebView
{
    if (!_wkWebView) {
        WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
        [config.userContentController addScriptMessageHandler:self name:@"videoChat"];
        _wkWebView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 64) configuration:config];
        _wkWebView.navigationDelegate = self;
        _wkWebView.UIDelegate = self;
        [_wkWebView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    }
    return _wkWebView;
}

- (UIProgressView *)progressView
{
    if (!_progressView) {
        _progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
        _progressView.progressTintColor = [UIColor colorWithRed:51/255.0 green:205/255.0 blue:154/255.0 alpha:1.0];
        _progressView.trackTintColor = [UIColor whiteColor];
        _progressView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 5);
    }
    return _progressView;
}

- (void)dealloc
{
    if (_wkWebView)
    {
        [_wkWebView.configuration.userContentController removeScriptMessageHandlerForName:@"videoChat"];
        [_wkWebView removeObserver:self forKeyPath:@"estimatedProgress"];
    }
}

@end
