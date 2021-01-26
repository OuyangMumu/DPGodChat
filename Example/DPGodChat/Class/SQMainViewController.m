//
//  SQMainViewController.m
//  GodChat
//
//  Created by money on 2020/10/15.
//  Copyright © 2020 SQ. All rights reserved.
//

#import "SQMainViewController.h"
#import "SQHomeViewController.h"
#import "SQMineViewController.h"

@interface SQMainViewController ()

@end

@implementation SQMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBarController.hidesBottomBarWhenPushed = YES;
    
    [self setupSubviews];
    self.selectedIndex = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)setupSubviews
{
    if ([UIDevice currentDevice].systemVersion.floatValue >= 7)
    {
        self.tabBar.tintColor = [UIColor colorWithRed:184/255.0 green:22/255.0 blue:22/255.0 alpha:1.0];
    }
    else{
        self.tabBar.tintColor = [UIColor colorWithWhite:1.0 alpha:0.8];
    }
    //商城
    SQHomeViewController *homeVC = [[SQHomeViewController alloc] initWithNibName:nil bundle:nil];
    [self setupController:homeVC
                    title:@"首页"
                imageName:@"em_nav_shop_normal"
        selectedImageName:@"em_nav_shop_select"
                      tag:0];

    SQMineViewController *mineVC = [[SQMineViewController alloc] initWithNibName:nil bundle:nil];
        
    [self setupController:mineVC
                    title:@"我的"
                imageName:@"em_nav_ticket_select"
        selectedImageName:@"em_nav_ticket_normal"
                      tag:1];
    self.viewControllers = @[homeVC, mineVC];
}

- (void)setupController:(UIViewController *)aController
                  title:(NSString *)aItemTitle
              imageName:(NSString *)aImageName
      selectedImageName:(NSString *)aSelectedImageName
                    tag:(int)tag{
    
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:aItemTitle
            image:[UIImage imageNamed:aImageName]
    selectedImage:[UIImage imageNamed:aSelectedImageName]];
    tabBarItem.tag = tag;
    
    [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                        [UIFont systemFontOfSize:10], NSFontAttributeName,[UIColor blackColor],NSForegroundColorAttributeName,
                                        nil] forState:UIControlStateNormal];
    
    [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                        [UIFont systemFontOfSize:10],
                                        NSFontAttributeName,[UIColor colorWithRed:184/255.0 green:22/255.0 blue:22/255.0 alpha:1.0],NSForegroundColorAttributeName,
                                        nil] forState:UIControlStateSelected];
    
    aController.tabBarItem = tabBarItem;

    aController.view.autoresizingMask = UIViewAutoresizingFlexibleHeight;
}


@end
