//
//  ZRDiscoveryTableCell.h
//  zhiruProduct
//
//  Created by nanding on 16/7/4.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZRDiscoveryTableCell : UITableViewCell

@property (nonatomic, strong) NSDictionary *categoryDic;

@property (nonatomic, strong) NSDictionary *dic;

+(ZRDiscoveryTableCell *)cellWithTableView:(UITableView *)tableView;


@end
