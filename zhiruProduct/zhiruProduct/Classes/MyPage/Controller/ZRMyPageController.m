//
//  ZRMyPageController.m
//  zhiruProduct
//
//  Created by 魏嘉楠 on 16/6/23.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import "ZRMyPageController.h"
#import "ZRMyPageHeaderView.h"
#import "ZRMyPageTableViewCell.h"
#import "ZRLoginViewController.h"
#import "ZRNavigationController.h"
#import "ZRUserInformationViewController.h"
@interface ZRMyPageController ()<UITableViewDelegate, UITableViewDataSource>


@property (nonatomic, strong)UITableView * tableView;

@property (nonatomic, strong)NSArray * contentArray;


@end

@implementation ZRMyPageController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // 创建左按钮: 联系我们
    [self createNavigationLeftButton];
    // 创建右按钮: 推送消息记录
    [self createNavigationRightButton];
    
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
}
- (NSArray *)contentArray
{
    if (_contentArray == nil) {
        _contentArray = [NSArray arrayWithObjects:@"我的订单",@"我的点评", @"待点评",@"我的收藏",@"我的团购券",@"我的购物车", nil];
    }
    return _contentArray;
}
- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight - 64 - 44) style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        [_tableView setBackgroundColor:RGBCOLOR(240, 240, 240)];
        ZRMyPageHeaderView * headerView = [[ZRMyPageHeaderView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 145.0 / 667.0 * ScreenHeight)];
        _tableView.tableHeaderView = headerView;
        
        [headerView.headerButton addTarget:self action:@selector(loginButton) forControlEvents:UIControlEventTouchUpInside];
        [headerView.footerView1.contentButton addTarget:self action:@selector(actionContentButton:) forControlEvents:UIControlEventTouchUpInside];
        [headerView.footerView2.contentButton addTarget:self action:@selector(actionContentButton:) forControlEvents:UIControlEventTouchUpInside];
        [headerView.footerView3.contentButton addTarget:self action:@selector(actionContentButton:) forControlEvents:UIControlEventTouchUpInside];
        
        
        UIView * view = [[UIView alloc] init];
        _tableView.tableFooterView = view;
    }
    return _tableView;
}
- (void)createNavigationLeftButton
{
    UIButton * leftButton = [MyControl createButtonWithFrame:CGRectMake(0, 0, 60, 40) ImageName:nil Target:self Action:@selector(contactMe) Title:@"联系我们"];
    [leftButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [leftButton setTitleColor:RGBCOLOR(255, 82, 82) forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
}
- (void)contactMe
{
    NSLog(@"联系我们");
}
- (void)createNavigationRightButton
{
    UIButton * rightButton = [MyControl createButtonWithFrame:CGRectMake(0, 0, 50, 40) ImageName:nil Target:self Action:@selector(pushMessage) Title:nil];
    [rightButton setImage:[UIImage imageNamed:@"gouwuche-1"] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
}

- (void)pushMessage
{
    NSLog(@"信封");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return self.contentArray.count;
    } else {
        return 1;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15.0 / 667.0 * ScreenHeight;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40.0 / 667.0 * ScreenHeight;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * myConsumptionInformation = @"myConsumptionInformation";// 消费信息
    static NSString * mySettings = @"mySettings";// 设置
    static NSString * myCooperation = @"myCooperation";// 合作
    
    if (indexPath.section == 0) {
        ZRMyPageTableViewCell * myConsumptionInformationCell = [tableView dequeueReusableCellWithIdentifier:myConsumptionInformation];
        if (myConsumptionInformationCell == nil) {
            myConsumptionInformationCell = [[ZRMyPageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:myConsumptionInformation];
        }
        [myConsumptionInformationCell.identificationLabel setText:[_contentArray objectAtIndex:indexPath.row]];
        return myConsumptionInformationCell;
    } else if (indexPath.section == 1) {
        ZRMyPageTableViewCell * mySettingsCell = [tableView dequeueReusableCellWithIdentifier:mySettings];
        if (mySettingsCell == nil) {
            mySettingsCell = [[ZRMyPageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:mySettings];
        }
        [mySettingsCell.identificationLabel setText:@"设置"];
        return mySettingsCell;
    } else {
        ZRMyPageTableViewCell * myCooperationCell = [tableView dequeueReusableCellWithIdentifier:myCooperation];
        if (myCooperationCell == nil) {
            myCooperationCell = [[ZRMyPageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:myCooperation];
        }
        [myCooperationCell.identificationLabel setText:@"合作"];
        return myCooperationCell;
    }
}
// 点击头部的点击登录
- (void)loginButton
{
    ZRLoginViewController * loginVC = [[ZRLoginViewController alloc] init];
    ZRNavigationController * loginVCNav = [[ZRNavigationController alloc] initWithRootViewController:loginVC];
    [self presentViewController:loginVCNav animated:YES completion:nil];
}
- (void)actionContentButton:(UIButton *)sender
{
    if (sender.tag == 1000) {
        ZRUserInformationViewController * userInforVC = [[ZRUserInformationViewController alloc] init];
        [self.navigationController pushViewController:userInforVC animated:YES];
        NSLog(@"我的钱包");
    } else if (sender.tag == 2000) {
        NSLog(@"我的积分");
    } else if (sender.tag == 3000) {
        NSLog(@"积分商场");
    }
}
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
