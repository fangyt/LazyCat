//
//  LCHomeHeaView.h
//  LazyCat
//
//  Created by 方永腾 on 2016/11/21.
//  Copyright © 2016年 方永腾. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LCChannelView;

typedef void(^LCHomeHeaViewBlock)(LCChannelView *channelView, UIButton *button);

@interface LCHomeHeaView : UIView

@property (nonatomic , copy) LCHomeHeaViewBlock block;

@end
