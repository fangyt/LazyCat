//
//  YTTabBarButton.m
//  YTWeiBo
//
//  Created by 方永腾 on 16/8/24.
//  Copyright © 2016年 方永腾. All rights reserved.
//

// 图标比例
#define YTTabBarButtonImageRatio 0.6

// 按键默认颜色
#define YTTabBarButtonTitleColor YTColor(197,197,197)
// 按键选中颜色
#define YTTabBarButtonTitleSelectedColor YTColor(72,180,213)

#import "YTTabBarButton.h"
#import "YTBadgeButton.h"

@interface YTTabBarButton ()

@property (nonatomic ,weak) YTBadgeButton *bageButton;

@end

@implementation YTTabBarButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
//        [self setBackgroundImage:[UIImage imageWithName:@"tabbar_slider"]
//                                    forState:UIControlStateSelected];
        
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:12.0];
        
        [self setTitleColor:YTTabBarButtonTitleSelectedColor
                   forState:UIControlStateSelected];
        [self setTitleColor:YTTabBarButtonTitleColor
                   forState:UIControlStateNormal];
        
        YTBadgeButton *bageButton = [[YTBadgeButton alloc]init];
        bageButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
        [self addSubview:bageButton];
        self.bageButton = bageButton;
        
    };
    
    return self;
}

- (void)setItem:(UITabBarItem *)item
{
    _item = item;
   
    [self addMonitorObject:item
                properties:@[@"badgeValue",
                             @"title",
                             @"image",
                             @"selectedImage"]];
    
    [self observeValueForKeyPath:nil
                        ofObject:nil
                          change:nil
                         context:nil];

}

- (void)addMonitorObject:(id)object properties:(NSArray *)array
{
    for (NSString *tempStr in array)
    {
        [object addObserver:self forKeyPath:tempStr options:NSKeyValueObservingOptionNew context:nil];
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    [self setTitle:self.item.title forState
                  :UIControlStateNormal];
    [self setImage:self.item.image forState
                  :UIControlStateNormal];
    
    [self setImage:self.item.selectedImage
          forState:UIControlStateSelected];
    
    [self.bageButton badgeValue:self.item.badgeValue width:self.bounds.size.width];
    
    CGFloat bageX = self.frame.size.width - self.bageButton.frame.size.width ;
    CGFloat bageY = 5;
    
    if (self.item.badgeValue.length == 1 || self.item.badgeValue.length == 2)bageX -= 10.0;
    
    CGRect tempFrame = self.bageButton.frame;
    tempFrame.origin.x = bageX;
    tempFrame.origin.y = bageY;
    self.bageButton.frame = tempFrame;
    
}

- (void)setHighlighted:(BOOL)highlighted{}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageX = 0.0;
    CGFloat imageY = 0.0;
    CGFloat imageW = contentRect.size.width;
    CGFloat iamgeH = contentRect.size.height * YTTabBarButtonImageRatio;
    return CGRectMake(imageX, imageY, imageW, iamgeH);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0.0;
    CGFloat titleY = contentRect.size.height * YTTabBarButtonImageRatio;
    CGFloat tieltW = contentRect.size.width;
    CGFloat tieltH = contentRect.size.height - titleY;
    return CGRectMake(titleX, titleY, tieltW, tieltH);
}

- (void)dealloc
{
    [self removeObserver:self.item
              properties:@[@"badgeValue",
                           @"title",
                           @"image"]];

}

- (void)removeObserver:(NSObject *)observer properties:(NSArray *)array
{
    for (NSString *tempStr in array)
    {
        [observer removeObserver:self forKeyPath:tempStr];
    }
}

@end
