//
//  LCLoginViewController.m
//  LazyCat
//
//  Created by 方永腾 on 2016/12/19.
//  Copyright © 2016年 方永腾. All rights reserved.
//

#import "LCLoginViewController.h"
#import "LCTextView.h"

@interface LCLoginViewController ()

@end

@implementation LCLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    [self setupTextView];
}

- (void)setupTextView
{
    LCTextView *textView = [[LCTextView alloc]init];
    //textView.backgroundColor = [UIColor yellowColor];
    textView.frame = CGRectMake(0, 64, self.view.lc_width, 200);
    [self.view addSubview:textView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
