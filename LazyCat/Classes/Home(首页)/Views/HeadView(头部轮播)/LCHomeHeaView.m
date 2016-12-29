//
//  LCHomeHeaView.m
//  LazyCat
//
//  Created by 方永腾 on 2016/11/21.
//  Copyright © 2016年 方永腾. All rights reserved.
//

#import "LCHomeHeaView.h"
#import "ZLScrolling.h"
#import "LCChannelView.h"


@interface LCHomeHeaView ()<ZLScrollingDelegate,LCChannelViewDelegate>


@end
@implementation LCHomeHeaView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        
      ZLScrolling *scrolling = [[ZLScrolling alloc]initWithCurrentView:self frame:CGRectMake(0, 0, self.frame.size.width, 250) photos:@[@"1"] placeholderImage:[UIImage imageNamed:@""]];
        scrolling.delegate = self;
        
        CGFloat channeViewH = frame.size.height - CGRectGetMaxY(scrolling.view.frame) - HomeMargin;
        CGFloat channeViewY = CGRectGetMaxY(scrolling.view.frame) + HomeMargin;
        LCChannelView *channeView = [[LCChannelView alloc]init];
        channeView.channelViewDelegate = self;
        channeView.frame = CGRectMake(0, channeViewY,frame.size.width , channeViewH);
        channeView.backgroundColor = [UIColor redColor];
      
        [self addSubview:channeView];
        
        
    }
    
    return self;
}

- (void)channelView:(LCChannelView *)channelView selectButton:(UIButton *)button
{
    if (self.block)
    {
        self.block(channelView,button);
    }
}

@end
