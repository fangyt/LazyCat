//
//  LCOderCell.m
//  LazyCat
//
//  Created by 方永腾 on 2016/12/15.
//  Copyright © 2016年 方永腾. All rights reserved.
//

#import "LCOderCell.h"
#import "YTButton.h"
#import "LCOrder.h"

const NSInteger tempTag = 1024;

@interface LCOderCell()

/**
 按键数组
 */
@property (nonatomic, strong) NSMutableArray *buttonArray;

/**
 分割线数组
 */
@property (nonatomic, strong) NSMutableArray *dividerArray;

@end
@implementation LCOderCell

- (NSMutableArray *)buttonArray
{
    if (!_buttonArray)
    {
        _buttonArray = [NSMutableArray array];
    }
    
    return _buttonArray;
}

- (NSMutableArray *)dividerArray
{
    if (!_dividerArray)
    {
        _dividerArray = [NSMutableArray array];
    }
    return _dividerArray;
}

+ (instancetype)oderCellWithTableVeiw:(UITableView *)tableView
{
    static NSString *cellID = @"LCOderCell.h";
    LCOderCell *oderCell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!oderCell)
    {
        oderCell = [[LCOderCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    return oderCell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupDivider];
        [self setupDivider];
    }
    
    return self;
}


- (void)setOrder:(LCOrder *)order
{
    _order = order;
    
    [self seupItemData];
}

- (void)seupItemData
{
    for (NSInteger i = 0; i < self.order.itmeButtonArray.count; i++)
    {
        LCOrder *orderItem = self.order.itmeButtonArray[i];
        [self setupButtonTitle:orderItem.title imageName:orderItem.icon].tag = tempTag + i;
        NSLog(@"%@",orderItem);
    }
}

- (UIButton *)setupButtonTitle:(NSString *)title  imageName:(NSString *)imageName
{
    YTButton *btn = [YTButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.contentView addSubview:btn];
    [self.buttonArray addObject:btn];;
    
    return btn;
}

- (void)setupDivider
{
    UIView * divider = [[UIView alloc]init];
    divider.backgroundColor = [UIColor blueColor];
    [self.dividerArray addObject:divider];
    [self.contentView addSubview:divider];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat buttonH = self.frame.size.height;
    CGFloat buttonY = 0.0;
    CGFloat dividerW = 2.0;
    CGFloat buttonW = (self.frame.size.width - self.dividerArray.count * dividerW) / self.buttonArray.count;
    for (NSInteger i = 0; i < self.buttonArray.count; i++)
    {
        CGFloat buttonX = buttonW * i;
        
        UIButton *tmepButton = self.buttonArray[i];
        tmepButton.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
    }
    
    for (NSInteger j = 0; j < self.dividerArray.count; j++)
    {
        CGFloat viewX = CGRectGetMaxX([self.buttonArray[j] frame]);
        UIView *tempView = self.dividerArray[j];
        tempView.frame = CGRectMake(viewX, buttonY, dividerW, buttonH);
        
    }
    
}

- (void)buttonClick:(UIButton *)button
{
    if ([self.meDelegate respondsToSelector:@selector(order:didSelecteIndex:)])
    {
        [self.meDelegate order:self didSelecteIndex:button.tag - tempTag];
    }
}

@end
