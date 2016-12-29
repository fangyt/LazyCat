//
//  LCChannelView.h
//  LazyCat
//
//  Created by 方永腾 on 2016/11/23.
//  Copyright © 2016年 方永腾. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LCChannelView;
@protocol LCChannelViewDelegate <NSObject>

@optional
- (void)channelView:(LCChannelView *)channelView selectButton:(UIButton *)button;

@end
@interface LCChannelView : UIView

@property (nonatomic , weak) id<LCChannelViewDelegate> channelViewDelegate;

@end
