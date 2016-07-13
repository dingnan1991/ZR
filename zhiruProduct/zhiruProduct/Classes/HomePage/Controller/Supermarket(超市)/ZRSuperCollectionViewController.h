//
//  ZRSuperCollectionViewController.h
//  zhiruProduct
//
//  Created by nanding on 16/7/8.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import "ZRBaseViewController.h"
@class ZRSupermarketCell;
@interface ZRSuperCollectionViewController : ZRBaseViewController

/**
 *  轮播图点击回调
 */
@property (nonatomic , copy) void (^clickImg)(NSInteger index,NSString * imageURL,UIImageView * imgView);

/**
 *  创建footer里的按钮
 *
 *  @param center
 *  @param view   
 */
- (UIView *)setUpBtnWithCheckAll:(CGPoint)center;


/**
 *  创建轮播图
 */
- (void)setUpAdView:(NSArray *)urlArr SuperView:(ZRSupermarketCell *)cell;



@end
