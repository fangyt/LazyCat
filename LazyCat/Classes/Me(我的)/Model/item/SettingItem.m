//
//  SettingItem.m
//  TableView
//
//  Created by FangYongTeng on 16/12/12.
//  Copyright © 2016年 FangYongTeng. All rights reserved.
//

#import "SettingItem.h"

@implementation SettingItem

+ (instancetype)settingWithTitle:(NSString *)title icon:(NSString *)icon plusClass:(Class)plusClass
{
    SettingItem *item = [[self alloc]init];
    item.title = title;
    item.icon = icon;
    item.plusClass = plusClass;
    
    return item;
}

+ (instancetype)settingWithTitle:(NSString *)title icon:(NSString *)icon
{
    return [self settingWithTitle:title icon:icon plusClass:nil];
}

+ (instancetype)settingWithTitle:(NSString *)title
{
    return [self settingWithTitle:title icon:nil];
}

@end
