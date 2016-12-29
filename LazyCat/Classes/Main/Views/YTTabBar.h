//
//  YTTabBar.h
//  YTWeiBo
//
//  Created by 方永腾 on 16/8/24.
//  Copyright © 2016年 方永腾. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YTTabBar;

@protocol  YTTabBarDelegate<NSObject>

@optional
- (void)ytTabBar:(YTTabBar *)tabBar didSelecteButton:(NSInteger )form to:(NSInteger)to;

@end

@interface YTTabBar : UIView
@property (nonatomic, weak) id <YTTabBarDelegate>delegate;

- (void)addTabBarButtonWithItem:(UITabBarItem *)item;

@end
