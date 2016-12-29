//
//  YTTabBar.m
//  YTWeiBo
//
//  Created by 方永腾 on 16/8/24.
//  Copyright © 2016年 方永腾. All rights reserved.
//

#import "YTTabBar.h"
#import "YTTabBarButton.h"

@interface YTTabBar()

@property (nonatomic ,strong)NSMutableArray *tabBarButtonsArray;

@property (nonatomic, weak) YTTabBarButton *selctedBtton;

@end

@implementation YTTabBar

-(NSMutableArray *)tabBarButtonsArray
{
    if (!_tabBarButtonsArray) {
        _tabBarButtonsArray = [NSMutableArray array];
    }
    return _tabBarButtonsArray;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
//        self.backgroundColor  = [UIColor colorWithPatternImage:[UIImage imageWithName:@"tabbar_background"]];
        
    }
    
    return self;
    
}

- (void)addTabBarButtonWithItem:(UITabBarItem *)item
{
    YTTabBarButton *button = [[YTTabBarButton alloc]init];
    button.item = item;
    [self addSubview:button];
    [self.tabBarButtonsArray addObject:button];
    
    [button addTarget:self action:@selector(buttonClike:) forControlEvents:UIControlEventTouchDown];
    
    if (self.tabBarButtonsArray.count == 1) [self buttonClike:button];

}


/**
 * 按键点击事件
 */
- (void)buttonClike:(YTTabBarButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(ytTabBar:didSelecteButton:to:)])
    {
        [self.delegate ytTabBar:self didSelecteButton:self.selctedBtton.tag to:btn.tag];
    }
    
    self.selctedBtton.selected = NO;
    btn.selected = YES;
    self.selctedBtton = btn;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat buttonW = self.frame.size.width / self.subviews.count;
    CGFloat buttonY = self.frame.origin.y;
    CGFloat buttonH = self.frame.size.height;
    
    for (NSInteger index = 0; index < self.tabBarButtonsArray.count; index ++)
    {
        YTTabBarButton *button = self.tabBarButtonsArray[index];
        
        CGFloat buttonX = buttonW * index;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        button.tag = index;
    }
}

@end
