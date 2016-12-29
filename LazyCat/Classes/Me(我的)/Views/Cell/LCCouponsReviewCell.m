//
//  LCCouponsReviewCell.m
//  LazyCat
//
//  Created by 方永腾 on 2016/12/13.
//  Copyright © 2016年 方永腾. All rights reserved.
//

#import "LCCouponsReviewCell.h"
#import "LCCouponsReview.h"

#define LCCouponsReviewCellTextFout 15

const NSInteger tagNumber = 1023;

@interface LCCouponsReviewCell ()

/**
 分割线数组
 */
@property (nonatomic , strong) NSMutableArray *divideriArray;

/**
 存放按键数组
 */
@property (nonatomic , strong) NSMutableArray *buttonArray;

@end
@implementation LCCouponsReviewCell

- (NSMutableArray *)divideriArray
{
    if (!_divideriArray)
    {
        _divideriArray = [NSMutableArray array];
    }
    
    return _divideriArray;
}

- (NSMutableArray *)buttonArray
{
    if (!_buttonArray)
    {
        _buttonArray = [NSMutableArray array];
    }
    
    return _buttonArray;
}

+ (instancetype)ccouponsReviewCellWithTableView:(UITableView *)tableView
{
    static NSString *cellID = @"LCCouponsReviewCell.h";
    
    LCCouponsReviewCell *couponsRevieCell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!couponsRevieCell)
    {
        couponsRevieCell = [[LCCouponsReviewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    
    return couponsRevieCell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        //[self setupData];
        [self setupDivider];
    }
    
    return self;
}

/**
 *  初始化按钮
 *
 *  @param title   按钮的文字
 *  @param image   按钮的小图片
 *  @param bgImage 按钮的背景
 */
- (UIButton *)setupBtnWithTitle:(NSString *)title image:(NSString *)image bgImage:(NSString *)bgImage
{

    
    UIButton *btn = [[UIButton alloc] init];
    if (image)[btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:LCCouponsReviewCellTextFout];
    //btn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    btn.adjustsImageWhenHighlighted = NO;
    if (bgImage)[btn setBackgroundImage:[UIImage imageNamed:bgImage] forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(btnClik:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:btn];
    
    // 添加按钮到数组
    [self.buttonArray addObject:btn];
    
    return btn;
}

/**
 *  初始化分割线
 */
- (void)setupDivider
{
    UIView *dividerView = [[UIView alloc]init];
    dividerView.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:dividerView];
    [self.divideriArray addObject:dividerView];
}

- (void)btnClik:(UIButton *)btn
{
    if ([self.meDelegate respondsToSelector:@selector(couponsReview:didSelecteIndex:)])
    {
        [self.meDelegate couponsReview:self didSelecteIndex:btn.tag - tagNumber];
    }
}

- (void)setCouponsReview:(LCCouponsReview *)couponsReview
{
    _couponsReview = couponsReview;
    
    [self setupData];
}

- (void)setupData
{
    LCLog(@"%ld",self.couponsReview.buttonArray.count);
    
    for (NSInteger i = 0; i < self.couponsReview.buttonArray.count ; i++)
    {
        LCCouponsReview *co = self.couponsReview.buttonArray[i];
        [self setupBtnWithTitle:co.title image:nil bgImage:nil].tag = i + tagNumber;
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 1.设置按钮的frame
    NSInteger dividerCount = self.divideriArray.count; // 分割线的个数
    CGFloat dividerW = 2; // 分割线的宽度
    NSInteger btnCount = self.buttonArray.count;
    CGFloat btnW = (self.frame.size.width - dividerCount * dividerW) / btnCount;
    CGFloat btnH = self.frame.size.height;
    CGFloat btnY = 0;
    for (int i = 0; i<btnCount; i++) {
        UIButton *btn = self.buttonArray[i];
        
        // 设置frame
        CGFloat btnX = i * (btnW + dividerW);
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    }
    
    // 2.设置分割线的frame
    CGFloat dividerH = btnH;
    CGFloat dividerY = 0;
    for (int j = 0; j<dividerCount; j++) {
        UIView *divider = self.divideriArray[j];
        
        // 设置frame
        UIButton *btn = self.buttonArray[j];
        CGFloat dividerX = CGRectGetMaxX(btn.frame);
        divider.frame = CGRectMake(dividerX, dividerY, dividerW, dividerH);
    }
}

@end
