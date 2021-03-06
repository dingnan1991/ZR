//
//  ZRTabBarButton.h
//  zhiruProduct
//
//  Created by 魏嘉楠 on 16/6/23.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZRTabBarButton : UIButton

// 保存着按钮对应的内容
@property (nonatomic, strong) UITabBarItem *item;
@property (nonatomic, copy) NSString * text;
@end
