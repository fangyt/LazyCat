//
//  YTBadgeButton.m
//  YTWeiBo
//
//  Created by 方永腾 on 16/8/25.
//  Copyright © 2016年 方永腾. All rights reserved.
//

#import "YTBadgeButton.h"

@implementation YTBadgeButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.userInteractionEnabled = NO;
        self.hidden = YES;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:11.0];
//        [self setBackgroundImage:[UIImage resizeImageWithName:@"main_badge"]
//                        forState:UIControlStateNormal];
    }
    
    return self;
}

- (void)badgeValue:(NSString *)bageValue width:(CGFloat)width
{
    if (bageValue.length != 0 && [bageValue integerValue])
    {
        self.hidden = NO;
        [self setTitle:bageValue
              forState:UIControlStateNormal];
        
        CGRect frame = self.frame;
        CGSize size = self.currentBackgroundImage.size;
        
        if (bageValue.length > 1)
        {
            size = [NSString getHeightWithString:bageValue
                                           width:width font:12.0];
            size = CGSizeMake(size.width, self.currentBackgroundImage.size.height);
            size.width += 5.0;
        }
        
        frame.size = size;
        self.frame = frame;
    }
    else
    {
        self.hidden = YES;
    }

}

@end
