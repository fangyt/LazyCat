//
//  SettingGroup.h
//  TableView
//
//  Created by FangYongTeng on 16/12/12.
//  Copyright © 2016年 FangYongTeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingGroup : NSObject

@property (nonatomic ,copy)NSString *headerTitle;
@property (nonatomic ,copy)NSString *footerTitle;

@property (nonatomic ,strong) NSArray *groupArray;

+ (instancetype)group;
@end
