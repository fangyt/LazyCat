//
//  LCChannelView.m
//  LazyCat
//
//  Created by 方永腾 on 2016/11/23.
//  Copyright © 2016年 方永腾. All rights reserved.
//

#import "LCChannelView.h"

@interface LCChannelView ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *specialLineButton;
@property (nonatomic, strong) UIButton *recommendedButton;

@end
@implementation LCChannelView

-(UILabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"精选频道";
        _titleLabel.textColor = YTColor(66, 66, 66);
        _titleLabel.font = [UIFont systemFontOfSize:20];
        [self addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (UIButton *)specialLineButton
{
    if (!_specialLineButton)
    {
        _specialLineButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_specialLineButton setImage:[UIImage imageNamed:@"topic"] forState:UIControlStateNormal];
        _specialLineButton.backgroundColor = [UIColor whiteColor];
        [_specialLineButton addTarget:self action:@selector(buttonClike:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_specialLineButton];
    }
    
    return _specialLineButton;
}

-(UIButton *)recommendedButton
{
    if (!_recommendedButton)
    {
        _recommendedButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_recommendedButton setImage:[UIImage imageNamed:@"recommend"] forState:UIControlStateNormal];
        [_recommendedButton addTarget:self action:@selector(buttonClike:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_recommendedButton];
    }
    return _recommendedButton;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        
        
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self seupChildControls:self.frame];
}

- (void)seupChildControls:(CGRect)frame
{
    CGSize titleSize = [NSString getHeightWithString:self.titleLabel.text width:frame.size.width font:self.titleLabel.font.pointSize];

    self.titleLabel.frame = CGRectMake(HomeMargin, HomeMargin, titleSize.width, titleSize.height);
    CGRect rect = self.titleLabel.frame;
   rect.origin = CGPointMake(HomeMargin, HomeMargin);
    self.titleLabel.frame = rect;
    [self.titleLabel sizeToFit ];
    
    CGFloat specialLineButtonW = (frame.size.width - HomeMargin * 3.0) / 2.0;
    CGFloat specialLineButtonH = frame.size.height - CGRectGetMaxY(self.titleLabel.frame) - 37.0;
    self.specialLineButton.frame = CGRectMake(HomeMargin, CGRectGetMaxY(self.titleLabel.frame) + HomeMargin, specialLineButtonW, specialLineButtonH);
    
    CGFloat recommendedButtonX = CGRectGetMaxX(self.specialLineButton.frame) + HomeMargin;
    CGFloat recommendedButtonY = self.specialLineButton.frame.origin.y;
    self.recommendedButton.frame = CGRectMake(recommendedButtonX, recommendedButtonY, specialLineButtonW, specialLineButtonH);
}

#pragma mark ----buttonClik----------

- (void)buttonClike:(UIButton *)btn
{
    if ([self.channelViewDelegate respondsToSelector:@selector(channelView:selectButton:)])
    {
        [self.channelViewDelegate channelView:self selectButton:btn];
    }
}

@end
