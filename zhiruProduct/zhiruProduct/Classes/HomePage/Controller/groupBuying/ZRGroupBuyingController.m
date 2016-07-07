//
//  ZRGroupBuyingController.m
//  zhiruProduct
//
//  Created by 魏嘉楠 on 16/7/5.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import "ZRGroupBuyingController.h"
#import "ZRTableVIewHeadView.h"


@interface ZRGroupBuyingController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic , weak) UITableView * GBTableView;

@end

@implementation ZRGroupBuyingController

-(UITableView *)GBTableView{
    
    if (_GBTableView == nil) {
        UITableView * GBTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth , ScreenHeight - 64) style:UITableViewStylePlain];
        
        [self.view addSubview:GBTableView];

        GBTableView.backgroundColor = [UIColor clearColor];
        
        GBTableView.rowHeight = UITableViewAutomaticDimension;
        GBTableView.estimatedRowHeight = 120.0;
        
        ZRTableVIewHeadView * tableViewHeadV = [[ZRTableVIewHeadView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 191) andTitleArr:@[@"美食",@"丽人",@"娱乐",@"旅游",@"生活服务",@"精品购物",@"待定",@"待定"]];
        
        GBTableView.tableHeaderView = tableViewHeadV;
        
        _GBTableView = GBTableView;
    }
    return _GBTableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    //加载头视图
    self.GBTableView.delegate = self;
    self.GBTableView.dataSource = self;
}

#pragma mark - tableView代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
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
