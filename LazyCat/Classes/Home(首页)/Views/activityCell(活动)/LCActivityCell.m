//
//  LCActivityCell.m
//  LazyCat
//
//  Created by 方永腾 on 2016/12/1.
//  Copyright © 2016年 方永腾. All rights reserved.
//

#import "LCActivityCell.h"

static NSString *cellID = @"LCActivityCell.h";

@interface LCActivityCell()

@property (nonatomic , weak) UIView *tempView;

@end
@implementation LCActivityCell

+ (instancetype)initWithTableView:(UITableView *)tableView
{
    LCActivityCell *activityCell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!activityCell)
    {
        activityCell = [[LCActivityCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    return activityCell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.transform = CGAffineTransformMakeRotation(M_PI_2);
        self.contentView.transform = CGAffineTransformMakeRotation(M_PI_2);
        UIView *tempView = [[UIView alloc]init];
        tempView.backgroundColor = [UIColor blueColor];
        [self.contentView addSubview:tempView];
        self.tempView = tempView;
    }
    
    return self;
}

- (void)setFrame:(CGRect)frame
{
    frame.origin.y += HomeMargin;
    frame.size.height -= HomeMargin * 2;
    [super setFrame:frame];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.tempView.bounds = self.frame;
    self.tempView.center = CGPointMake(self.lc_width * 0.5, self.lc_height * 0.5);
}

@end
