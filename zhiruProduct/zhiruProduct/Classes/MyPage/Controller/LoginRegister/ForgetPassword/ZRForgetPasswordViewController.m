//
//  ZRForgetPasswordViewController.m
//  zhiruProduct
//
//  Created by pj on 16/7/9.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import "ZRForgetPasswordViewController.h"
#import "ZRCaptchaView.h"
#import "ZRRegisterView.h"
#import "ZRRegionViewController.h"
#import "ZRNavigationController.h"
#import "ZRSettingPasswordViewController.h"
@interface ZRForgetPasswordViewController ()


@property (nonatomic, strong)ZRCaptchaView * phoneNumber;
@property (nonatomic, strong)ZRRegisterView * captacha;
@property (nonatomic, strong)UIButton * registerButton;

@end

@implementation ZRForgetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitle:@"找回密码"];
    [self.view setBackgroundColor:RGBCOLOR(240, 240, 240)];
    [self createPhoneNumberView];
    [self createCaptchaView];
    [self createRegisterView];
    [self createLinewView];
}


// 输入电话号码
- (void)createPhoneNumberView
{
    self.phoneNumber = [[ZRCaptchaView alloc] initWithFrame:CGRectMake(0, 90, ScreenWidth, 40.0 / 667.0 * ScreenHeight)];
    [self.phoneNumber setBackgroundColor:[UIColor whiteColor]];
    [self.phoneNumber.captchaButton addTarget:self action:@selector(actionCaptcha) forControlEvents:UIControlEventTouchUpInside];
    [self.phoneNumber.clearButton addTarget:self action:@selector(actionRegion) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_phoneNumber];
}
// 发送验证码, 并倒计时
- (void)actionCaptcha
{
    __block int timeout=30; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [self.phoneNumber.captchaButton setTitle:@"发送验证码" forState:UIControlStateNormal];
                self.phoneNumber.captchaButton.userInteractionEnabled = YES;
            });
        }else{
            int seconds = timeout % 60;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                //NSLog(@"____%@",strTime);
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:1];
                [self.phoneNumber.captchaButton setTitle:[NSString stringWithFormat:@"重新发送(%@)",strTime] forState:UIControlStateNormal];
                [UIView commitAnimations];
                self.phoneNumber.captchaButton.userInteractionEnabled = NO;
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}
- (void)actionRegion
{
    ZRRegionViewController * regionVC = [[ZRRegionViewController alloc] init];
    ZRNavigationController * regionVCNav = [[ZRNavigationController alloc] initWithRootViewController:regionVC];
    [self presentViewController:regionVCNav animated:YES completion:nil];
}

// 验证码
- (void)createCaptchaView
{
    self.captacha = [[ZRRegisterView alloc] initWithFrame:CGRectMake(0, _phoneNumber.frame.origin.y + _phoneNumber.frame.size.height, ScreenWidth, _phoneNumber.frame.size.height)];
    [self.captacha setBackgroundColor:[UIColor whiteColor]];
    [self.captacha labelText:@"验证码" labelTextFont:14 textFieldPlaceHolder:@"请输入验证码" textFieldSecureTextEntry:NO];
    [self.view addSubview:_captacha];
    [self.captacha.textField setClearButtonMode:UITextFieldViewModeAlways];
    [self.captacha.textField setBorderStyle:UITextBorderStyleNone];
}
// 创建立即注册
- (void)createRegisterView
{
    self.registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:_registerButton];
    WS(weakSelf);
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view).with.offset(40);
        make.right.equalTo(weakSelf.view).with.offset(-40);
        make.top.equalTo(weakSelf.captacha.mas_bottom).with.offset(20);
        make.height.equalTo(@40);
    }];
    [self.registerButton setBackgroundColor:RGBCOLOR(255, 82, 82)];
    [self.registerButton setTitle:@"提交" forState:UIControlStateNormal];
    [self.registerButton setTitleColor:RGBCOLOR(255, 255, 255) forState:UIControlStateNormal];
    self.registerButton.layer.masksToBounds = YES;
    self.registerButton.layer.cornerRadius = 5.;
    [self.registerButton addTarget:self action:@selector(actionRegisterButton) forControlEvents:UIControlEventTouchUpInside];
}
- (void)actionRegisterButton
{
    ZRSettingPasswordViewController * settingPasswordVC = [[ZRSettingPasswordViewController alloc] init];
    [self.navigationController pushViewController:settingPasswordVC animated:YES];
}
// 线
- (void)createLinewView
{
    UIView * lineView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 1)];
    lineView1.backgroundColor = RGBCOLOR(187, 187, 187);
    [self.phoneNumber addSubview:lineView1];
    UIView * lineView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 1)];
    lineView2.backgroundColor = RGBCOLOR(187, 187, 187);
    [self.captacha addSubview:lineView2];
    UIView * lineView3 = [[UIView alloc] initWithFrame:CGRectMake(0, _captacha.frame.size.height, ScreenWidth, 1)];
    lineView3.backgroundColor = RGBCOLOR(187, 187, 187);
    [self.captacha addSubview:lineView3];
    //    UIView * lineView4 = [[UIView alloc] initWithFrame:CGRectMake(0, _passWord.frame.size.height + 1, ScreenWidth, 1)];
    //    lineView4.backgroundColor = RGBCOLOR(187, 187, 187);
    //    [self.passWord addSubview:lineView4];
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
