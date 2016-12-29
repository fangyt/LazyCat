//
//  SettingItemCell.h
//  TableView
//
//  Created by FangYongTeng on 16/12/12.
//  Copyright © 2016年 FangYongTeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCSettingBgCell.h"
@class SettingItem;

@interface SettingItemCell : LCSettingBgCell

+ (instancetype)settingItemCellWithTableView:(UITableView *)tableView;
@property (nonatomic ,strong) SettingItem *item;

/**
 是否为当前组最后一行
 */
@property (nonatomic ,assign ,getter=isLastRowInSection) BOOL isLastRowInSection;

@end
