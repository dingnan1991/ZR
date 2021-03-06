//
//  ZRImmediatelyExchangeController.m
//  zhiruProduct
//
//  Created by nanding on 16/7/6.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import "ZRImmediatelyExchangeController.h"
#import "ZRImmediatelyExchangeCell.h"

@interface ZRImmediatelyExchangeController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataArray;


@property (nonatomic, strong) UIButton *exChangeBtn;

@end

@implementation ZRImmediatelyExchangeController


#pragma mark - lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"立即兑换";
    
    [self.view addSubview:self.tableView];
    [self.tableView addSubview:self.exChangeBtn];
    
}


#pragma mark - 懒加载
-(UITableView *)tableView
{
    if (!_tableView) {        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return _tableView;
}

-(NSMutableArray *)dataArray
{
    if (!_dataArray) {
#warning 图片需要修改
        NSArray *arr = @[ZRImage(@"dibiao"),@"朴健",@"先生",@"17702421846",@"吉林省长春市朝阳区人民大街航空国际A座11111111111aaaaaaaaaaaaaaaaaaaaa"];
        _dataArray = [NSMutableArray array];
        [_dataArray addObject:arr];
        [_dataArray addObject: @[@[@"[牙膏中的爱马仕]",@"110"],@[@"数量:",@"1"],@[@"小计",@"110"]]];
        
    }
    return _dataArray;
}


-(UIButton *)exChangeBtn
{
    if (!_exChangeBtn) {
        _exChangeBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 295, 40)];
        _exChangeBtn.center = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2);
        _exChangeBtn.backgroundColor = RGBCOLOR(245, 57, 66);
        [_exChangeBtn setTitle:@"立即兑换" forState:UIControlStateNormal];
        [_exChangeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _exChangeBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [_exChangeBtn addTarget:self action:@selector(exChangeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        _exChangeBtn.layer.cornerRadius = 5;
     
        
    }
    return _exChangeBtn;
}


#pragma mark - UITableViewDataSource methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }else
        return [self.dataArray[section] count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZRImmediatelyExchangeCell *cell = [ZRImmediatelyExchangeCell cellWithTable:self.tableView IndexPath:indexPath];
    if (indexPath.section == 0) {
        cell.addressArr = self.dataArray[0];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else{
        cell.textLabel.text = self.dataArray[1][indexPath.row][0];
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        label.text = self.dataArray[1][indexPath.row][1];
        cell.accessoryView = label;
    }
    
    
    return cell;
    
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = nil;
    if (section == 1) {
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 1)];
        view.backgroundColor = [UIColor blackColor];
    }
    return view;
}


#pragma mark - UITableViewDelegate methods
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 100;
    }else
        return 40;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0.1;
    }else
        return 1;
}


#pragma mark - Click methods
- (void)exChangeBtnClick:(UIButton *)sender
{
    
}


#pragma mark - manage memory methods
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
