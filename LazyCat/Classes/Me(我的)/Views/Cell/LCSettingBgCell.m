//
//  LCSettingBgCell.m
//  LazyCat
//
//  Created by 方永腾 on 2016/12/13.
//  Copyright © 2016年 方永腾. All rights reserved.
//

#import "LCSettingBgCell.h"

@implementation LCSettingBgCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        UIView *bg = [[UIView alloc]init];
        bg.backgroundColor = YTColor(255, 255, 255);
       // UIImageView *bg = [[UIImageView alloc] init];
        self.backgroundView = bg;
       // self.bg = bg;
        
        //UIImageView *selectedBg = [[UIImageView alloc] init];
        UIView *selectBg = [[UIView alloc]init];
        selectBg.backgroundColor = YTColor(247, 247, 247);
        
        self.selectedBackgroundView = selectBg;
        //if (self.selectedBg)self.selectedBackgroundView = selectBg;
        
            }
    return self;
}

@end
