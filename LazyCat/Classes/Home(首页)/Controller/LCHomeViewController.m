//
//  LCHomeViewController.m
//  LazyCat
//
//  Created by 方永腾 on 2016/11/20.
//  Copyright © 2016年 方永腾. All rights reserved.
//

#import "LCHomeViewController.h"
#import "LCHomeHeaView.h"
#import "LCProductCell.h"
#import "LCHoriaonCell.h"
#import "LCActivityCell.h"

#import "LCTestViewController.h"

@interface LCHomeViewController ()<HorizontalTbleViewDelegate>

@end

@implementation LCHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupHomeHeadView];
   
}

- (void)setupHomeHeadView
{
    LCHomeHeaView *headView = [[LCHomeHeaView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 468)];
    headView.backgroundColor  = [UIColor orangeColor];
    headView.block = ^(LCChannelView *channelView, UIButton *button)
    {
        LCLog(@"点击了按键");
        LCTestViewController *test = [[LCTestViewController alloc]init];
        [self.navigationController pushViewController:test animated:YES];
        
    };
    self.tableView.backgroundColor = [UIColor greenColor];
    self.tableView.tableHeaderView = headView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 50;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    LCProductCell *productCell = [LCProductCell initWithTableView:tableView];
//    return productCell;
    
    LCHoriaonCell *horiaonCell = [LCHoriaonCell initWithTableView:tableView];
    horiaonCell.horizontalDelegate = self;
    return horiaonCell;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 260;
}

#pragma mark -----HorizontalTableViewDelegate---------------

- (NSInteger)HorizontalTableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)HorizontalTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LCActivityCell *activiyCell = [LCActivityCell initWithTableView:tableView];

    return activiyCell;
}

- (CGFloat)HorizontalTableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

@end
