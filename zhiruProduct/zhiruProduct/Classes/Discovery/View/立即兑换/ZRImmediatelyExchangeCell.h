//
//  ZRImmediatelyExchangeCell.h
//  zhiruProduct
//
//  Created by nanding on 16/7/6.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZRImmediatelyExchangeCell : UITableViewCell


@property (nonatomic, strong) NSArray *addressArr;


+ (ZRImmediatelyExchangeCell *)cellWithTable:(UITableView *)table IndexPath:(NSIndexPath *)indexPath;

@end
