//
//  ZROrderingDetailsController.m
//  zhiruProduct
//
//  Created by 魏嘉楠 on 16/7/8.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import "ZROrderingDetailsController.h"
#import "orderingDetailsHeadView.h"
#import "orderingSectionView.h"
#import "ZRBaseOrderingViewCell.h"

@interface ZROrderingDetailsController ()< UITableViewDelegate , UITableViewDataSource , ZRBaseOrderingViewCellDelegate >
@property (nonatomic  , strong) UIView * headView;

@property (nonatomic  , strong) UITableView * myTableView;

@property (nonatomic  , strong) ZRBaseOrderingViewCell * cell;

@property (nonatomic  , strong) orderingSectionView * sectionView;

@property (nonatomic  , assign) CGFloat offsetY;
@end

@implementation ZROrderingDetailsController

- (UITableView *)myTableView{
    if (_myTableView == nil) {
        _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth , ScreenHeight  ) style:UITableViewStylePlain];
        
        [self.view addSubview:_myTableView];
        
        _myTableView.backgroundColor = [UIColor clearColor];
        
        _myTableView.rowHeight = UITableViewAutomaticDimension;
        _myTableView.estimatedRowHeight = 120.0;
        
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        
        //禁止此tableview滚动
        _myTableView.scrollEnabled =NO;
        
        orderingDetailsHeadView * headView = [[[NSBundle mainBundle] loadNibNamed:@"orderingDetailsHeadView" owner:self options:nil] lastObject];
        
        headView.frame = CGRectMake(0, 0, ScreenWidth, headView.height);
        
        _headView = headView;
        
        _myTableView.tableHeaderView = headView;
    }
    return  _myTableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
    {
        self.edgesForExtendedLayout = UIRectEdgeAll;
        
    }
    
    //添加导航条右按钮
    [self createNavRightBtn];
    
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self homeInitialization];
    
}


-(void)viewWillDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.navigationController.navigationBar lt_reset];
}

#pragma mark -- 初始化
- (void)homeInitialization{

    [self.navigationController.navigationBar lt_setBackgroundColor:[NAVCOLOR colorWithAlphaComponent:0]];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];

}

#pragma mark - 导航条右按钮
- (void)createNavRightBtn{
    
    UIButton * rightBtn = [MyControl createButtonWithFrame:CGRectMake(5, 0, 50, 44) ImageName:nil Target:self Action:@selector(rightBtnClick:) Title:nil];
//    _rightBtn = rightBtn ;
    rightBtn.tag = 0;
    [rightBtn setImage:[UIImage imageNamed:@"share"] forState:UIControlStateNormal];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
//    self.navigationItem.rightBarButtonItem = rightItem;
    
    UIButton * rightIslikeBtn = [MyControl createButtonWithFrame:CGRectMake(5, 0, 50, 44) ImageName:nil Target:self Action:@selector(rightBtnClick:) Title:nil];
    
    [rightIslikeBtn setImage:[UIImage imageNamed:@"islike"] forState:UIControlStateNormal];
    [rightIslikeBtn setImage:[UIImage imageNamed:@"islike_hong"] forState:UIControlStateSelected];
    
    rightIslikeBtn.tag = 1;
    UIBarButtonItem *rightIsLikeItem = [[UIBarButtonItem alloc]initWithCustomView:rightIslikeBtn];
//    self.navigationItem.rightBarButtonItem = rightIsLikeItem;
    
    [self.navigationItem setRightBarButtonItems:@[rightIsLikeItem,rightItem]];
}

#pragma mark - tableView代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * identifier = @"baseCell";
    
    ZRBaseOrderingViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    
    if (cell == nil) {
        cell = [[ZRBaseOrderingViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        _cell = cell;
        cell.delegate = self;
        WS(ws)
        //里面的视图 横向滚动停止调用
        cell.cellDisplaying = ^(NSIndexPath * indexPath){
            ws.sectionView.index = indexPath.row;
        };
        
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return ScreenHeight - 203 + 90;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    orderingSectionView * sectionView = [[[NSBundle mainBundle] loadNibNamed:@"orderingSectionView" owner:self options:nil] lastObject];
    
    _sectionView = sectionView;
    
    UIView * view = [UIView new];

    view.frame = CGRectMake(0, 0, ScreenWidth, 50);
    
    [view addSubview:sectionView];
    
    [sectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view.mas_left);
        make.right.equalTo(view.mas_right);
        make.top.equalTo(view.mas_top);
        make.height.equalTo(@50);
    }];
    
    WS(ws)
    sectionView.btnClick = ^(NSInteger index){
        ws.cell.index = index;

    };
    
    return view;
}

#pragma mark -- 滑动监听
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat offsetY = scrollView.contentOffset.y;
    _offsetY = offsetY;
    if (offsetY > 0) {
        CGFloat alpha = 1 - ((64 - offsetY) / 64);
        [self.navigationController.navigationBar lt_setBackgroundColor:[NAVCOLOR colorWithAlphaComponent:alpha]];
        [self.navigationItem setTitleView:[MyControl createNavigationTitle:@"这是饭店名"]];
    } else {
        [self.navigationItem setTitleView:[UIView new]];
        [self homeInitialization];
    }
}

-(void)baseOrderingViewCellDidScrollWithOffsetY:(CGFloat)offsetY{

    
    CGFloat currentOffset = self.myTableView.contentOffset.y;
    currentOffset += offsetY;

     self.myTableView.contentOffset = CGPointMake(0, currentOffset);
    if (_offsetY > 89) {
         self.myTableView.contentOffset = CGPointMake(0, 89);
    }
    if (_offsetY<0) {
        self.myTableView.contentOffset = CGPointMake(0, 0);
    }
}

#pragma mark - 右导航条按钮点击
- (void)rightBtnClick :(UIButton * ) btn{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{

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
