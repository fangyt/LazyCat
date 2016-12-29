//
//  YTBadgeButton.h
//  YTWeiBo
//
//  Created by 方永腾 on 16/8/25.
//  Copyright © 2016年 方永腾. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YTBadgeButton : UIButton

//@property (nonatomic, copy) NSString *badgeValue;

- (void)badgeValue:(NSString *)bageValue width:(CGFloat)width;

@end
