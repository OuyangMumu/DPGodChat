# DPGodChat

[![CI Status](https://img.shields.io/travis/804716454@qq.com/DPGodChat.svg?style=flat)](https://travis-ci.org/804716454@qq.com/DPGodChat)
[![Version](https://img.shields.io/cocoapods/v/DPGodChat.svg?style=flat)](https://cocoapods.org/pods/DPGodChat)
[![License](https://img.shields.io/cocoapods/l/DPGodChat.svg?style=flat)](https://cocoapods.org/pods/DPGodChat)
[![Platform](https://img.shields.io/cocoapods/p/DPGodChat.svg?style=flat)](https://cocoapods.org/pods/DPGodChat)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

DPGodChat is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'DPGodChat'
```

## Author

804716454@qq.com, 804716454@qq.com

## 使用:

### 唤起客服聊天原生界面
![image.png](https://upload-images.jianshu.io/upload_images/2005252-240e9b538bbd8e68.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)



```
#import <ChatFramework/GCChatViewController.h>
#import <ChatFramework/GodChatSDK.h>

[[GCSessionManager shareSessionManager] presentGodCallViewControllerWithUsername:@"" password:@"" animated:YES];

```







### 网页发起视频聊天



![image.png](https://upload-images.jianshu.io/upload_images/2005252-ae2ec3c10f47666a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
```
#import <ChatFramework/GodChatSDK.h>

注册js监听事件
WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
        [config.userContentController addScriptMessageHandler:self name:@"videoChat"];


/** 通过网页返回的方法名调用我们写的方法 */
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    if ([message.name isEqualToString:@"videoChat"]) {
        [self videoChat:message.body];
    }
}


- (void)videoChat:(NSDictionary *)params {
    NSLog(@"videoChat");   
    [[GCSessionManager shareSessionManager] presentGodCallViewControllerWithUsername:params[@"username"] token:params[@"token"] animated:YES];
    [[GCSessionManager shareSessionManager] presentGodCallViewControllerWithAnimated:YES];
}


- (void)dealloc
{
    if (_wkWebView)
    {
        [_wkWebView.configuration.userContentController removeScriptMessageHandlerForName:@"videoChat"];
    }
}
        
```
## License

DPGodChat is available under the MIT license. See the LICENSE file for more info.
