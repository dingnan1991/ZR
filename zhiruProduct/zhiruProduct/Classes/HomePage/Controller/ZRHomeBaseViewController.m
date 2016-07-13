//
//  ZRHomeBaseViewController.m
//  zhiruProduct
//
//  Created by 魏嘉楠 on 16/7/7.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import "ZRHomeBaseViewController.h"

@interface ZRHomeBaseViewController ()<UITableViewDelegate , UITableViewDataSource>




@end

@implementation ZRHomeBaseViewController

-(NSMutableArray *)screeningMarr{
    if (_screeningMarr == nil) {
        _screeningMarr = [NSMutableArray array];
    }
    return _screeningMarr;
}



-(UITableView *)myTableView{
    
    if (_myTableView == nil) {
        UITableView * myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth , ScreenHeight - 64) style:UITableViewStylePlain];
        
        [self.view addSubview:myTableView];
        
        myTableView.backgroundColor = [UIColor clearColor];
        
        myTableView.rowHeight = UITableViewAutomaticDimension;
        myTableView.estimatedRowHeight = 120.0;
        
        CGFloat headVH ;
        if (self.titleArr.count == 4) {
            headVH = 125;
        }else{
            headVH = 215;
        }
        
        ZRTableVIewHeadView * tableViewHeadV = [[ZRTableVIewHeadView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, headVH) andTitleArr:_titleArr];
        
        myTableView.tableHeaderView = tableViewHeadV;
        
        _myTableView = myTableView;
    }
    return _myTableView;
}



- (void)viewDidLoad {
    [super viewDidLoad];

    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    [self createHeadView];
}

#pragma mark -- 初始化方法,传入相应的数据
- (instancetype)initWithTitleArr :(NSArray *)titleArr andScreeningDict :(NSDictionary *)screeningDict andQueryTitleArr :(NSArray*)queryTitleArr{
    
    self = [super init];
    if (self) {
        _titleArr = titleArr;
        _ScreeningDict = screeningDict;
        _queryArr = queryTitleArr;
    }
    return self;
    
}
- (void)createHeadView{
    
    for (int i = 0; i < _ScreeningDict.count; i++) {
        

        ZRScreeningView * screeningView = [[ZRScreeningView alloc] initWithFrame:CGRectMake(0, 104, ScreenWidth, ScreenHeight - 40)andTitleArr:_ScreeningDict[self.queryArr[i]]];
        [self.view addSubview:screeningView];
        
        _screeningView = screeningView;
        
        [self.screeningMarr addObject:screeningView];
    }
    
  
    
}
#pragma mark - tableView代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    ZRQueryView * queryV = [[ZRQueryView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 40)andTitleArr:_queryArr];
    
    _queryView = queryV;
    //按钮点击
    WS(ws)
    queryV.queryBtnClick = ^(NSInteger index){
        NSIndexPath *scrollIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [ws.myTableView  scrollToRowAtIndexPath:scrollIndexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
        

        
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
