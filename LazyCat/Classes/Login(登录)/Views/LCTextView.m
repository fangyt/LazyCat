//
//  LCTextView.m
//  LazyCat
//
//  Created by 方永腾 on 2016/12/19.
//  Copyright © 2016年 方永腾. All rights reserved.
//

#import "LCTextView.h"

#define LCTextViewforgotPwdFont 13 // 忘记密码字体大小
#define LCTextViewLoginFont 16 //登录按键文字大小
#define LCTextViewTextFieldFont 14 //提醒文字大小
#define LCTextViewMargin 12 //间距

@interface LCTextView ()

/**
 登录文本框
 */
@property (nonatomic , strong) UITextField *userTextField;

/**
 密码文本框
 */
@property (nonatomic , strong) UITextField *pwdTextField;

/**
 忘记密码
 */
@property (nonatomic , strong) UIButton *forgotPwdButton;

/**
 登录
 */
@property (nonatomic , strong) UIButton *loginButton;

/**
 分割线
 */
@property (nonatomic , strong) UIView *marginView;

@end
@implementation LCTextView


- (UITextField *)userTextField
{
    if (!_userTextField)
    {
        _userTextField = [[UITextField alloc]init];
        _userTextField.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"手机号/邮箱/账号" attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:LCTextViewTextFieldFont]}];
        _userTextField.backgroundColor = [UIColor whiteColor];
        _userTextField.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,12,44)];
        _userTextField.leftViewMode = UITextFieldViewModeAlways;
        [self addSubview:_userTextField];
    }
    return _userTextField;
}

- (UITextField *)pwdTextField
{
    if (!_pwdTextField)
    {
        _pwdTextField = [[UITextField alloc]init];
        _pwdTextField.borderStyle = UITextBorderStyleNone;
        _pwdTextField.backgroundColor = [UIColor whiteColor];
        _pwdTextField.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,LCTextViewMargin,44)];
        _pwdTextField.leftViewMode = UITextFieldViewModeAlways;
        _pwdTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入密码"          attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:LCTextViewTextFieldFont],}];
        [self addSubview:_pwdTextField];
    }
    
    return _pwdTextField;
}

-(UIButton *)forgotPwdButton
{
    if (!_forgotPwdButton)
    {
        _forgotPwdButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _forgotPwdButton.titleLabel.font = [UIFont systemFontOfSize:LCTextViewforgotPwdFont];
        [_forgotPwdButton setTitle:@"忘记密码" forState:UIControlStateNormal];
        [_forgotPwdButton setTitleColor:YTColor(255, 106, 34) forState:UIControlStateNormal];
        [self addSubview:_forgotPwdButton];
    }
    
    return _forgotPwdButton;
}

- (UIButton *)loginButton
{
    if (!_loginButton)
    {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginButton.titleLabel.font = [UIFont systemFontOfSize:LCTextViewLoginFont];
        _loginButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_loginButton setBackgroundColor:YTColor(255, 106, 34)];
        [self addSubview:_loginButton];
    }
    
    return _loginButton;
}


- (UIView *)marginView
{
    if (!_marginView)
    {
       // _marginView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 2)];
        _marginView = [[UIView alloc]init];
        _marginView.backgroundColor = [UIColor grayColor];
        [self.userTextField addSubview:_marginView];
    }
    
    return _marginView;
}

- (void)layoutSubviews
{
    self.userTextField.frame = CGRectMake(0, 10, self.lc_width, 44);
    self.marginView.frame = CGRectMake(LCTextViewMargin, self.userTextField.lc_bottom, self.lc_width - LCTextViewMargin * 2, 1);
    self.pwdTextField.frame = CGRectMake(self.userTextField.lc_x, self.userTextField.lc_bottom, self.lc_width, self.userTextField.lc_height);
    
    [self.forgotPwdButton sizeToFit];
    CGRect rect = self.forgotPwdButton.frame;
    rect.origin.x = LCTextViewMargin;
    rect.origin.y = self.pwdTextField.lc_bottom;
    self.forgotPwdButton.frame = rect;
    
    self.loginButton.frame = CGRectMake(0, self.forgotPwdButton.lc_bottom, self.lc_width, 45);
    
    
    [super layoutSubviews];
}

@end
