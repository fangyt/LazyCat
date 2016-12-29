//
//  SettingItem.h
//  TableView
//
//  Created by FangYongTeng on 16/12/12.
//  Copyright © 2016年 FangYongTeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingItem : NSObject

@property (nonatomic ,copy) NSString *title;
@property (nonatomic ,copy) NSString *icon;
@property (nonatomic ,weak) Class plusClass;

+ (instancetype)settingWithTitle:(NSString *)title  icon:(NSString *)icon plusClass:(Class)plusClass;
+ (instancetype)settingWithTitle:(NSString *)title  icon:(NSString *)icon;
+ (instancetype)settingWithTitle:(NSString *)title;

@end
