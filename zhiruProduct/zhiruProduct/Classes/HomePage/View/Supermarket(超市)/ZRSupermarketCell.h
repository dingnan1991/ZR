//
//  ZRSupermarketCell.h
//  zhiruProduct
//
//  Created by nanding on 16/7/7.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZRSupermarketCell : UICollectionViewCell


@property (nonatomic, strong) NSArray *listArr;

//索引
@property (nonatomic, assign) NSInteger cellIndex;


@property (nonatomic, strong) NSArray *travelArr;

@property (nonatomic, strong) NSArray *categoryTravelArr;

@end
