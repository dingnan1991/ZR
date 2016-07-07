//
//  ZRDiscoveryController.m
//  zhiruProduct
//
//  Created by 魏嘉楠 on 16/6/23.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import "ZRDiscoveryController.h"
#import "ZRSegmentView.h"
#import "ZRDiscoveryCell.h"
#import "ZRProductDetalController.h"


@interface ZRDiscoveryController ()<ZRSegmentViewDelegate, ZRDiscoveryCellDelegate>

@property (nonatomic, strong) ZRSegmentView *segmentView;

@end

@implementation ZRDiscoveryController
#pragma mark - lifeCycle

static NSString *ID = @"cell";

-(instancetype)init{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT-64-49);
    layout.minimumLineSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    return [super initWithCollectionViewLayout:layout];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerClass:[ZRDiscoveryCell class] forCellWithReuseIdentifier:ID];
    self.collectionView.pagingEnabled = YES;
    self.collectionView.bounces = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
    //self.collectionView.scrollEnabled = NO;
    //setUp TitleView  For NavigationBar
    [self setUpTitleView];
    
    
    //setUp RightBarButton For NavigationBar
    [self setUpRightBarButton];
    

}

#pragma mark - PrivateMethods
- (void)setUpTitleView
{
    NSArray *arrar = [NSArray arrayWithObjects:@"推荐",@"积分商城",@"新品", nil];
    _segmentView = [[ZRSegmentView alloc] init];
    _segmentView.backgroundColor = [UIColor clearColor];
    _segmentView.tag = 21;
    _segmentView.textNormalColor = RGBCOLOR(85, 85, 85);
    _segmentView.delegate = self;
    //_segmentView.backgroundNormalColor = [UIColor clearColor];
    //_segmentView.backgroundSeletedColor = [UIColor redColor];
    _segmentView.linColor = RGBCOLOR(140, 199, 181);
    _segmentView.textFont = [UIFont systemFontOfSize:16];
    [_segmentView loadTitleArray:arrar];
    self.navigationItem.titleView = _segmentView;
    //默认选中积分商城
     [_segmentView buttonPressed:[_segmentView viewWithTag:11]];
    
}

//购物车
- (void)setUpRightBarButton
{
    UIButton *shoppingCartBtn = [MyControl createButtonWithFrame:CGRectMake(5, 0, 50, 44) ImageName:nil Target:self Action:@selector(JoinShoppingCart:) Title:nil];
    [shoppingCartBtn setImage:ZRImage(@"gouwuche") forState:UIControlStateNormal];
    
    UIBarButtonItem *rightBarBtnItem = [[UIBarButtonItem alloc] initWithCustomView:shoppingCartBtn];
    
    self.navigationItem.rightBarButtonItem = rightBarBtnItem;
    
    
}


#pragma mark - click methods
- (void)JoinShoppingCart:(UIButton *)sender
{
    
}


#pragma mark - ZRSegmentViewDelegate methods
-(void)segmentView:(ZRSegmentView *)segmentView index:(NSInteger)index
{
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
   
}


#pragma mark - UIScrollView Delegate

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int page = scrollView.contentOffset.x/SCREEN_WIDTH;
    UIButton *button = [_segmentView viewWithTag:(10+page)];
    [_segmentView buttonPressed:button];
    
}


#pragma mark - UICollectionView Delegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 3;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ZRDiscoveryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.delegate = self;
    if (indexPath.item == 0) {
        //cell.backgroundColor = [UIColor greenColor];
        cell.cellIndex  = index0;
        NSDictionary *dic1 = @{@"美食":@"dilanhui",
                              @"丽人":@"dilanhui",
                              @"娱乐":@"dilanhui",
                              @"旅行":@"dilanhui",
                              @"购物":@"dilanhui",
                              @"生活":@"dilanhui"};
        NSDictionary *dic2 = @{@"热门美食":@[@"双人烤肉套餐",@"双人烤肉套餐",@"双人烤肉套餐"]};
        NSDictionary *dic3 = @{@"热门丽人":@[@"双人烤肉套餐",@"双人烤肉套餐",@"双人烤肉套餐"]};
        NSDictionary *dic4 = @{@"热门娱乐":@[@"双人烤肉套餐",@"双人烤肉套餐",@"双人烤肉套餐"]};
        NSDictionary *dic5 = @{@"热门旅行":@[@"双人烤肉套餐",@"双人烤肉套餐",@"双人烤肉套餐"]};
        NSDictionary *dic6 = @{@"热门购物":@[@"双人烤肉套餐",@"双人烤肉套餐",@"双人烤肉套餐"]};
        NSDictionary *dic7 = @{@"热门生活":@[@"双人烤肉套餐",@"双人烤肉套餐",@"双人烤肉套餐"]};
        
        cell.dataArray = @[dic1,dic2,dic3,dic4,dic5,dic6,dic7];
        [cell.upButton setHidden:NO];
        
    }else if (indexPath.item == 1){
        
        //cell.backgroundColor = [UIColor redColor];
        cell.cellIndex = index1;
        cell.collectionArray = @[@"1",@"2"];
        
        //cell.upButton = nil;
        if (cell.upButton) {
            [[UIApplication sharedApplication].keyWindow.subviews[[UIApplication sharedApplication].keyWindow.subviews.count-1] setHidden:YES];
        }
        
        
        
    }else{
       
        cell.backgroundColor = [UIColor grayColor];
        cell.cellIndex = index2;
        cell.dataArray = @[@[ZRImage(@"tu-0"),@"双人烤肉套餐",@"$ 200",@"300m"],@[ZRImage(@"tu-0"),@"双人烤肉套餐",@"$ 200",@"300m"],@[ZRImage(@"tu-0"),@"双人烤肉套餐",@"$ 200",@"300m"],@[ZRImage(@"tu-0"),@"双人烤肉套餐",@"$ 200",@"300m"],@[ZRImage(@"tu-0"),@"双人烤肉套餐",@"$ 200",@"300m"],@[ZRImage(@"tu-0"),@"双人烤肉套餐",@"$ 200",@"300m"],@[ZRImage(@"tu-0"),@"双人烤肉套餐",@"$ 200",@"300m"]];
        
        if (cell.upButton) {
            [[UIApplication sharedApplication].keyWindow.subviews[[UIApplication sharedApplication].keyWindow.subviews.count-1] setHidden:YES];
        }
        
        
    }
    
    
    return cell;
}


#pragma mark - ZRDiscoveryCellDelegate methods
/**
 *  推荐----查看全部点击事件
 *
 *  @param cell
 *  @param titleStr 
 */
-(void)recommendSeeAll:(ZRDiscoveryCell *)cell WithTitle:(NSString *)titleStr
{
    if ([titleStr isEqualToString:@"热门美食"]) {
        
    }else if ([titleStr isEqualToString:@"热门丽人"]){
        
    }else if ([titleStr isEqualToString:@"热门娱乐"]){
        
    }else if ([titleStr isEqualToString:@"热门旅行"]){
        
    }else if ([titleStr isEqualToString:@"热门购物"]){
        
    }else if ([titleStr isEqualToString:@"热门生活"]){
        
    }
}

/**
 *  积分商城跳转到商品详情
 *
 *  @param cell
 *  @param index 
 */
- (void)integralMallClickToProductDetail:(ZRDiscoveryCell *)cell WithIndex:(NSInteger)index
{
    ZRProductDetalController *productDetailCtl = [[ZRProductDetalController alloc] init];
    [self.navigationController pushViewController:productDetailCtl animated:YES];
}



#pragma mark - manage memory methods
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
