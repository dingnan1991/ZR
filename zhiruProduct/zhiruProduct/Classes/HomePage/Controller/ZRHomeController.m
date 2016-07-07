//
//  ZRHomeController.m
//  zhiruProduct
//
//  Created by 魏嘉楠 on 16/6/23.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import "ZRHomeController.h"
#import "ZRHomeHeadView.h"
#import "UINavigationBar+ZRAwesome.h"
#import "ZRSearchView.h"
#import "ZRHomeCellOne.h"
#import "ZRHomeCellTwo.h"
#import "ZRLookForTasteController.h"
#import "ZROrderingController.h"

#define NAVBAR_CHANGE_POINT 50
#define NAVCOLOR [UIColor colorWithRed:250/255.0 green:250/255.0 blue:250/255.0 alpha:1]
@interface ZRHomeController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic , weak) UITableView * homeTableView;
/**顶部的视图*/
@property(nonatomic , strong) UIView *topView;
/**搜索栏的视图*/
@property(nonatomic , weak) ZRSearchView * searchView;
/**左按钮*/
@property(nonatomic , weak) UIButton * leftBtn;
/**右按钮*/
@property(nonatomic , weak) UIButton * rightBtn;
@end

@implementation ZRHomeController

#pragma mark -- 创建tableView

-(UITableView *)homeTableView{
    if (_homeTableView == nil) {
        UITableView * homeTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth , ScreenHeight - 64)];
        [self.view addSubview:homeTableView];
        _homeTableView = homeTableView;
        homeTableView.backgroundColor = [UIColor clearColor];
//        homeTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        homeTableView.rowHeight = UITableViewAutomaticDimension;
        homeTableView.estimatedRowHeight = 120.0;
        
        ZRHomeHeadView * headView = [[ZRHomeHeadView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 409)];
        WS(ws)
        headView.clickBtn = ^(NSInteger index){
          
            switch (index) {
                case 0: //寻味
                {
                    ZRLookForTasteController * lookVC = [[ZRLookForTasteController alloc] init];
                    lookVC.title = @"寻味";
                    [ws.navigationController pushViewController:lookVC animated:YES];
                    
                }
                    break;
                case 2:
                {
                    ZROrderingController * orderingVC = [[ZROrderingController alloc] init];
                    [ws.navigationController pushViewController:orderingVC animated:YES];
                }
                    break;
                default:
                    break;
            }
        };
        
        homeTableView.tableHeaderView = headView;
    }
    return _homeTableView ;
}


#pragma mark -- 视图生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor clearColor]];
    
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
    {
        self.edgesForExtendedLayout = UIRectEdgeAll;
        
    }
    //等model
    self.homeTableView.delegate = self;
    self.homeTableView.dataSource = self;
    
    //创建搜索框
    [self createSearchTitle];
    
    //创建左按钮
    [self createNavLeftBtn];
    
    //创建右按钮
    [self createNavRightBtn];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    [self homeInitialization];

}


-(void)viewWillDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.navigationController.navigationBar lt_reset];
}
#pragma mark - 创建搜索框

- (void)createSearchTitle{
    
    
   ZRSearchView * searchView  =  [[ZRSearchView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth * 0.6, 28)];
    _searchView = searchView;
    
    self.navigationItem.titleView = searchView;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section == 0) {
        return 1;
    }else{
        return 5;
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    
    
    if (section == 0) {
        return @"我的广告";
    }else{
        return @"好店推荐";
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    NSString *sectionTitle=[self tableView:tableView titleForHeaderInSection:section];
   
    if (sectionTitle==nil) {
   
           return nil;
   
       }
   
    // Create label with section title
  
      UILabel *label=[[UILabel alloc] init] ;
  
      label.backgroundColor=[UIColor clearColor];
  
      label.textColor=[UIColor blackColor];
  
      label.font=[UIFont systemFontOfSize:14];
  
      label.text=sectionTitle;
  
      label.textColor = R_G_B_16(0x555555);
  
      // Create header view and add label as a subview
  
      UIView *sectionView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 22)] ;

      [sectionView setBackgroundColor:R_G_B_16(0xfafafa)];

      [sectionView addSubview:label];

      [label mas_makeConstraints:^(MASConstraintMaker *make) {
          make.left.equalTo(sectionView.mas_left).offset(12);
          make.centerY.equalTo(sectionView.mas_centerY);
      }];
    
       return sectionView;
   
   
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * productCell = @"ProductCell";
    static NSString * advertisementCell = @"advertisementCell";
    
    switch (indexPath.section) {
        case 0:
        {
            ZRHomeCellOne * cellOne = [tableView dequeueReusableCellWithIdentifier:advertisementCell];
            if (cellOne == nil) {
                NSArray *nibs = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([ZRHomeCellOne class]) owner:self options:nil];
                cellOne = [nibs lastObject];
            }
            cellOne.selectionStyle = UITableViewCellSelectionStyleNone;
            [cellOne createAdvertisementAndImgOne:@"tu" AndImgTwo:@"tu-0"];
            return cellOne;
        }
            break;
        case 1:
        {
            ZRHomeCellTwo *cellTwo = [tableView dequeueReusableCellWithIdentifier:productCell];
            
            if (cellTwo == nil) {
                NSArray *nibs = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([ZRHomeCellTwo class]) owner:self options:nil];
                cellTwo = [nibs lastObject];
            }
            
            return cellTwo;
        }
            break;
        default:
            break;
    }
    return nil;
   
}

#pragma mark -- 监听滑动距离
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetY = scrollView.contentOffset.y;

    if (offsetY > 0) {
        CGFloat alpha = 1 - ((64 - offsetY) / 64);
        [self.navigationController.navigationBar lt_setBackgroundColor:[NAVCOLOR colorWithAlphaComponent:alpha]];
         [_leftBtn setTitleColor:R_G_B_16(0xff5252) forState:UIControlStateNormal];
        [_rightBtn setImage:[UIImage imageNamed:@"gouwuche-1"] forState:UIControlStateNormal];
        [_leftBtn setImage:[UIImage imageNamed:@"jiantou-hong"] forState:UIControlStateNormal];
    } else {

        [self homeInitialization];
    }
}

#pragma mark -- 初始化
- (void)homeInitialization{
     [_leftBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
     [_leftBtn setImage:[UIImage imageNamed:@"jiantou"] forState:UIControlStateNormal];
     [self.navigationController.navigationBar lt_setBackgroundColor:[NAVCOLOR colorWithAlphaComponent:0]];
     [self.navigationController.navigationBar setShadowImage:[UIImage new]];
     [_rightBtn setImage:[UIImage imageNamed:@"gouwuche"] forState:UIControlStateNormal];
}

#pragma mark -- 创建左按钮

- (void)createNavLeftBtn{
    
    UIButton * leftBtn = [MyControl createButtonWithFrame:CGRectMake(5, 0,50, 44) ImageName:nil Target:self Action:@selector(chageCity) Title:@"未定位"];
    [leftBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.leftBtn = leftBtn;
    self.leftBtn.titleLabel.font = [UIFont systemFontOfSize:Font_BtnTitle];
    [self.leftBtn setImage:[UIImage imageNamed:@"jiantou"] forState:UIControlStateNormal];

    [self.leftBtn setImageEdgeInsets:UIEdgeInsetsMake(0,40, 0, 0)];
    [self.leftBtn setTitleEdgeInsets:UIEdgeInsetsMake(0,-35, 0, 0)];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:self.leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
}

#pragma mark -- 创建右按钮
- (void)createNavRightBtn{
    UIButton * rightBtn = [MyControl createButtonWithFrame:CGRectMake(5, 0, 50, 44) ImageName:nil Target:self Action:@selector(shoppingCart) Title:nil];
    _rightBtn = rightBtn ;
    
    [rightBtn setImage:[UIImage imageNamed:@"gouwuche-1"] forState:UIControlStateNormal];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
}
#pragma mark -- 左按钮点击事件

- (void)chageCity{
    NSLog(@"点击左按钮");
}

#pragma mark -- 右按钮点击事件

- (void)shoppingCart{
    NSLog(@"点击右按钮");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

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
