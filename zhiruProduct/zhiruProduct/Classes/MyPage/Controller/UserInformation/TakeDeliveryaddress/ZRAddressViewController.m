//
//  ZRAddressViewController.m
//  zhiruProduct
//
//  Created by pj on 16/7/11.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import "ZRAddressViewController.h"
#import "ZRAddressTableViewCell.h"
#import "ZRAddView.h"
#import "ZRNewAddressViewController.h"
@interface ZRAddressViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView * tableView;

@end

@implementation ZRAddressViewController


- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight - 64 - 50) style:UITableViewStylePlain];
        [_tableView setBackgroundColor:RGBCOLOR(240, 240, 240)];
        [self.view addSubview:_tableView];
        UIView * view = [UIView new];
        _tableView.tableFooterView = view;
        ZRAddView * addView = [[ZRAddView alloc] initWithFrame:CGRectMake(0, _tableView.frame.origin.y + _tableView.frame.size.height, ScreenWidth, 50)];
        [addView setBackgroundColor:[UIColor whiteColor]];
        [addView.clearButton addTarget:self action:@selector(actionAddNewAddress) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:addView];
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setTitle:@"收获地址"];
    [self.view setBackgroundColor:RGBCOLOR(240, 240, 240)];
    
    
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * addressCellID = @"addressCellID";
    ZRAddressTableViewCell * tableViewCell = [tableView dequeueReusableCellWithIdentifier:addressCellID];
    if (tableViewCell == nil) {
        tableViewCell = [[ZRAddressTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:addressCellID];
    }
    tableViewCell.str1 = @"朴健  先生  17702421846";
    tableViewCell.str2 = @"吉林省长春市朝阳区人民大街航空国际A座";
    return tableViewCell;
}
- (void)actionAddNewAddress
{
    ZRNewAddressViewController * newAddressVC = [[ZRNewAddressViewController alloc] init];
    [self.navigationController pushViewController:newAddressVC animated:YES];
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
