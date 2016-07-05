//
//  ZRDiscoveryCell.h
//  zhiruProduct
//
//  Created by nanding on 16/7/4.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, UICollectionCellIndex) {
    index0,
    index1,
    index2
};


@interface ZRDiscoveryCell : UICollectionViewCell


@property (nonatomic, assign) UICollectionCellIndex cellIndex;

@property (nonatomic, strong) NSArray *dataArray;

@property (nonatomic, strong) NSArray *collectionArray;

@end
