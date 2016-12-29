//
//  HorizontalTbleViewDelegate.h
//  Delegate
//
//  Created by 方永腾 on 2016/11/20.
//  Copyright © 2016年 方永腾. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 水平滑动代理方法
 */
@protocol HorizontalTbleViewDelegate <NSObject>

@required

/**
 返回多少行
 */
- (NSInteger)HorizontalTableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;


/**
 返回自定义cell
 */
- (UITableViewCell *)HorizontalTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@optional

/**
 点击了那个cell
*/
- (void)HorizontalTableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;


/**
 返回cell的高度
 */
- (CGFloat)HorizontalTableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;

@end
