//
//  ZRSupermarketController.m
//  zhiruProduct
//
//  Created by nanding on 16/7/7.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import "ZRSupermarketController.h"
#import "ZRSupermarketCell.h"
#import "ZRSupermarketHomeController.h"

@interface ZRSupermarketController ()

@end

static NSString *itemID =@"itemID";
static NSString *headerID = @"headerID";
static NSString *footerID = @"footerID";
@implementation ZRSupermarketController
#pragma mark - lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   
    
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
    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerID forIndexPath:indexPath];
        
        if (indexPath.section == 3) {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, SCREEN_WIDTH-15, view.height-10)];
            label.text = @"最新折扣";
            label.font = [UIFont systemFontOfSize:14];
            [view addSubview:label];
        }
        
        return view;
        
    }else{
        UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerID forIndexPath:indexPath];
        footer.backgroundColor = [UIColor whiteColor];
        if (indexPath.section == 3) {
            UIButton *checkAllBtn = (UIButton *)[self setUpBtnWithCheckAll:CGPointMake(SCREEN_WIDTH/2,  footer.height/2)];
            checkAllBtn.tag = kSuperMarket_LatestDiscount_CheckAll;
            [footer addSubview:checkAllBtn];
      
        }
        
        
        return footer;
        
    }
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZRSupermarketCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:itemID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    for (UIView *view in cell.subviews) {
        [view removeFromSuperview];
    }
    cell.listArr = nil;
    [cell setNeedsDisplay];
    
    if (indexPath.section == 0) {
        //轮播图
        NSArray * imgUrl = @[@"http://img11.360buyimg.com/cms/jfs/t196/241/2413424678/109726/34738058/53cf6e32Na0cbe3e5.jpg",@"http://img11.360buyimg.com/cms/g16/M00/0C/0A/rBEbRlOK07EIAAAAAAPXHfjijrkAACZxAMOZPwAA9c1025.jpg"];
        [self setUpAdView:imgUrl SuperView:cell];
        
        
    }else if (indexPath.section == 1){
        NSString *str = @"由North York大统华超市采购";
        CGSize sizeStr = [NSString getSize:str strFont:[UIFont systemFontOfSize:12] maxSize:cell.size];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-sizeStr.width)/2, 0, sizeStr.width, cell.height)];
        label.text = str;
        label.font = [UIFont systemFontOfSize:12];
        [cell addSubview:label];
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(label.x-20, (label.height-sizeStr.height)/2, 10, sizeStr.height)];
        imgView.image = ZRImage(@"dingwei");
        [cell addSubview:imgView];
        
    }else if (indexPath.section == 2){
        //查看全部
        CGFloat width = 60*SCREEN_WIDTH/375;
        CGFloat height = 80*SCREEN_HEIGHT/667;
        CGFloat space = (SCREEN_WIDTH-width*4)/5;
        CGFloat y = 15;
        for (int i=0; i<4; i++) {
            UIButton *categoryBtn = [MyControl createButtonWithFrame:CGRectMake((i+1)*space+i*width, y, width, height) ImageName:@"dilan" Target:self Action:@selector(categoryBtnClick:) Title:nil];
            categoryBtn.tag = kSuperMarket_Category1+i;
            [cell addSubview:categoryBtn];
        }
        
        UIButton *checkAllBtn = (UIButton *)[self setUpBtnWithCheckAll:CGPointMake(SCREEN_WIDTH/2,  cell.height-25)];
        checkAllBtn.tag = kSuperMarket_CheckAll;
        [cell addSubview:checkAllBtn];
        
    }else{
        
        NSArray *arr = @[ZRImage(@"hanbao"),@"卫龙小面筋100g",@"$ 4.5",@"原价$5",ZRImage(@"chaos")];
        cell.cellIndex = indexPath.item;
        cell.listArr = arr;
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
       return CGSizeMake(SCREEN_WIDTH, 40);
    }else if(section == 0){
       return CGSizeMake(SCREEN_WIDTH, 0);
    }else if(section == 1){
       return CGSizeMake(SCREEN_WIDTH, 10);
    }else
       return CGSizeMake(SCREEN_WIDTH, 10);
    
}

/**
 *  每个section的footer的height
 *
 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    if (section == 3) {
        return CGSizeMake(SCREEN_WIDTH, 55);
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
    }else if (indexPath.section == 0){
        return CGSizeMake(SCREEN_WIDTH, 100);
    }else
        return CGSizeMake(SCREEN_WIDTH/2, 150);
}

/**
 *  最小行距
 *
 */
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
    
}

/**
 *  最小列间距
 *
 */
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}




#pragma mark - Click methods
/**
 *  粮油副食、休闲零食、火锅精选、牛奶果汁
 *
 *  @param sender 点击事件
 */
- (void)categoryBtnClick:(UIButton *)sender
{
    ZRSupermarketHomeController *supermarketHomeVC = [[ZRSupermarketHomeController alloc] init];
    switch (sender.tag) {
        case kSuperMarket_Category1:
        {
            supermarketHomeVC.style = Liangyoufushi;
        }
            break;
        case kSuperMarket_Category2:
        {
            supermarketHomeVC.style = Xiuxianlingshi;
        }
            break;
        case kSuperMarket_Category3:
        {
            supermarketHomeVC.style = Huoguojingxuan;
        }
            break;
        case kSuperMarket_Category4:
        {
            supermarketHomeVC.style = Niunaiguozhi;
        }
            break;
            
        default:
            break;
    }
    
    
    [self.navigationController pushViewController:supermarketHomeVC animated:YES];
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
