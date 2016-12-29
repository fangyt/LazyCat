//
//  YTButton.m
//  TestCell
//
//  Created by FangYongTeng on 16/12/14.
//  Copyright © 2016年 FangYongTeng. All rights reserved.
//

#import "YTButton.h"

#define ButtonTitleRatio 0.4
#define ButtonImaegRatio 0.6

@implementation YTButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return self;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    
    CGFloat titleX = 0.0;
    CGFloat titleY = self.frame.size.height * ButtonImaegRatio;
    CGFloat titleW = self.frame.size.width;
    CGFloat titleH = self.frame.size.height - titleY;
    
    return CGRectMake(titleX, titleY, titleW, titleH);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageX = 0.0;
    CGFloat imageY = 0.0;
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = self.frame.size.height * ButtonImaegRatio;
    return CGRectMake(imageX, imageY, imageW, imageH);
}



@end
