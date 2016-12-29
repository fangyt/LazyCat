//
//  SttingViewController.h
//  TableView
//
//  Created by FangYongTeng on 16/12/12.
//  Copyright © 2016年 FangYongTeng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SettingGroup;
@interface SttingViewController : UITableViewController

@property (nonatomic ,strong) NSMutableArray *groups;

- (SettingGroup *)addGroup;

@end
