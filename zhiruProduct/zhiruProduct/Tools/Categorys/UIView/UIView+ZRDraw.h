//
//  UIView+ZRDraw.h
//  zhiruProduct
//
//  Created by nanding on 16/7/6.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZRDraw)
/**
 *  绘制文字
 *
 *  @param str   字符串
 *  @param font  字号
 *  @param color 颜色
 *  @param point 坐标点
 */
- (CGSize)drawWithStr:(NSString *)str Font:(UIFont *)font Color:(UIColor *)color Point:(CGPoint)point;


/**
 *  绘制图片
 *
 *  @param image image
 *  @param rect  rect
 */
- (void)drawImage:(UIImage *)image Rect:(CGRect)rect;




@end
