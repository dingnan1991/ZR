//
//  ZROrderingController.m
//  zhiruProduct
//
//  Created by 魏嘉楠 on 16/7/7.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import "ZROrderingController.h"
#import "ZRTableVIewHeadView.h"
#import "ZROrdeingCell.h"
#import "ZRQueryView.h"
#import "ZRScreeningView.h"
#import "navTitleView.h"
@interface ZROrderingController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,weak) UITableView * orderTableView;
@property (nonatomic , strong) ZRQueryView * queryView;
@property (nonatomic , strong) NSMutableArray * screeningMarr;
@end

@implementation ZROrderingController

-(NSMutableArray *)screeningMarr{
    if (_screeningMarr == nil) {
        _screeningMarr = [NSMutableArray array];
    }
    return _screeningMarr;
}

-(UITableView *)orderTableView{
    if (_orderTableView == nil) {
        UITableView * orderTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth , ScreenHeight - 64) style:UITableViewStylePlain];
        
        [self.view addSubview:orderTableView];

        orderTableView.backgroundColor = [UIColor clearColor];
        
        orderTableView.rowHeight = UITableViewAutomaticDimension;
        orderTableView.estimatedRowHeight = 120.0;
        
        ZRTableVIewHeadView * tableViewHeadV = [[ZRTableVIewHeadView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 191) andTitleArr:@[@"简餐",@"川菜",@"粤菜",@"私厨",@"东北菜",@"甜品",@"待定",@"待定"]];
        
        orderTableView.tableHeaderView = tableViewHeadV;
        
        _orderTableView = orderTableView;
    }
    return _orderTableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.orderTableView.delegate = self;
    self.orderTableView.dataSource = self;
    
    
    [self createHeadView];
}

#pragma mark - 创建头视图
- (void)createHeadView{
    
    for (int i =0; i<4; i++) {
        ZRScreeningView * screeningView = [[ZRScreeningView alloc] initWithFrame:CGRectMake(0, 104, ScreenWidth, ScreenHeight - 40)andTitleArr:@[@"1000",@"2000",@"3000",@"4000"]];
        [self.view addSubview:screeningView];
        
        [self.screeningMarr addObject:screeningView];
    }
    
    navTitleView * titleView = [[[NSBundle mainBundle] loadNibNamed:@"navTitleView" owner:self options:nil] lastObject];
    
    self.navigationItem.titleView = titleView;
    
    //点击标题,跳转定位界面
    titleView.navTitleClick = ^(){
        
        NSLog(@"附近外卖,跳转定位界面");
    };
}

#pragma mark -- tableView代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * Cell = @"LookProductCell";
    ZROrdeingCell *ordeingCell = [tableView dequeueReusableCellWithIdentifier:Cell];
    
    if (ordeingCell == nil) {
        NSArray *nibs = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([ZROrdeingCell class]) owner:self options:nil];
        ordeingCell = [nibs lastObject];
    }
    
    return ordeingCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    ZRQueryView * queryV = [[ZRQueryView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 40)andTitleArr:@[@"地理",@"品类",@"排序",@"筛选"]];
    
    _queryView = queryV;
    //按钮点击
    WS(ws)
    queryV.queryBtnClick = ^(NSInteger index){
        NSIndexPath *scrollIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [ws.orderTableView scrollToRowAtIndexPath:scrollIndexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
        
        
        for (UIView * rootV in ws.screeningMarr) {
            if (rootV == ws.screeningMarr[index]) {
                rootV.hidden = !rootV.hidden;
            }else{
                
                rootV.hidden = YES;
            }
        }
    };
    
    return queryV;
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
