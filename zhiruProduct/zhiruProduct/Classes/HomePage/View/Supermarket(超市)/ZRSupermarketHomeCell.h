//
//  ZRSupermarketHomeCell.h
//  zhiruProduct
//
//  Created by nanding on 16/7/9.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZRSupermarketHomeCell;
@protocol ZRSupermarketCellDelegate <NSObject>

- (void)addToShoppingCar:(ZRSupermarketHomeCell *)cell WithData:(NSArray *)dataArr WithIndexPath:(NSIndexPath *)indexPath;

@end

@interface ZRSupermarketHomeCell : UITableViewCell

+(ZRSupermarketHomeCell *)cellWithTable:(UITableView *)table;

@property (nonatomic, strong) NSArray *listArray;

@property (nonatomic, strong) UIButton *addBtn;

@property (nonatomic, weak) id<ZRSupermarketCellDelegate> delegate;

@property (nonatomic, strong) NSIndexPath *indexPath;

@property (nonatomic, assign) NSString *countStr;

@end
