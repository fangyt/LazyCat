//
//  LCOderCell.h
//  LazyCat
//
//  Created by 方永腾 on 2016/12/15.
//  Copyright © 2016年 方永腾. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCMeDelegate.h"
@class LCOrder;

@interface LCOderCell : UITableViewCell

+ (instancetype)oderCellWithTableVeiw:(UITableView *)tableView;

@property (nonatomic , strong) LCOrder *order;
@property (nonatomic , weak) id<LCMeDelegate> meDelegate;

@end
