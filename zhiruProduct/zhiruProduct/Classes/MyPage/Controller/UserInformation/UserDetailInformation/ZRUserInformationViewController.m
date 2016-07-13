//
//  ZRUserInformationViewController.m
//  zhiruProduct
//
//  Created by pj on 16/7/11.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import "ZRUserInformationViewController.h"
#import "ZRHeadImageTableViewCell.h"
#import "ZRUserContentTableViewCell.h"
#import "ZRNameViewController.h"
#import "ZRAddressViewController.h"
@interface ZRUserInformationViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView * tableView;

@property (nonatomic, strong)NSArray * titleArray;
@property (nonatomic, strong)NSArray * contentArray;
@end

@implementation ZRUserInformationViewController

- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, 400.0 / 667.0 * ScreenHeight) style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}
- (NSArray *)titleArray
{
    if (_titleArray == nil) {
        _titleArray = [NSArray arrayWithObjects:@"昵称",@"性别",@"生日",@"家乡",@"绑定手机号",@"收货地址",@"会员身份",@"设置密码", nil];
    }
    return _titleArray;
}
- (NSArray *)contentArray
{
    if (_contentArray == nil) {
        _contentArray = [NSArray arrayWithObjects:@"设置",@"设置",@"获星座标签",@"设置",@"设置",@"修改/添加",@"成为VIP享特权",@"修改", nil];
    }
    return _contentArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitle:@"个人信息"];
    self.view.backgroundColor = RGBCOLOR(240, 240, 240);
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    
    UIButton * exitLoginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:exitLoginButton];
    WS(weakSelf);
    [exitLoginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view).with.offset(40);
        make.right.equalTo(weakSelf.view).with.offset(-40);
        make.top.equalTo(weakSelf.tableView.mas_bottom).with.offset(25);
        make.height.mas_equalTo(40);
    }];
    [exitLoginButton setTitle:@"退出当前账号" forState:UIControlStateNormal];
    [exitLoginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    exitLoginButton.backgroundColor = RGBCOLOR(255, 82, 82);
    exitLoginButton.layer.masksToBounds = YES;
    exitLoginButton.layer.cornerRadius = 5;
    [exitLoginButton addTarget:self action:@selector(actionExitButton) forControlEvents:UIControlEventTouchUpInside];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArray.count + 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 80.0 / 667.0 * ScreenHeight;
    } else {
        return 40.0 / 667.0 * ScreenHeight;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * headCellID = @"headImage";
    static NSString * contentCellID = @"content";
    if (indexPath.row == 0) {
        ZRHeadImageTableViewCell * headCell = [tableView dequeueReusableCellWithIdentifier:headCellID];
        if (headCell == nil) {
            headCell = [[ZRHeadImageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:headCellID];
        }
        return headCell;
    } else {
        ZRUserContentTableViewCell * contentCell = [tableView dequeueReusableCellWithIdentifier:contentCellID];
        if (contentCell == nil) {
            contentCell = [[ZRUserContentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:contentCellID];
        }
        [contentCell.titleLabel setText:[_titleArray objectAtIndex:indexPath.row - 1]];
        [contentCell.contentLabel setText:[self.contentArray objectAtIndex:indexPath.row - 1]];
        return contentCell;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        
    } else if (indexPath.row == 1) {
        ZRNameViewController * nameVC = [[ZRNameViewController alloc] init];
        [self.navigationController pushViewController:nameVC animated:YES];
    } else if (indexPath.row == 2) {
        UIAlertController * sexActionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        [sexActionSheet addAction:[UIAlertAction actionWithTitle:@"男" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"男");
        }]];
        [sexActionSheet addAction:[UIAlertAction actionWithTitle:@"女" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"女");
        }]];
        [sexActionSheet addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"取消");
        }]];
        [self presentViewController:sexActionSheet animated:YES completion:nil];
    } else if (indexPath.row == 3) {
        
    } else if (indexPath.row == 4) {
        
    } else if (indexPath.row == 5) {
        
    } else if (indexPath.row == 6) {
        ZRAddressViewController * addressVC = [[ZRAddressViewController alloc] init];
        [self.navigationController pushViewController:addressVC animated:YES];
    } else if (indexPath.row == 7) {
        
    } else if (indexPath.row == 8) {
        
    }
}
- (void)actionExitButton
{
    NSLog(@"退出当前账号");
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
