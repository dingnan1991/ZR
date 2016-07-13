//
//  ZRSupermarketHomeController.m
//  zhiruProduct
//
//  Created by nanding on 16/7/9.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import "ZRSupermarketHomeController.h"
#import "ZRSupermarketHome.h"

@interface ZRSupermarketHomeController ()<ZRSupermarketHomeDataSource, ZRSupermarketHomeDelegate>


@property (nonatomic, strong) NSArray *leftArr;

@property (nonatomic, strong) NSMutableArray *rightArr;


@end

@implementation ZRSupermarketHomeController
#pragma mark - lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"超市到家";
    
    ZRSupermarketHome *supermarketHome = [[ZRSupermarketHome alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
    supermarketHome.dataSource = self;
    supermarketHome.delegate = self;
    supermarketHome.categoryStyle = (HomeCategoryStyle)self.style;
    [self.view addSubview:supermarketHome];
    
    
    
    
    
}


#pragma mark - 懒加载
-(NSArray *)leftArr
{
    if (!_leftArr) {
        _leftArr = @[@"新品上市",@"最新折扣",@"休闲零食",@"火锅精选",@"粮油副食",@"牛奶果汁",@"饮料冲饮",@"速冻美味",@"方便面线"];
    }
    return _leftArr;
}


-(NSMutableArray *)rightArr
{
    if (!_rightArr) {
        _rightArr = [NSMutableArray array];
        for (int i=0; i<self.leftArr.count; i++) {
            NSMutableArray *mutableArr = [NSMutableArray array];
            for (int j=0; j<12; j++) {
                NSArray *arr = @[ZRImage(@"yuding"),@"青柠红茶",@"$5"];
                [mutableArr addObject:arr];
            }
            [_rightArr addObject:mutableArr];
            
        }
    }
    return _rightArr;
}


#pragma mark - ZRSupermarketHomeDataSource methods
-(NSInteger)ZRLeftnumberOfRowsInSection:(NSInteger)section Table:(UITableView *)table
{
    
    return self.leftArr.count;
}



-(NSString *)ZRLeftTableView:(UITableView *)table cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.leftArr[indexPath.row];
}

-(NSInteger)ZRRightnumberOfSectionsInTable:(UITableView *)table
{
    return self.rightArr.count;
}

-(NSInteger)ZRRightnumberOfRowsInSection:(NSInteger)section Table:(UITableView *)table
{
    return [self.rightArr[section] count];
}


-(NSArray *)ZRRightTableView:(UITableView *)table cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.rightArr[indexPath.section][indexPath.row];
}



#pragma mark - ZRSupermarketHomeDelegate
-(NSString *)ZRRightTitleForHeaderInSection:(NSInteger)section RightTable:(UITableView *)table
{
    return self.leftArr[section];
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
