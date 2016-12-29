//
//  LCDestinationViewController.m
//  LazyCat
//
//  Created by 方永腾 on 2016/11/20.
//  Copyright © 2016年 方永腾. All rights reserved.
//

#import "LCDestinationViewController.h"

/**
 国家宽度
 */
#define CountryScrollView_WIDTH 100
/**
 国家按键高度
 */
#define CountryButton_HEIGHT 55
/**
 屏幕宽度
 */
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
/**
 屏幕高度
 */
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface LCDestinationViewController ()<UIScrollViewDelegate>

/**
 国家
 */
@property (nonatomic , strong) UIScrollView *countryScrollView;

/**
 城市
 */
@property (nonatomic , strong) UIScrollView *cityScrollView;

/**
 滚动条
 */
@property (nonatomic , strong) UIView *scrollbarView;
@end

@implementation LCDestinationViewController

- (UIScrollView *)countryScrollView
{
    if (!_countryScrollView)
    {
        _countryScrollView = [[UIScrollView alloc]init];
        _countryScrollView.frame = CGRectMake(0, 0, CountryScrollView_WIDTH, SCREEN_HEIGHT);
        _countryScrollView.delegate = self;
        _countryScrollView.tag = UIScrollViewCountryStyle;
        [self.view addSubview:_countryScrollView];
    }
    
    return _countryScrollView;
}

- (UIScrollView *)cityScrollView
{
    if (!_cityScrollView)
    {
        _cityScrollView = [[UIScrollView alloc]init];
        _cityScrollView.frame = CGRectMake(self.countryScrollView.lc_right, 0, SCREEN_WIDTH - self.countryScrollView.lc_right, SCREEN_HEIGHT);
        _cityScrollView.tag = UIScrollViewCityStyle;
        _cityScrollView.delegate = self;
        _cityScrollView.pagingEnabled = YES;
        _cityScrollView.backgroundColor = [UIColor yellowColor];
        [self.view addSubview:_cityScrollView];
    }
    
    return _cityScrollView;
}

- (UIView *)scrollbarView
{
    if (!_scrollbarView)
    {
        _scrollbarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 2, CountryButton_HEIGHT)];
        _scrollbarView.backgroundColor = YTColor(85, 193, 211);
        [self.countryScrollView addSubview:_scrollbarView];
    }
    
    return _scrollbarView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addCountryButton];
   // [self scrollbarView];
    [self addCityScrollView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark ---addCountryButton----

/**
 添加国家
 
 */
- (void)addCountryButton
{
    self.countryScrollView.contentSize = CGSizeMake(0, CountryButton_HEIGHT * 10);
    
    for (NSInteger x = 0; x < 10; x++)
    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, CountryButton_HEIGHT * x, self.countryScrollView.lc_width, CountryButton_HEIGHT);
        btn.tag = x;
        [btn addTarget:self action:@selector(countryButton:) forControlEvents:UIControlEventTouchUpInside];
        btn.backgroundColor = [UIColor redColor];
        [self.countryScrollView addSubview:btn];
    }
    
    [self countryButton:self.countryScrollView.subviews.firstObject];
}

- (void)countryButton:(UIButton *)button
{
    
    CGPoint offset = self.cityScrollView.contentOffset;
    offset.y = button.tag * self.cityScrollView.lc_height;
    [self.cityScrollView setContentOffset:offset];
    
    self.scrollbarView.center = CGPointMake(0, button.lc_centerY);
    CGRect rect = self.scrollbarView.frame;
    rect.origin.x = 0;
    self.scrollbarView.frame = rect;
}

/**
 添加城市
 */
- (void)addCityScrollView
{
    CGFloat btnH = 119;
    NSInteger maxColsCount = 2;
    
    CGFloat btnW = (self.cityScrollView.frame.size.width - 3 * HomeMargin) / maxColsCount;
    self.cityScrollView.contentSize = CGSizeMake(0, self.cityScrollView.lc_height * 10);
    for (NSInteger i = 0; i < 10; i++)
    {
        UIScrollView *cityScroView = [[UIScrollView alloc]init];
        cityScroView.frame = CGRectMake(0, self.cityScrollView.lc_height * i, self.cityScrollView.lc_width, self.cityScrollView.lc_height);
        cityScroView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255) / 255.0 green:arc4random_uniform(255) / 255.0  blue:arc4random_uniform(255) / 255.0  alpha:1.0];
        [self.cityScrollView addSubview:cityScroView];
        
        for (NSInteger j = 0; j < 5; j++)
        {
            CGFloat btnX = (j % maxColsCount) * (btnW + HomeMargin) + HomeMargin;
            CGFloat btnY = (j / maxColsCount) * (btnH + HomeMargin) +HomeMargin;
            
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255) / 255.0 green:arc4random_uniform(255) / 255.0  blue:arc4random_uniform(255) / 255.0  alpha:1.0];
            btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
            cityScroView.contentSize  = CGSizeMake(0, btn.lc_bottom);
            [cityScroView addSubview:btn];
        }
    }
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.y / scrollView.frame.size.height;
    UIButton *btn = self.countryScrollView.subviews[index];
    [self countryButton:btn];
}

@end
