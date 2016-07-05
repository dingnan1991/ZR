//
//  ZRHomeHeadView.h
//  zhiruProduct
//
//  Created by 魏嘉楠 on 16/6/29.
//  Copyright © 2016年 Zhiru. All rights reserved.
//  首页 头部视图

#import <UIKit/UIKit.h>

@interface ZRHomeHeadView : UIView

/**
 *  轮播图点击回调
 */
@property (nonatomic , copy) void (^clickImg)(NSInteger index,NSString * imageURL,UIImageView * imgView);

@property (nonatomic , copy) void (^clickBtn)(NSInteger index);
@end
