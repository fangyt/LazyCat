//
//  LCMeDelegate.h
//  LazyCat
//
//  Created by 方永腾 on 2016/12/15.
//  Copyright © 2016年 方永腾. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LCOderCell;
@class LCCouponsReviewCell;

@protocol LCMeDelegate <NSObject>

@optional
/**
 当前点击的按键
 @param cell LCCouponsReviewCell
 @param index  当前点击的按键位置
 */
- (void)order:(LCOderCell *)cell
didSelecteIndex:(NSInteger)index;

/**
 @param index 选中按键位置
 */
- (void)couponsReview:(LCCouponsReviewCell *)coupons
      didSelecteIndex:(NSInteger )index;
@end
