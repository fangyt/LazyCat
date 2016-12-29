//
//  LCCouponsReviewCell.h
//  LazyCat
//
//  Created by 方永腾 on 2016/12/13.
//  Copyright © 2016年 方永腾. All rights reserved.
//




#import "LCSettingBgCell.h"
#import "LCMeDelegate.h"
@class LCCouponsReview;

@interface LCCouponsReviewCell : LCSettingBgCell

+ (instancetype)ccouponsReviewCellWithTableView:(UITableView *)tableView;

@property (nonatomic , strong) LCCouponsReview *couponsReview;
@property (nonatomic ,weak)id <LCMeDelegate> meDelegate;
@end

