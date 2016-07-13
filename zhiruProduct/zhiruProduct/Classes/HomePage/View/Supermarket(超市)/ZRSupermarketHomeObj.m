//
//  ZRSupermarketHomeObj.m
//  zhiruProduct
//
//  Created by nanding on 16/7/12.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import "ZRSupermarketHomeObj.h"

@implementation ZRSupermarketHomeObj

+(instancetype)shareInstance
{
    static ZRSupermarketHomeObj *obj = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        obj = [[ZRSupermarketHomeObj alloc] init];
        
    });
    return obj;
}


-(NSMutableDictionary *)shoppingCarDic
{
    if (!_shoppingCarDic) {
        _shoppingCarDic = [NSMutableDictionary dictionary];
    }
    return _shoppingCarDic;
}






@end
