//
//  LCTabBarViewController.m
//  LazyCat
//
//  Created by 方永腾 on 2016/11/20.
//  Copyright © 2016年 方永腾. All rights reserved.
//

#import "LCTabBarViewController.h"
#import "LCHomeViewController.h"
#import "LCDestinationViewController.h"
#import "LCShoppingViewController.h"
#import "LCMeViewController.h"

#import "LCNavigationController.h"

#import "YTTabBar.h"


@interface LCTabBarViewController ()<YTTabBarDelegate>

/**
 TabBar
 */
@property (nonatomic, weak) YTTabBar *customTabBar;

@end

@implementation LCTabBarViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    for (UIView *view in [self.tabBar subviews])
    {
        if ([view isKindOfClass:[UIControl class]])
        {
            [view removeFromSuperview];
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self seupTabBar];
    [self setupAllChildViewController];
}

/**
 *  初始化自定义TabBar
 */
- (void)seupTabBar
{
    YTTabBar *customTabBar = [[YTTabBar alloc]init];
    customTabBar.frame = self.tabBar.bounds;
    customTabBar.delegate = self;
    [self.tabBar addSubview:customTabBar];
    self.customTabBar  = customTabBar;
}

/**
 初始化所有控制器
 */
- (void)setupAllChildViewController
{

    
    LCHomeViewController *home  = [[LCHomeViewController alloc]init];
    [self setupVeiwController:home imageName:@"home" selectImageName:@"home_1" title:@"首页"];
    
    LCDestinationViewController *destionation = [[LCDestinationViewController alloc]init];
    [self setupVeiwController:destionation imageName:@"destination" selectImageName:@"destination_1" title:@"目的地"];
    
    LCShoppingViewController *shopping = [[LCShoppingViewController alloc]init];
    [self setupVeiwController:shopping imageName:@"shopping-cart" selectImageName:@"shopping-cart_1" title:@"购物车"];
    
    LCMeViewController *me = [[LCMeViewController alloc]init];
    [self setupVeiwController:me imageName:@"mine" selectImageName:@"mine_1" title:@"我的"];
   
    
}

/**
 *  初始化一个控制器
 *
 *  @param vc              需要初始化的子控制器
 *  @param tiltle          标题
 *  @param imageName       图片
 *  @param selectImageName 中图片
 */
- (void)setupVeiwController:(UIViewController *)vc imageName:(NSString *)imageName selectImageName:(NSString *)selectImageName title:(NSString *)tiltle
{
    vc.title = tiltle;
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectImageName];
    
    LCNavigationController *navi = [[LCNavigationController alloc]initWithRootViewController:vc];
    
    [self addChildViewController:navi];
    
    [self.customTabBar addTabBarButtonWithItem:vc.tabBarItem];

}

#pragma mark ---------TabBarDelegate----------
/**
 *  自定义TabBarDelegate
 *
 *  @param tabBar tabBar description
 *  @param form   当前选取按键
 *  @param to     即将被选中按键
 */
- (void)ytTabBar:(YTTabBar *)tabBar didSelecteButton:(NSInteger)form to:(NSInteger)to
{
    self.selectedIndex = to;
}



@end
