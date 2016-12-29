//
//  LCHoriaonCell.m
//  LazyCat
//
//  Created by 方永腾 on 2016/12/1.
//  Copyright © 2016年 方永腾. All rights reserved.
//

#import "LCHoriaonCell.h"

static NSString *cellID = @"LCHoriaonCell.h";

@interface LCHoriaonCell ()

@property (nonatomic , strong) UITableView *horiaonTableView;

@end

@implementation LCHoriaonCell

- (UITableView *)horiaonTableView
{
    if (!_horiaonTableView)
    {
        _horiaonTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _horiaonTableView.delegate = self;
        _horiaonTableView.dataSource = self;
        _horiaonTableView.transform = CGAffineTransformMakeRotation(M_PI_2 * 3);
        _horiaonTableView.autoresizingMask = UITableViewRowAnimationNone;
        [self.contentView addSubview:_horiaonTableView];
    }
    
    return _horiaonTableView;
}

+ (instancetype)initWithTableView:(UITableView *)tableView
{
    LCHoriaonCell *horiaonCell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!horiaonCell)
    {
        horiaonCell = [[LCHoriaonCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    return horiaonCell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect rect;
    rect.size.width = self.lc_height;
    rect.size.height = self.lc_width;
    self.horiaonTableView.bounds = rect;
    self.horiaonTableView.center = CGPointMake(self.lc_width * 0.5, self.lc_height * 0.5);
}

#pragma mark-----horizontalDelegate----------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.horizontalDelegate HorizontalTableView:tableView numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.horizontalDelegate HorizontalTableView:tableView cellForRowAtIndexPath:indexPath];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.horizontalDelegate respondsToSelector:@selector(HorizontalTableView:heightForRowAtIndexPath:)])
    {
        return [self.horizontalDelegate HorizontalTableView:tableView heightForRowAtIndexPath:indexPath];
    }
    else
    {
        return tableView.rowHeight;
    }
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.horizontalDelegate respondsToSelector:@selector(HorizontalTableView:didSelectRowAtIndexPath:)])
    {
        [self.horizontalDelegate HorizontalTableView:tableView didSelectRowAtIndexPath:indexPath];
    }
}

@end
