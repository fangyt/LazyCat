//
//  SttingViewController.m
//  TableView
//
//  Created by FangYongTeng on 16/12/12.
//  Copyright © 2016年 FangYongTeng. All rights reserved.
//

#import "SttingViewController.h"
#import "SettingGroup.h"
#import "SettingItemCell.h"
#import "SettingArrowItem.h"
#import "LCCouponsReviewCell.h"
#import "LCCouponsReview.h"
#import "LCOrder.h"
#import "LCOderCell.h"

#import "LCMeViewController.h"

@interface SttingViewController ()<LCMeDelegate>

@end

@implementation SttingViewController

- (NSMutableArray *)groups
{
    if (!_groups)
    {
        _groups = [NSMutableArray array];
    }
    
    return _groups;
}

- (SettingGroup *)addGroup
{
    SettingGroup *group = [SettingGroup group];
    [self.groups addObject:group];
    return group;
}

- (instancetype)init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    self.tableView.backgroundView = nil;
    self.tableView.backgroundColor = YTColor(247, 247, 247);

    CGFloat cellMargin = 10;
    self.tableView.sectionFooterHeight = 0;
    self.tableView.sectionHeaderHeight = cellMargin;
    
    // 底部控件
    UIView *footer = [[UIView alloc] init];
    footer.backgroundColor = [UIColor grayColor];
    footer.frame = CGRectMake(0, 0, 0, 1);
    self.tableView.tableFooterView = footer;
    
    //self.tableView.contentInset = UIEdgeInsetsMake(cellMargin - 33, 0, 0, 0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    SettingGroup *group = self.groups[section];
    return group.groupArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SettingGroup *group = self.groups[indexPath.section];
    if ([[group.groupArray[indexPath.row]class] isSubclassOfClass:[LCCouponsReview class]])
        
    {
        LCCouponsReviewCell *crCell = [LCCouponsReviewCell ccouponsReviewCellWithTableView:tableView];
        LCCouponsReview *cr =  group.groupArray[indexPath.row];
        crCell.meDelegate = self;
        crCell.couponsReview = cr;
        
        return crCell;
    }
    else if ([[group.groupArray[indexPath.row]class] isSubclassOfClass:[LCOrder class]])
    {
        LCOderCell *oderCell = [LCOderCell oderCellWithTableVeiw:tableView];
        LCOrder *oder =  group.groupArray[indexPath.row];
        oderCell.meDelegate = self;
        oderCell.order = oder;
        
        return oderCell;
        
    }
    else
    {
        SettingItemCell *itemCell = [SettingItemCell settingItemCellWithTableView:tableView];
        SettingItem *item = group.groupArray[indexPath.row];
        itemCell.item = item;
        return itemCell;
    }

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SettingGroup *group = self.groups[indexPath.section];
   
    if ([[group.groupArray[indexPath.row]class] isSubclassOfClass:[SettingItem class]])
    {
         SettingItem *item = group.groupArray[indexPath.row];
        
        if (item.plusClass)
        {
            UIViewController *plusController = [[item.plusClass alloc] init];
            [self.navigationController pushViewController:plusController animated:YES];
        }
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0)
    {
        return 120;
    }
    else
    {
        return tableView.rowHeight;
    }
    
}

#pragma mark --------LCCouponsReviewCellDelegage---------

- (void)couponsReview:(LCCouponsReviewCell *)coupons didSelecteIndex:(NSInteger)index
{
    LCCouponsReview *coup = coupons.couponsReview.buttonArray[index];
    
    [self.navigationController pushViewController:[[coup.plusClass alloc]init] animated:YES];
}

- (void)order:(LCOderCell *)cell didSelecteIndex:(NSInteger)index
{
    LCOrder *order = cell.order.itmeButtonArray[index];
    [self.navigationController pushViewController:[[order.plusClass alloc]init] animated:YES];
}

@end
