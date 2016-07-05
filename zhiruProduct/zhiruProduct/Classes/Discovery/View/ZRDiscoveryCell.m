//
//  ZRDiscoveryCell.m
//  zhiruProduct
//
//  Created by nanding on 16/7/4.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import "ZRDiscoveryCell.h"
#import "ZRDiscoveryTableCell.h"
#import "ZRColletionViewLayout.h"

@interface ZRDiscoveryCell ()<UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UICollectionView *collectionView;

@end

static NSString *ID = @"ID";
@implementation ZRDiscoveryCell


-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = RGBCOLOR(240, 240, 240);
        [self addSubview:_tableView];
        
    }
    return _tableView;
}

-(UICollectionView *)collectionView
{
    if (!_collectionView) {
        //流水布局
        ZRColletionViewLayout *layout = [[ZRColletionViewLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.itemCount = 100;
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
       
    }
    return _collectionView;
}

-(void)setDataArray:(NSArray *)dataArray
{
    _dataArray = dataArray;
    
    [self.tableView reloadData];
    
    
}

-(void)setCollectionArray:(NSArray *)collectionArray
{
    _collectionArray = collectionArray;
    [self addSubview:self.collectionView];
}

#pragma mark - UICollectionViewDataSource

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 100;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    cell.layer.borderColor = [UIColor redColor].CGColor;
    cell.layer.borderWidth = 1;
    return cell;
}




#pragma mark - UITableViewDataSource methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.cellIndex == index0) {
        NSDictionary *dic = self.dataArray[section];
        if (section == 0) {
            return 1;
        }else
            
            return [[dic allValues][0] count];
        
    }else
        return [self.dataArray[section] count];
    
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZRDiscoveryTableCell *cell = [ZRDiscoveryTableCell cellWithTableView:self.tableView];
    
    if (self.cellIndex == index0) {
        if (indexPath.section == 0) {
            cell.categoryDic = self.dataArray[0];
        }else{
            cell.dic = self.dataArray[indexPath.section];
        }
        
        
    }else{
        cell.dic = self.dataArray[indexPath.section];
        
    }
    
    return cell;
    
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = nil;
    if (self.cellIndex == index0 && section != 0) {
        view = [[UIView alloc] initWithFrame:CGRectMake(15, 15, SCREEN_WIDTH-30, 105)];
        //view.backgroundColor = [UIColor grayColor];
        UIImageView *imgView = [[UIImageView alloc] init];
        imgView.backgroundColor = [UIColor redColor];
//        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
//            //make.edges.equalTo(view).with.insets(UIEdgeInsetsMake(15, 15, 15, 15));
//            make.left.equalTo(@15);
//            
//        }];
        
        [view addSubview:imgView];
        
        return view;
    }else
        return view;
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.cellIndex == index0) {
        return 100;
    }else
        return 150;
}



-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (self.cellIndex == index0 && section != 0) {
        return 105;
    }else
        return 0.1;
}


@end
