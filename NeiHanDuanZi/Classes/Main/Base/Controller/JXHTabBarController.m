//
//  JXHTabBarController.m
//  NeiHanDuanZi
//
//  Created by juxiaohui on 16/9/14.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import "JXHTabBarController.h"
#import "JXHNavigationController.h"
#import "JXHHomeViewController.h"
#import "JXHDiscoverViewController.h"
#import "JXHCheckViewController.h"
#import "JXHMessageViewController.h"

@interface JXHTabBarController ()

@end

@implementation JXHTabBarController

/**
 *  单例实现
 */
JXHSingletonM(JXHTabBarController)


+(void)initialize{
    
     [UITabBar appearance].barTintColor = [UIColor colorWithRed:0.97f green:0.97f blue:0.97f alpha:1.00f];
    
//    [[UITabBarItem appearance] setTitlePositionAdjustment:UIOffsetMake(0, 1.5)];
//    
    NSMutableDictionary * normalDic = [NSMutableDictionary dictionary];
    
    normalDic[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.62f green:0.62f blue:0.63f alpha:1.00f];
    
    normalDic[NSFontAttributeName] =JXHNormalFont(12);
    
    NSMutableDictionary * selectlDic = [NSMutableDictionary dictionary];
    
    selectlDic[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.42f green:0.33f blue:0.27f alpha:1.00f];
    
    [[UITabBarItem appearance] setTitleTextAttributes:normalDic forState:UIControlStateNormal];
    
    [[UITabBarItem appearance] setTitleTextAttributes:selectlDic forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildController];
}

-(void)addChildController{
    
    [self setupChildVc:[[JXHHomeViewController alloc] init] title:@"首页" image:@"home" selectedImage:@"home_press"];
    
    [self setupChildVc:[[JXHDiscoverViewController alloc] init] title:@"发现" image:@"Found" selectedImage:@"Found_press"];
    
    [self setupChildVc:[[JXHCheckViewController alloc] init] title:@"审核" image:@"audit" selectedImage:@"audit_press"];
    
    [self setupChildVc:[[JXHMessageViewController alloc] init] title:@"消息" image:@"newstab" selectedImage:@"newstab_press"];
    
}
- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 包装一个导航控制器
    JXHNavigationController *nav = [[JXHNavigationController alloc] initWithRootViewController:vc];
    
    [self addChildViewController:nav];
    
    // 设置子控制器的tabBarItem
    nav.tabBarItem.title = title;
    
    nav.tabBarItem.image = [UIImage imageNamed:image];
    
    nav.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
