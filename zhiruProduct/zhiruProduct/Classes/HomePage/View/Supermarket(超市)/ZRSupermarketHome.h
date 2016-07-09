//
//  ZRSupermarketHome.h
//  zhiruProduct
//
//  Created by nanding on 16/7/9.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ZRSupermarketHomeDataSource <NSObject>
/**
 *  返回section个数
 */
-(NSInteger)ZRnumberOfSectionsInTable:(UITableView *)table;


/**
 *  返回每个section的行数
 */
-(NSInteger)ZRnumberOfRowsInSection:(NSInteger)section Table:(UITableView *)table;



@end

@interface ZRSupermarketHome : UIView

@property (nonatomic, weak) id<ZRSupermarketHomeDataSource> dataSource;

@end
