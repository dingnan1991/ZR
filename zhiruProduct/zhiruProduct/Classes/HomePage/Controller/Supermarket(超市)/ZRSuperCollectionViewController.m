//
//  ZRSuperCollectionViewController.m
//  zhiruProduct
//
//  Created by nanding on 16/7/8.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import "ZRSuperCollectionViewController.h"
#import "ZRSupermarketCell.h"
#import "AdView.h"
#import "ZRSupermarketHomeController.h"

@interface ZRSuperCollectionViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) AdView *adView;



@end


static NSString *itemID =@"itemID";
static NSString *headerID = @"headerID";
static NSString *footerID = @"footerID";
@implementation ZRSuperCollectionViewController

#pragma mark - lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.collectionView];
    
}


#pragma mark - 懒加载
-(UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout  = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, ScreenHeight-64) collectionViewLayout:layout];
        _collectionView.collectionViewLayout = layout;
        
        _collectionView.alwaysBounceVertical =YES;
        _collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _collectionView.dataSource =self;
        _collectionView.delegate =self;
        
        [_collectionView registerClass:[ZRSupermarketCell class] forCellWithReuseIdentifier:itemID];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerID];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerID];
        
        
    }
    return _collectionView;
}



#pragma mark - UICollectionViewDataSource


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 0;
}



-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZRSupermarketCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:itemID forIndexPath:indexPath];
    
    return cell;
}


#pragma mark - 创建查看全部按钮
- (UIView *)setUpBtnWithCheckAll:(CGPoint)center
{
    UIButton *allBtn = [MyControl createButtonWithFrame:CGRectMake(0, 0, SCREEN_WIDTH/4, 25) ImageName:nil Target:self Action:@selector(checkAll:) Title:@"查看全部"];
    allBtn.center = center;
    allBtn.layer.borderColor = [UIColor grayColor].CGColor;
    allBtn.layer.borderWidth = 1;
    allBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    return allBtn;
}


#pragma mark - 创建轮播图
/**
 *  创建轮播图
 */
- (void)setUpAdView:(NSArray *)urlArr SuperView:(ZRSupermarketCell *)cell
{
    self.adView = [AdView adScrollViewWithFrame:CGRectMake(0, 0, ScreenWidth, cell.height) imageLinkURL:urlArr placeHoderImageName:@" " pageControlShowStyle:UIPageControlShowStyleCenter];
    
    
    //图片被点击后回调的方法
    WS(ws)
    self.adView.callBack = ^(NSInteger index,NSString * imageURL,UIImageView * imgView)
    {
        if (ws.clickImg) {
            ws.clickImg(index,imageURL,imgView);
        }
        
    };
    
    [cell addSubview:self.adView];
    
}



#pragma mark - click methods
- (void)checkAll:(UIButton *)sender
{
    
    switch (sender.tag) {
        case kSuperMarket_CheckAll:
        {
            ZRSupermarketHomeController *supermarketHomeVC = [[ZRSupermarketHomeController alloc] init];
            [self.navigationController pushViewController:supermarketHomeVC animated:YES];
        }
            break;
            
        default:
            break;
    }
    
    
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
