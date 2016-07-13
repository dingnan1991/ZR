//
//  ZRSupermarketHome.h
//  zhiruProduct
//
//  Created by nanding on 16/7/9.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, HomeCategoryStyle){
    kCheckAllCategory,
    kLatestDiscountCheckAllCategory,
    kLiangyoufushi,
    kXiuxianlingshi,
    kHuoguojingxuan,
    kNiunaiguozhi
    
};

@protocol ZRSupermarketHomeDataSource <NSObject>
/**
 *  右侧返回section个数
 */
-(NSInteger)ZRRightnumberOfSectionsInTable:(UITableView *)table;

-(NSInteger)ZRRightnumberOfRowsInSection:(NSInteger)section Table:(UITableView *)table;

/**
 *  返回每个section的行数
 */
-(NSInteger)ZRLeftnumberOfRowsInSection:(NSInteger)section Table:(UITableView *)table;



/**
 *  返回左侧table的每个cell
 */
-(NSString *)ZRLeftTableView:(UITableView *)table cellForRowAtIndexPath:(NSIndexPath *)indexPath;

-(NSArray *)ZRRightTableView:(UITableView *)table cellForRowAtIndexPath:(NSIndexPath *)indexPath;





@end



@protocol ZRSupermarketHomeDelegate <NSObject>

/**
 *  返回右侧header的title
 */
-(NSString *)ZRRightTitleForHeaderInSection:(NSInteger)section RightTable:(UITableView *)table;


@end

@interface ZRSupermarketHome : UIView

@property (nonatomic, weak) id<ZRSupermarketHomeDataSource> dataSource;


@property (nonatomic, weak) id<ZRSupermarketHomeDelegate> delegate;


@property (nonatomic, assign) HomeCategoryStyle categoryStyle;












@end
