//
//  ZRNameViewController.m
//  zhiruProduct
//
//  Created by pj on 16/7/11.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import "ZRNameViewController.h"
#import "ZRRegisterView.h"
@interface ZRNameViewController ()


@property (nonatomic, strong)ZRRegisterView * nameView;
@end

@implementation ZRNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setTitle:@"修改昵称"];
    self.view.backgroundColor = RGBCOLOR(240, 240, 240);
    [self createContentView];
}
- (void)createContentView
{
    self.nameView = [[ZRRegisterView alloc] initWithFrame:CGRectMake(0, 90, ScreenWidth, 40.0)];
    [self.nameView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.nameView];
    [self.nameView labelText:@"昵称" labelTextFont:16 textFieldPlaceHolder:@"请输入昵称" textFieldSecureTextEntry:NO];
    
    UIButton * okButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:okButton];
    WS(weakSelf);
    [okButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view).with.offset(40);
        make.right.equalTo(weakSelf.view).with.offset(-40);
        make.top.equalTo(weakSelf.nameView.mas_bottom).with.offset(25);
        make.height.equalTo(@40);
    }];
    [okButton setTitle:@"确定" forState:UIControlStateNormal];
    [okButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [okButton setBackgroundColor:RGBCOLOR(255, 82, 82)];
    okButton.layer.masksToBounds = YES;
    okButton.layer.cornerRadius = 5;
    [okButton addTarget:self action:@selector(actionOkButton) forControlEvents:UIControlEventTouchUpInside];
}
- (void)actionOkButton
{
    NSLog(@"确定");
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
