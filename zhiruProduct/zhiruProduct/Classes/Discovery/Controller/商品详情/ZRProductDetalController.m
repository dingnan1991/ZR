//
//  ZRProductDetalController.m
//  zhiruProduct
//
//  Created by nanding on 16/7/6.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import "ZRProductDetalController.h"
#import "ZRImmediatelyExchangeController.h"

@interface ZRProductDetalController ()

@property (nonatomic, strong) UIButton *immediatelyBtn;

@end

@implementation ZRProductDetalController
#pragma mark - lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"商品详情";
    
    
    //添加立即兑换
    [self setUpImmediatelyExchange];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.immediatelyBtn.hidden = NO;
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.immediatelyBtn.hidden = YES;
}


#pragma mark - Private methods
- (void)setUpImmediatelyExchange
{
    UIWindow *myWindow = [[UIApplication sharedApplication] keyWindow];
    
    _immediatelyBtn = [MyControl createButtonWithFrame:CGRectMake(0, SCREEN_HEIGHT-40, SCREEN_WIDTH, 40) ImageName:nil Target:self Action:@selector(immediatelyExchange:) Title:@"立即兑换"];
    _immediatelyBtn.backgroundColor = [UIColor blackColor];
    _immediatelyBtn.alpha = 0.3;
    [_immediatelyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _immediatelyBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [myWindow addSubview:_immediatelyBtn];
    
    
}


#pragma mark - click methods
- (void)immediatelyExchange:(UIButton *)sender
{
    ZRImmediatelyExchangeController *exchangeVC = [[ZRImmediatelyExchangeController alloc] init];
    [self.navigationController pushViewController:exchangeVC animated:YES];
}


#pragma mark - manage memory methos
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
