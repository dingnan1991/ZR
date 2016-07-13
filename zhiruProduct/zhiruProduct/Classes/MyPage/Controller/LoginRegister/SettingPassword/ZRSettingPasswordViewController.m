//
//  ZRSettingPasswordViewController.m
//  zhiruProduct
//
//  Created by pj on 16/7/9.
//  Copyright © 2016年 Zhiru. All rights reserved.
//



#import "ZRSettingPasswordViewController.h"
#import "ZRRegisterView.h"

@interface ZRSettingPasswordViewController ()



@property (nonatomic, strong)ZRRegisterView * passWord;
@property (nonatomic, strong)ZRRegisterView * againPassWord;

@end

@implementation ZRSettingPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitle:@"设置新密码"];
    [self.view setBackgroundColor:RGBCOLOR(240, 240, 240)];
    
    [self createNewPassword];
    [self createAgainPassword];
    [self createButton];
    [self createLineView];
    
    
    
}

- (void)createNewPassword
{
    self.passWord = [[ZRRegisterView alloc] initWithFrame:CGRectMake(0, 90, ScreenWidth, 40.0 / 667.0 * ScreenHeight)];
    self.passWord.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_passWord];
    [self.passWord labelText:@"新密码" labelTextFont:15 textFieldPlaceHolder:@"新密码" textFieldSecureTextEntry:YES];
    [self.passWord.textField setClearButtonMode:UITextFieldViewModeAlways];
    
}
- (void)createAgainPassword
{
    CGFloat y = _passWord.frame.origin.y;
    CGFloat height = _passWord.frame.size.height;
    self.againPassWord = [[ZRRegisterView alloc] initWithFrame:CGRectMake(0, y + height, ScreenWidth, height)];
    self.againPassWord.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_againPassWord];
    [self.againPassWord labelText:@"再次输入" labelTextFont:15 textFieldPlaceHolder:@"再次输入" textFieldSecureTextEntry:YES];
    [self.againPassWord.textField setClearButtonMode:UITextFieldViewModeAlways];
}
- (void)createButton
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:button];
    WS(weakSelf);
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view).with.offset(40);
        make.right.equalTo(weakSelf.view).with.offset(-40);
        make.top.equalTo(weakSelf.againPassWord.mas_bottom).with.offset(25);
        make.height.mas_equalTo(@40);
    }];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 5;
    button.backgroundColor = RGBCOLOR(255, 82, 82);
    [button setTitle:@"确定" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(actionButton) forControlEvents:UIControlEventTouchUpInside];
}
- (void)actionButton
{
    NSLog(@"确定");
}
- (void)createLineView
{
    UIView * lineView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 1)];
    lineView1.backgroundColor = RGBCOLOR(187, 187, 187);
    [_passWord addSubview:lineView1];
    
    UIView * lineView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 1)];
    lineView2.backgroundColor = RGBCOLOR(187, 187, 187);
    [_againPassWord addSubview:lineView2];
    
    UIView * lineView3 = [[UIView alloc] initWithFrame:CGRectMake(0, _passWord.frame.size.height + 1, ScreenWidth, 1)];
    lineView3.backgroundColor = RGBCOLOR(187, 187, 187);
    [_againPassWord addSubview:lineView3];
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
