//
//  ZRSupermarketHomeController.h
//  zhiruProduct
//
//  Created by nanding on 16/7/9.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import "ZRBaseViewController.h"


typedef NS_ENUM(NSInteger, CategoryStyle){
    CheckAllCategory,
    LatestDiscountCheckAllCategory,
    Liangyoufushi,
    Xiuxianlingshi,
    Huoguojingxuan,
    Niunaiguozhi
    
};

@interface ZRSupermarketHomeController : ZRBaseViewController


@property (nonatomic, assign) CategoryStyle style;

@end
