//
//  LCMeViewController.m
//  LazyCat
//
//  Created by 方永腾 on 2016/11/20.
//  Copyright © 2016年 方永腾. All rights reserved.
//

#import "LCMeViewController.h"
#import "SettingGroup.h"
#import "SettingArrowItem.h"
#import "LCCouponsReview.h"
#import "LCOrder.h"

#import "LCAllOderController.h"


@interface LCMeViewController ()
@end

@implementation LCMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupGroupOne];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupGroupTwo];
    [self setupGroupThree];
    [self setupGroupFour];
    [self setupGroupFive];
    [self seupGroupSix];
    
}

- (void)setupGroupOne
{
    
    SettingArrowItem *arrowItem = [SettingArrowItem settingWithTitle:@"未登录" icon:@"user" plusClass:nil];
    
    LCCouponsReview *cou = [[LCCouponsReview alloc]init];

    LCCouponsReview *coupons = [LCCouponsReview settingWithTitle:@"优惠券" icon:nil plusClass:nil];
    LCCouponsReview *comments = [LCCouponsReview settingWithTitle:@"我的点评" icon:@"" plusClass:nil];
    cou.buttonArray = @[coupons,comments];
    
    SettingGroup *group = [self addGroup];
    group.groupArray = @[arrowItem,cou];
    
}

- (void)setupGroupTwo
{
    LCOrder *oderItem = [[LCOrder alloc]init];
    
    LCOrder *allAder = [LCOrder settingWithTitle:@"全部订单"
                                            icon:@"qbdd"
                                       plusClass:[LCAllOderController class]];
    
    LCOrder *needPay = [LCOrder settingWithTitle:@"待付款"
                                            icon:@"dfk"
                                       plusClass:nil];
    
    LCOrder *needTransitive = [LCOrder settingWithTitle:@"待评价"
                                                   icon:@"dpj"
                                              plusClass:nil];
    
    oderItem.itmeButtonArray = @[allAder,
                                 needPay,
                                 needTransitive];
    
    SettingGroup *group = [self addGroup];
    group.groupArray = @[oderItem];
    
}

- (void)setupGroupThree
{
    SettingArrowItem *tbdd = [SettingArrowItem settingWithTitle:@"淘宝订单" icon:@"tbdd" plusClass:[LCAllOderController class]];
    SettingGroup *group = [self addGroup];
    group.groupArray = @[tbdd];
}

- (void)setupGroupFour
{
    SettingArrowItem *cycxr = [SettingArrowItem settingWithTitle:@"常用出行人" icon:@"cycxr" plusClass:nil];
    SettingArrowItem *czjud = [SettingArrowItem settingWithTitle:@"常住酒店" icon:@"czjd" plusClass:nil];
    SettingGroup *group = [self addGroup];
    group.groupArray = @[cycxr,czjud];
}

- (void)setupGroupFive
{
    SettingArrowItem *wdsc = [SettingArrowItem settingWithTitle:@"我的收藏" icon:@"wdsc" plusClass:nil];
    SettingGroup *group = [self addGroup];
    group.groupArray = @[wdsc];
}

- (void)seupGroupSix
{
    SettingArrowItem *kfdh = [SettingArrowItem settingWithTitle:@"客服电话" icon:@"kfdh" plusClass:nil];
    SettingGroup *group = [self addGroup];
    group.groupArray = @[kfdh];
}

@end
