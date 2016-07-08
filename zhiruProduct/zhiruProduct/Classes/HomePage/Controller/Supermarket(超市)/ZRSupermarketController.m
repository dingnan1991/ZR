//
//  ZRSupermarketController.m
//  zhiruProduct
//
//  Created by nanding on 16/7/7.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import "ZRSupermarketController.h"
#import "ZRSupermarketCell.h"
#import "AdView.h"


#define categotyBtnTag          150

@interface ZRSupermarketController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) AdView *adView;

@end

static NSString *itemID =@"itemID";
static NSString *headerID = @"headerID";
@implementation ZRSupermarketController
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
        
        //layout.itemSize = CGSizeMake(SCREEN_WIDTH, 100);
        //layout.minimumInteritemSpacing = 6;
        layout.minimumLineSpacing = 20;
        layout.sectionInset = UIEdgeInsetsMake(1, 0, 20, 0);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, ScreenHeight-64) collectionViewLayout:layout];
        _collectionView.collectionViewLayout = layout;
        
        _collectionView.alwaysBounceVertical =YES;
        _collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _collectionView.dataSource =self;
        _collectionView.delegate =self;
        
        [_collectionView registerClass:[ZRSupermarketCell class] forCellWithReuseIdentifier:itemID];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerID];
        
        
        
    }
    return _collectionView;
}

#pragma mark - UICollectionViewDataSource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 4;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 3) {
        return 6;
    }else
        return 1;
}


-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionReusableView *view = [self.collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerID forIndexPath:indexPath];
    
    if (indexPath.section == 3) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, SCREEN_WIDTH-15, view.height)];
        label.text = @"最新折扣";
        label.font = [UIFont systemFontOfSize:14];
        [view addSubview:label];
        
        //line
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 1)];
        line.backgroundColor = [UIColor blackColor];
        [view addSubview:line];
        
    }
   
    return view;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZRSupermarketCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:itemID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];

    
    
    if (indexPath.section == 0) {
        //轮播图
         NSArray * imgUrl = @[@"http://img11.360buyimg.com/cms/jfs/t196/241/2413424678/109726/34738058/53cf6e32Na0cbe3e5.jpg",@"http://img11.360buyimg.com/cms/g16/M00/0C/0A/rBEbRlOK07EIAAAAAAPXHfjijrkAACZxAMOZPwAA9c1025.jpg"];
        [self setUpAdView:imgUrl SuperView:cell];
        
        
    }else if (indexPath.section == 1){
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, cell.height)];
        label.text = @"由North York大统华超市采购";
        label.font = [UIFont systemFontOfSize:12];
        label.textAlignment = NSTextAlignmentCenter;
        [cell.contentView addSubview:label];
        
    }else if (indexPath.section == 2){
        //查看全部
        CGFloat width = 60*SCREEN_WIDTH/375;
        CGFloat height = 80*SCREEN_HEIGHT/667;
        CGFloat space = (SCREEN_WIDTH-width*4)/5;
        CGFloat y = 15;
        for (int i=0; i<4; i++) {
            UIButton *categoryBtn = [MyControl createButtonWithFrame:CGRectMake((i+1)*space+i*width, y, width, height) ImageName:@"dilan" Target:self Action:@selector(categoryBtnClick:) Title:nil];
            categoryBtn.tag = categotyBtnTag+i;
            [cell.contentView addSubview:categoryBtn];
        }
        
        UIButton *allBtn = [MyControl createButtonWithFrame:CGRectMake(0, 0, SCREEN_WIDTH/4, 25) ImageName:nil Target:self Action:@selector(checkAll:) Title:@"查看全部"];
        allBtn.center = CGPointMake(SCREEN_WIDTH/2,  cell.height-25);
        allBtn.layer.borderColor = [UIColor grayColor].CGColor;
        allBtn.layer.borderWidth = 1;
        allBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [cell addSubview:allBtn];
        
    }else{
        
    }
    

    return cell;
}




/**
 *  每个section的header的height
 *
 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section == 3) {
       return CGSizeMake(SCREEN_WIDTH, 30);
    }else
       return CGSizeMake(SCREEN_WIDTH, 0);
    
}

/**
 *  cell的size
 *
 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        return CGSizeMake(SCREEN_WIDTH, 30);
    }else if (indexPath.section == 2){
        return CGSizeMake(SCREEN_WIDTH, 140);
    }else
        return CGSizeMake(SCREEN_WIDTH, 100);
}


#pragma mark - Private methods
- (void)setUpAdView:(NSArray *)urlArr SuperView:(UICollectionViewCell *)cell
{
    self.adView = [AdView adScrollViewWithFrame:CGRectMake(0, 0, ScreenWidth, 100) imageLinkURL:urlArr placeHoderImageName:@" " pageControlShowStyle:UIPageControlShowStyleCenter];
    
    
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


#pragma mark - Click methods

- (void)categoryBtnClick:(UIButton *)sender
{
    
}

/**
 *  查看全部
 *
 *  @param sender
 */
- (void)checkAll:(UIButton *)sender
{
    
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
