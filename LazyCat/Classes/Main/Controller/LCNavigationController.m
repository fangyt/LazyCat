//
//  LCNavigationController.m
//  LazyCat
//
//  Created by 方永腾 on 2016/12/18.
//  Copyright © 2016年 方永腾. All rights reserved.
//

#import "LCNavigationController.h"

@interface LCNavigationController ()

@end

@implementation LCNavigationController

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0)
    {
        viewController.hidesBottomBarWhenPushed = YES;
        
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"back"
                                                                         higlightedImage:nil
                                                                                  target:self
                                                                                  action:@selector(back)];
        
//        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"back"
//                                                                          higlightedImage:nil
//                                                                                   target:self
//                                                                                   action:@selector(more)];
    }
    
    [super pushViewController:viewController
                     animated:animated];
}

/**
 *  返回
 */
- (void)back
{
    [self popViewControllerAnimated:YES];
}

/**
 *  更多
 */
- (void)more
{
    [self popToRootViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
        // 重新拥有滑动出栈的功能
    self.interactivePopGestureRecognizer.delegate = nil;
}
@end
