//
//  UIView+ZRDraw.m
//  zhiruProduct
//
//  Created by nanding on 16/7/6.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import "UIView+ZRDraw.h"

@implementation UIView (ZRDraw)
/**
 *  绘制文字
 *
 *  @param str   字符串
 *  @param font  字号
 *  @param color 颜色
 *  @param point 坐标点
 */
- (CGSize)drawWithStr:(NSString *)str Font:(UIFont *)font Color:(UIColor *)color Point:(CGPoint)point
{
    NSMutableParagraphStyle* paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paragraphStyle.alignment=NSTextAlignmentCenter;//文字居中：发现只能水平居中，而无法垂直居中
    NSDictionary* attribute1 = @{
                                 NSForegroundColorAttributeName:color,//设置文字颜色
                                 NSFontAttributeName:font,//设置文字的字体
                                 NSParagraphStyleAttributeName:paragraphStyle,//设置文字的样式
                                 };
    CGSize size1 = [str boundingRectWithSize:self.bounds.size
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:@{
                                               NSFontAttributeName:font,//设置文字的字体
                                               NSKernAttributeName:@0,//文字之间的字距
                                               }
                                     context:nil].size;
    CGRect rect1 = CGRectMake(point.x, point.y, size1.width, size1.height);
    [str drawInRect:rect1 withAttributes:attribute1];
    
    return size1;
    
}


/**
 *  绘制图片
 *
 *  @param image image
 *  @param rect  rect
 */
- (void)drawImage:(UIImage *)image Rect:(CGRect)rect
{
    [image drawInRect:rect];
}



@end
