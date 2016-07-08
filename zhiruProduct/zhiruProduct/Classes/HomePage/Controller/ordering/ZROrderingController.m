//
//  ZROrderingController.m
//  zhiruProduct
//
//  Created by 魏嘉楠 on 16/7/7.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import "ZROrderingController.h"

#import "ZROrdeingCell.h"


#import "navTitleView.h"
@interface ZROrderingController ()

@end

@implementation ZROrderingController



//-(UITableView *)orderTableView{
//    if (_orderTableView == nil) {
//        UITableView * orderTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth , ScreenHeight - 64) style:UITableViewStylePlain];
//        
//        [self.view addSubview:orderTableView];
//
//        orderTableView.backgroundColor = [UIColor clearColor];
//        
//        orderTableView.rowHeight = UITableViewAutomaticDimension;
//        orderTableView.estimatedRowHeight = 120.0;
//        
//        ZRTableVIewHeadView * tableViewHeadV = [[ZRTableVIewHeadView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 191) andTitleArr:@[@"简餐",@"川菜",@"粤菜",@"私厨",@"东北菜",@"甜品",@"待定",@"待定"]];
//        
//        orderTableView.tableHeaderView = tableViewHeadV;
//        
//        _orderTableView = orderTableView;
//    }
//    return _orderTableView;
//}


- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - 创建头视图
- (void)createHeadView{
    
    for (int i = 0; i < self.ScreeningDict.count; i++) {
        
        
        ZRScreeningView * screeningView = [[ZRScreeningView alloc] initWithFrame:CGRectMake(0, 104, ScreenWidth, ScreenHeight - 40)andTitleArr:self.ScreeningDict[self.queryArr[i]]];
        [self.view addSubview:screeningView];
        
        
        
        screeningView.screeningViewClick = ^(NSString * infoStr){
            NSLog(@"%@",infoStr);
        };
        
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
