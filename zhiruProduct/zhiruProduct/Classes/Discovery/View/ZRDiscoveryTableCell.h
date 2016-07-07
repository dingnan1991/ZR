//
//  ZRDiscoveryTableCell.h
//  zhiruProduct
//
//  Created by nanding on 16/7/4.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZRDiscoveryTableCell;
@protocol ZRDiscoveryTableCellDelegate <NSObject>

- (void)categoriesClick:(NSInteger)btnTag withCell:(ZRDiscoveryTableCell *)tableCell;

@end

@interface ZRDiscoveryTableCell : UITableViewCell

@property (nonatomic, strong) NSDictionary *categoryDic;

@property (nonatomic, strong) NSDictionary *dic;

@property (nonatomic, strong) NSArray *latestProductArr;


@property (nonatomic, strong) UIImageView *imgView;




@property (nonatomic, weak) id<ZRDiscoveryTableCellDelegate> delegate;

+(ZRDiscoveryTableCell *)cellWithTableView:(UITableView *)tableView withIndexPath:(NSIndexPath *)indexPath;


@end
