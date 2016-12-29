//
//  NSString+TextSize.h
//  YTWeiBo
//
//  Created by 方永腾 on 16/8/25.
//  Copyright © 2016年 方永腾. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (TextSize)

/**
 *  根据文字内容技术文字的宽高
 *
 *  @param text  要计算的文字
 *  @param width 文字最大显示的宽度
 *
 *  @return 返回size
 */
+ (CGSize)getHeightWithString:(NSString *)text width:(CGFloat)width font:(CGFloat)fout;
@end
