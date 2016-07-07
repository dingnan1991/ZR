//
//  ZRDiscoveryCell.h
//  zhiruProduct
//
//  Created by nanding on 16/7/4.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZRDiscoveryCell;
typedef NS_ENUM(NSInteger, UICollectionCellIndex) {
    index0,
    index1,
    index2
};


@protocol ZRDiscoveryCellDelegate <NSObject>

- (void)recommendSeeAll:(ZRDiscoveryCell *)cell WithTitle:(NSString *)titleStr;

- (void)integralMallClickToProductDetail:(ZRDiscoveryCell *)cell WithIndex:(NSInteger)index;

@end

@interface ZRDiscoveryCell : UICollectionViewCell


@property (nonatomic, assign) UICollectionCellIndex cellIndex;

@property (nonatomic, strong) NSArray *dataArray;

@property (nonatomic, strong) NSArray *collectionArray;

@property (nonatomic, weak) id<ZRDiscoveryCellDelegate> delegate;

//悬浮向上的按钮
@property (nonatomic, strong) UIButton *upButton;


@end
