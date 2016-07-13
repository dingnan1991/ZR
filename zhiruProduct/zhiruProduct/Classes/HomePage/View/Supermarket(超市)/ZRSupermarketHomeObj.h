//
//  ZRSupermarketHomeObj.h
//  zhiruProduct
//
//  Created by nanding on 16/7/12.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZRSupermarketHomeObj : NSObject

+(instancetype)shareInstance;


@property (nonatomic, strong) NSMutableDictionary *shoppingCarDic;

//总价
@property (nonatomic, assign) NSInteger allPrice;

@end
