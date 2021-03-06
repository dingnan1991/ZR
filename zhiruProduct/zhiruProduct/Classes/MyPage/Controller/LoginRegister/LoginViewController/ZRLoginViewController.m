//
//  ZRLoginViewController.m
//  zhiruProduct
//
//  Created by pj on 16/7/8.
//  Copyright © 2016年 Zhiru. All rights reserved.
//


// 登录
#import "ZRLoginViewController.h"
#import "ZRRegisterViewController.h"
#import "ZRHomeController.h"
#import "ZRLoginView.h"
#import "ZRForgetPasswordViewController.h"
@interface ZRLoginViewController ()

@property (nonatomic, strong)ZRLoginView * userNameView;
@property (nonatomic, strong)ZRLoginView * passWordView;
@property (nonatomic, strong)UIButton * loginButton;
@end

@implementation ZRLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitle:@"登录"];
    [self.view setBackgroundColor:RGBCOLOR(240, 240, 240)];
    
    // 创建导航栏左侧按钮
    [self createNavigaitionLeftButton];
    // 创建导航栏右侧按钮
    [self createNavigationRightButton];
    // 创建用户名视图
    [self createUserNameView];
    // 创建密码师徒
    [self createPasswordView];
    // 创建线
    [self createLineView];
    // 创建登录按钮
    [self createLoginButton];
    // 创建忘记密码按钮
    [self createForgetPassWordButton];
}
- (void)createUserNameView
{
    self.userNameView = [[ZRLoginView alloc] initWithFrame:CGRectMake(0, 90, ScreenWidth, 40.0 / 667.0 * ScreenHeight)];
    [self.userNameView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:_userNameView];
    
    [self.userNameView labelText:@"账号" labelTextFont:16 textFieldPlaceHolder:@"请输入手机号" textFieldSecureTextEntry:NO];
    [self.userNameView.textField setBorderStyle:UITextBorderStyleNone];
    [self.userNameView.textField setClearButtonMode:UITextFieldViewModeAlways];
}
- (void)createPasswordView
{
    self.passWordView = [[ZRLoginView alloc] initWithFrame:CGRectMake(0, _userNameView.frame.origin.y + self.userNameView.frame.size.height, ScreenWidth, _userNameView.frame.size.height)];
    [self.passWordView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:_passWordView];
    
    [self.passWordView labelText:@"密码" labelTextFont:16 textFieldPlaceHolder:@"6-32位字母数字组合" textFieldSecureTextEntry:YES];
    [self.passWordView.textField setBorderStyle:UITextBorderStyleNone];
    [self.passWordView.textField setClearButtonMode:UITextFieldViewModeAlways];
}
- (void)createLineView
{
    UIView * line1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 1)];
    [line1 setBackgroundColor:RGBCOLOR(187, 187, 187)];
    [self.userNameView addSubview:line1];
    UIView * line2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 1)];
    [line2 setBackgroundColor:RGBCOLOR(187, 187, 187)];
    [self.passWordView addSubview:line2];
    UIView * line3 = [[UIView alloc] initWithFrame:CGRectMake(0, self.passWordView.frame.size.height - 1, ScreenWidth, 1)];
    [line3 setBackgroundColor:RGBCOLOR(187, 187, 187)];
    [self.passWordView addSubview:line3];
}
- (void)createLoginButton
{
    self.loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:_loginButton];
    WS(weakSelf);
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view).with.offset(40);
        make.right.equalTo(weakSelf.view).with.offset(-40);
        make.top.equalTo(weakSelf.passWordView.mas_bottom).with.offset(25);
        make.height.mas_equalTo(@40);
    }];
    self.loginButton.layer.masksToBounds = YES;
    self.loginButton.layer.cornerRadius = 5.;
    self.loginButton.backgroundColor = RGBCOLOR(255, 82, 82);
    [self.loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [self.loginButton addTarget:self action:@selector(actionLoginButton) forControlEvents:UIControlEventTouchUpInside];
}
// 点击登录按钮
- (void)actionLoginButton
{
    NSLog(@"登录");
}
- (void)createForgetPassWordButton
{
    UIButton * forgetPassWord = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:forgetPassWord];
    WS(weakSelf);
    [forgetPassWord mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.loginButton);
        make.top.equalTo(weakSelf.loginButton.mas_bottom).with.offset(10);
        make.size.mas_equalTo(CGSizeMake(70, 25));
    }];
    [forgetPassWord setTitle:@"忘记密码?" forState:UIControlStateNormal];
    [forgetPassWord setTitleColor:RGBCOLOR(72, 72, 248) forState:UIControlStateNormal];
    [forgetPassWord.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [forgetPassWord addTarget:self action:@selector(actionForgetPassWordButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forgetPassWord];
    
}
// 忘记密码
- (void)actionForgetPassWordButton
{
    ZRForgetPasswordViewController * forgetPasswordVC = [[ZRForgetPasswordViewController alloc] init];
    [self.navigationController pushViewController:forgetPasswordVC animated:YES];
}
- (void)createNavigaitionLeftButton
{
    UIBarButtonItem * item = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"zuojiantou"] highImage:[UIImage imageNamed:@"zuojiantou"]  target:self action:@selector(actionLeftButton)];
    self.navigationItem.leftBarButtonItem = item;
//    UIButton * leftButton = [MyControl createButtonWithFrame:CGRectMake(5, 0, 12, 24) ImageName:@"zuojiantou" Target:self Action:@selector(actionLeftButton) Title:nil];
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
}
- (void)actionLeftButton
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)createNavigationRightButton
{
    UIButton * rightButton = [MyControl createButtonWithFrame:CGRectMake(0, 0, 40, 40) ImageName:nil Target:self Action:@selector(actionRightButton) Title:@"注册"];
    [rightButton.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [rightButton setTitleColor:RGBCOLOR(255, 82, 82) forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
}
// 点击注册
- (void)actionRightButton
{
    ZRRegisterViewController * regiseterVC = [[ZRRegisterViewController alloc] init];
    [self.navigationController pushViewController:regiseterVC animated:YES];
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
