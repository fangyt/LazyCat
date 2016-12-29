//
//  SettingItemCell.m
//  TableView
//
//  Created by FangYongTeng on 16/12/12.
//  Copyright © 2016年 FangYongTeng. All rights reserved.
//

#import "SettingItemCell.h"
#import "SettingItem.h"
#import "SettingArrowItem.h"

@interface SettingItemCell()

@property (nonatomic ,strong) UIImageView *arrowIamgeView;

@end
@implementation SettingItemCell

#define mkdir -----私有属性初始化－－－－－－－－－
- (UIImageView *)arrowIamgeView
{
    if (!_arrowIamgeView)
    {
        _arrowIamgeView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"next"]];
    }
    
    return _arrowIamgeView;
}


+ (instancetype)settingItemCellWithTableView:(UITableView *)tableView
{
    static NSString *cellID = @"SettingItemCell.h";
    SettingItemCell *itemCell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!itemCell)
    {
        itemCell = [[SettingItemCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    return itemCell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return self;
}


- (void)setItem:(SettingItem *)item
{
    _item = item;
    
    [self setupData];
    
    [self setupRightView];
}

- (void)setupData
{
    self.textLabel.text = self.item.title;
    if (self.item.icon)
    {
        self.imageView.image = [UIImage imageNamed:self.item.icon];
    }
    
}

- (void)setupRightView
{
    if ([self.item isKindOfClass:[SettingArrowItem class]])
    {
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        self.accessoryView = self.arrowIamgeView;
    }
    else
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.accessoryView = nil;
    }

}

@end
