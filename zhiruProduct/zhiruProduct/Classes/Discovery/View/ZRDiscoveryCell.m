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
#import "ZRRecommentHeader.h"

@interface ZRDiscoveryCell ()<UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate, ZRDiscoveryTableCellDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) ZRRecommentHeader *headerView;

@end

static NSString *ID = @"ID";
@implementation ZRDiscoveryCell


-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundView = nil;
        _tableView.backgroundColor = RGBCOLOR(240, 240, 240);
        [self addSubview:_tableView];
        [self showFloatedUpButton];
        
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
    cell.backgroundColor = RGBCOLOR(240, 240, 240);
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
    ZRDiscoveryTableCell *cell = [ZRDiscoveryTableCell cellWithTableView:self.tableView withIndexPath:indexPath];
    cell.delegate = self;
    if (self.cellIndex == index0) {
        if (indexPath.section == 0) {
            cell.categoryDic = self.dataArray[0];
            cell.dic = nil;
        }else{
            //cell.categoryDic = nil;
            cell.dic = self.dataArray[indexPath.section];
        }
        
        
    }else{
        cell.dic = self.dataArray[indexPath.section];
        
    }
    
//    cell.layer.borderColor = [UIColor grayColor].CGColor;
//    cell.layer.borderWidth = 1;
    
    
    return cell;
    
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (self.cellIndex == index0 && section != 0) {
        _headerView = [[ZRRecommentHeader alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-30, 105)];
        NSDictionary *dic = self.dataArray[section];
        _headerView.titleStr = dic.allKeys.firstObject;
        
        //添加手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sellAllTap:)];
        [_headerView addGestureRecognizer:tap];
        
        return _headerView;
    }else
        return _headerView;
    
}



-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = RGBCOLOR(240, 240, 240);
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = RGBCOLOR(173, 173, 173);
    [view addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(@0);
        make.right.equalTo(@0);
        make.height.equalTo(@1);
        
    }];
    
    return view;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.cellIndex == index0){
        if (indexPath.section == 0) {
            return 100;
        }else
            return 125;
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

#pragma mark - ZRDiscoveryTableCellDelegate method
/**
 *  推荐：分类点击事件
 *
 *  @param sender 美食、丽人、娱乐、旅行、购物、生活
 */
-(void)categoriesClick:(NSInteger)btnTag withCell:(ZRDiscoveryTableCell *)tableCell
{
    
      switch (btnTag) {
        case 100:
        {
            
            CGRect rect = [self.tableView rectForFooterInSection:0];
            [self.tableView setContentOffset:CGPointMake(0,CGRectGetMaxY(rect)) animated:YES];
            
        }
            break;
        case 100+1:
        {
            CGRect rect = [self.tableView rectForFooterInSection:1];
            [self.tableView setContentOffset:CGPointMake(0,CGRectGetMaxY(rect)) animated:YES];
            
        }
            break;
        case 100+2:
        {
            CGRect rect = [self.tableView rectForFooterInSection:2];
            [self.tableView setContentOffset:CGPointMake(0,CGRectGetMaxY(rect)) animated:YES];
        }
            break;
        case 100+3:
        {
            CGRect rect = [self.tableView rectForFooterInSection:3];
            [self.tableView setContentOffset:CGPointMake(0,CGRectGetMaxY(rect)) animated:YES];
        }
            break;
        case 100+4:
        {
            CGRect rect = [self.tableView rectForFooterInSection:4];
            [self.tableView setContentOffset:CGPointMake(0,CGRectGetMaxY(rect)) animated:YES];
        }
            break;
        case 100+5:
        {
            CGRect rect = [self.tableView rectForFooterInSection:5];
            [self.tableView setContentOffset:CGPointMake(0,CGRectGetMaxY(rect)) animated:YES];
        }
            break;
            
        default:
            break;
    }

}


#pragma mark - 显示浮动向上的按钮
- (void)showFloatedUpButton
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    CGFloat width = 40*SCREEN_WIDTH/375;
    CGFloat x = SCREEN_WIDTH-width-15;
    CGFloat y = SCREEN_HEIGHT-15-49-width;
    UIButton *upButton = [MyControl createButtonWithFrame:CGRectMake(x, y, width, width) ImageName:@"" Target:self Action:@selector(upButtonClick:) Title:nil];
    
#warning 暂无图片，先设置一个颜色
    upButton.backgroundColor = [UIColor blackColor];
    
    [window addSubview:upButton];
    
}


#pragma mark - click methods
/**
 *  浮动向上的按钮点击事件
 *
 *  @param sender
 */
- (void)upButtonClick:(UIButton *)sender
{
    
    [self.tableView setContentOffset:CGPointMake(0, 0) animated:YES];
}

/**
 *  推荐：查看全部
 *
 *  @param ges 手势
 */
- (void)sellAllTap:(UIGestureRecognizer *)ges
{
    if ([self.delegate respondsToSelector:@selector(recommendSeeAll:WithTitle:)]) {
        [self.delegate recommendSeeAll:self WithTitle:_headerView.titleStr];
    }
}



//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 0.1;
//}


@end
