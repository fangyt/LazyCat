//
//  NSString+TextSize.m
//  YTWeiBo
//
//  Created by 方永腾 on 16/8/25.
//  Copyright © 2016年 方永腾. All rights reserved.
//

#import "NSString+TextSize.h"

@implementation NSString (TextSize)

+ (CGSize)getHeightWithString:(NSString *)text width:(CGFloat)width font:(CGFloat)fout
{
    /**
     Size 文字显示的最大区域
     options 通过什么方式来计算文字
     NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin
     attributes 文字的字体，颜色
     context NULL
     */
    return [text boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                     options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin
                                  attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:fout]}
                                     context:NULL].size;

}

@end

