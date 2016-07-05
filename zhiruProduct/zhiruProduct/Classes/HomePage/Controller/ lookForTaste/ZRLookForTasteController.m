//
//  ZRLookForTasteController.m
//  zhiruProduct
//
//  Created by 魏嘉楠 on 16/7/5.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import "ZRLookForTasteController.h"
#import "ZRTableVIewHeadView.h"
#import "ZRQueryView.h"
#import "ZRHomeCellTwo.h"


@interface ZRLookForTasteController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic , weak) UITableView * LookTableView;

@property (nonatomic , strong) ZRTableVIewHeadView * headView;

@end

@implementation ZRLookForTasteController

-(UITableView *)LookTableView{
    if (_LookTableView == nil) {
        UITableView * LookTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth , ScreenHeight - 64) style:UITableViewStylePlain];

        [self.view addSubview:LookTableView];
        _LookTableView = LookTableView;
        LookTableView.backgroundColor = [UIColor clearColor];

        LookTableView.rowHeight = UITableViewAutomaticDimension;
        LookTableView.estimatedRowHeight = 120.0;
        
        ZRTableVIewHeadView * tableViewHeadV = [[ZRTableVIewHeadView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 181) andTitleArr:@[@"自助",@"烧烤",@"川菜",@"西北菜",@"粤菜",@"东北菜",@"浙江菜",@"简餐"]];
        

        
        LookTableView.tableHeaderView = tableViewHeadV;
        
        _LookTableView = LookTableView;
    }
    
    return _LookTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //加载头视图
    self.LookTableView.delegate = self;
    self.LookTableView.dataSource = self;
    
}

#pragma mark - 创建头视图
- (void)createHeadView{
    

    
}


#pragma mark - tableView代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * productCell = @"LookProductCell";
    ZRHomeCellTwo *cellTwo = [tableView dequeueReusableCellWithIdentifier:productCell];
    
    if (cellTwo == nil) {
        NSArray *nibs = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([ZRHomeCellTwo class]) owner:self options:nil];
        cellTwo = [nibs lastObject];
    }
    
    return cellTwo;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 65;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    ZRQueryView * queryV = [[ZRQueryView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 65)];
    
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
