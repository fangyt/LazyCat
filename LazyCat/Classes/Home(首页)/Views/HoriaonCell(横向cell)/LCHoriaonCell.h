//
//  LCHoriaonCell.h
//  LazyCat
//
//  Created by 方永腾 on 2016/12/1.
//  Copyright © 2016年 方永腾. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HorizontalTbleViewDelegate.h"

@interface LCHoriaonCell : UITableViewCell<UITableViewDelegate, UITableViewDataSource, HorizontalTbleViewDelegate>

+ (instancetype)initWithTableView:(UITableView *)tableView;

@property (nonatomic , weak) id <HorizontalTbleViewDelegate>horizontalDelegate;

@end
