//
//  UIView+lcExtension.m
//  5期-百思不得姐
//
//  Created by xiaomage on 15/11/6.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "UIView+XMGExtension.h"

@implementation UIView (lcExtension)

- (CGSize)lc_size
{
    return self.frame.size;
}

- (void)setlc_size:(CGSize)lc_size
{
    CGRect frame = self.frame;
    frame.size = lc_size;
    self.frame = frame;
}

- (CGFloat)lc_width
{
    return self.frame.size.width;
}

- (CGFloat)lc_height
{
    return self.frame.size.height;
}

- (void)setlc_width:(CGFloat)lc_width
{
    CGRect frame = self.frame;
    frame.size.width = lc_width;
    self.frame = frame;
}

- (void)setlc_height:(CGFloat)lc_height
{
    CGRect frame = self.frame;
    frame.size.height = lc_height;
    self.frame = frame;
}

- (CGFloat)lc_x
{
    return self.frame.origin.x;
}

- (void)setlc_x:(CGFloat)lc_x
{
    CGRect frame = self.frame;
    frame.origin.x = lc_x;
    self.frame = frame;
}

- (CGFloat)lc_y
{
    return self.frame.origin.y;
}

- (void)setlc_y:(CGFloat)lc_y
{
    CGRect frame = self.frame;
    frame.origin.y = lc_y;
    self.frame = frame;
}

- (CGFloat)lc_centerX
{
    return self.center.x;
}

- (void)setlc_centerX:(CGFloat)lc_centerX
{
    CGPoint center = self.center;
    center.x = lc_centerX;
    self.center = center;
}

- (CGFloat)lc_centerY
{
    return self.center.y;
}

- (void)setlc_centerY:(CGFloat)lc_centerY
{
    CGPoint center = self.center;
    center.y = lc_centerY;
    self.center = center;
}

- (CGFloat)lc_right
{
//    return self.lc_x + self.lc_width;
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)lc_bottom
{
//    return self.lc_y + self.lc_height;
    return CGRectGetMaxY(self.frame);
}

- (void)setlc_right:(CGFloat)lc_right
{
    self.lc_x = lc_right - self.lc_width;
}

- (void)setlc_bottom:(CGFloat)lc_bottom
{
    self.lc_y = lc_bottom - self.lc_height;
}
@end
