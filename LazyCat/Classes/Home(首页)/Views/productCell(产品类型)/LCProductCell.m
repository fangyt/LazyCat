//
//  LCProductCell.m
//  LazyCat
//
//  Created by 方永腾 on 2016/12/1.
//  Copyright © 2016年 方永腾. All rights reserved.
//

#import "LCProductCell.h"

static NSString *cellID = @"LCProductCell.h";

@interface LCProductCell ()

/**
 栏目标题
 */
@property (nonatomic ,strong) UILabel *titleLabel;
/**
 商品图片
 */
@property (nonatomic , strong) UIImageView *productImageView;

/**
 商品名
 */
@property (nonatomic , strong) UILabel *productNameLabel;

/**
 已售XX份
 */
@property (nonatomic , strong) UILabel *soldLabel;

/**
 商品价格
 */
@property (nonatomic , strong) UILabel *priceLabel;

@end
@implementation LCProductCell

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:21.0];
        _titleLabel.text = @"ajlfjaslfj";
        [self.contentView addSubview:_titleLabel];
    }
    
    return _titleLabel;
}

- (UIImageView *)productImageView
{
    if (!_productImageView)
    {
        _productImageView = [[UIImageView alloc]init];
        _productImageView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_productImageView];
    }
    
    return _productImageView;
}

- (UILabel *)productNameLabel
{
    if (!_productNameLabel)
    {
        _productNameLabel = [[UILabel alloc]init];
        _productNameLabel.font = [UIFont systemFontOfSize:17.0];
        _productNameLabel.numberOfLines = 2;
        _productNameLabel.text = @"asfhakjshfalfhalsfjaljflasjflsaflafsdfsasfhakjshfalfhalsfjaljflasjflsaflafsdfsasfhakjshfalfhalsfjaljflasjflsaflafsdfs";
        [self.contentView addSubview:_productNameLabel];
        
    }
    
    return _productNameLabel;
}

- (UILabel *)priceLabel
{
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc]init];
        _priceLabel.font = [UIFont systemFontOfSize:17.0];
        _priceLabel.text = @"1234";
        [self.contentView addSubview:_priceLabel];
    }
    
    return _priceLabel;
}

- (UILabel *)soldLabel
{
    if (!_soldLabel)
    {
        _soldLabel = [[UILabel alloc]init];
        _soldLabel.font = [UIFont systemFontOfSize:14.0];
        _soldLabel.text = @"yiyiuyiyiyiuy";
        [self.contentView addSubview:_soldLabel];
    }
    
    return _soldLabel;
}

+ (instancetype)initWithTableView:(UITableView *)tableView
{
    LCProductCell *productCell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!productCell)
    {
        productCell = [[LCProductCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    return productCell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
       // self.backgroundColor = [UIColor orangeColor];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat titleLabelX = self.lc_x;
    CGFloat titleLabelY = HomeMargin;
    CGSize titelSize = [NSString getHeightWithString:self.titleLabel.text width:self.lc_width - HomeMargin * 2 font:self.titleLabel.font.pointSize];
    self.titleLabel.frame = CGRectMake(titleLabelX, titleLabelY, titelSize.width, titelSize.height);
    
    self.productImageView.frame = CGRectMake(self.titleLabel.lc_x, self.titleLabel.lc_bottom + HomeMargin, self.lc_width - HomeMargin * 2 , 100);
    
    CGSize productNameSize = [NSString getHeightWithString:self.productNameLabel.text width:self.lc_width - HomeMargin * 2 font:self.productNameLabel.font.pointSize];
    self.productNameLabel.frame = CGRectMake(self.productImageView.lc_x, self.productImageView.lc_bottom, productNameSize.width, productNameSize.height);
    
    CGSize soldSize = [NSString getHeightWithString:self.soldLabel.text width:self.lc_width - HomeMargin * 2 font:self.soldLabel.font.pointSize];
    self.soldLabel.frame = CGRectMake(self.productNameLabel.lc_x, self.productNameLabel.lc_bottom, soldSize.width, soldSize.height);
    
    CGSize priceSize = [NSString getHeightWithString:self.priceLabel.text width:self.lc_width - HomeMargin * 2 font:self.priceLabel.font.pointSize];
    CGFloat priceX = (self.lc_width - HomeMargin * 2 ) - priceSize.width;
    CGFloat priceY = self.soldLabel.lc_bottom;
    LCLog(@"%lf",priceX);
    self.priceLabel.frame = CGRectMake(priceX, priceY, priceSize.width, priceSize.height);
    
    
}

- (void)setFrame:(CGRect)frame
{
    frame.origin.x = HomeMargin;
    frame.size.width -= HomeMargin * 2;
    
    [super setFrame:frame];
}

@end
