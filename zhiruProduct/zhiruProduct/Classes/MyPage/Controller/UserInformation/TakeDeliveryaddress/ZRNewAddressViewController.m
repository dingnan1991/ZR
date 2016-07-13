//
//  ZRNewAddressViewController.m
//  zhiruProduct
//
//  Created by pj on 16/7/12.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import "ZRNewAddressViewController.h"
#import "ZRNewAddressView.h"
@interface ZRNewAddressViewController ()

@property (nonatomic, strong)ZRNewAddressView * addView;
@end

@implementation ZRNewAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setTitle:@"新增地址"];
    self.view.backgroundColor = RGBCOLOR(240, 240, 240);
    [self createView];
}
- (void)createView
{
    self.addView = [[ZRNewAddressView alloc] initWithFrame:CGRectMake(0, 90, ScreenWidth, 201.0 / 667.0 * ScreenHeight)];
    [self.addView.sexView.manButton addTarget:self action:@selector(actionSelectSexButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.addView.sexView.womanButton addTarget:self action:@selector(actionSelectSexButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.addView setBackgroundColor:RGBCOLOR(255, 255, 255)];
    [self.view addSubview:_addView];
}
- (void)actionSelectSexButton:(UIButton *)sender
{
    if (sender == _addView.sexView.manButton) {
        _addView.sexView.womanButton.selected = NO;
        sender.selected = !sender.selected;
    } else {
        _addView.sexView.manButton.selected = NO;
        sender.selected = !sender.selected;
    }
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
