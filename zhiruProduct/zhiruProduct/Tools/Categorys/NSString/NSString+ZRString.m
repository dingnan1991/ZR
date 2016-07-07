//
//  NSString+ZRString.m
//  zhiruProduct
//
//  Created by nanding on 16/7/4.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import "NSString+ZRString.h"

@implementation NSString (ZRString)
/**
 *  获取字符串size
 *
 *  @param string  字符串
 *  @param font    字号
 *  @param maxSize 最大size
 *
 *  @return 该字符串的size
 */
+ (CGSize)getSize:(NSString *)string strFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    CGSize size1 = [string boundingRectWithSize:maxSize
                                        options:NSStringDrawingUsesLineFragmentOrigin
                                     attributes:@{
                                                  NSFontAttributeName:font,//设置文字的字体
                                                  NSKernAttributeName:@0,//文字之间的字距
                                                  }
                                        context:nil].size;
    return size1;
}


@end
