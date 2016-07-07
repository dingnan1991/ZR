//
//  ZRIntegralMallCell.m
//  zhiruProduct
//
//  Created by nanding on 16/7/6.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import "ZRIntegralMallCell.h"

@interface ZRIntegralMallCell ()
{
    BOOL b;
}

@end

@implementation ZRIntegralMallCell


-(void)setIntegralArr:(NSArray *)integralArr
{
   
    _integralArr = integralArr;
    if ([_integralArr[0] isEqualToString:@"titleImage"]) {
        b = YES;
        [self setNeedsDisplay];
        
    }else{
        b = NO;
        [self setNeedsDisplay];
    }
    
}

-(void)drawRect:(CGRect)rect
{

    if (b == NO) {
        //添加图片
        UIImage *image = ZRImage(_integralArr[0]);
        [self drawImage:image Rect:CGRectMake(0, 0, self.width, self.width)];
        
        CGSize size1 = [self drawWithStr:_integralArr[1] Font:[UIFont systemFontOfSize:12] Color:[UIColor blackColor] Point:CGPointMake(5, self.width+5)];
        
        CGSize size2 = [self drawWithStr:_integralArr[2] Font:[UIFont systemFontOfSize:12] Color:[UIColor blackColor] Point:CGPointMake(5, self.width+size1.height+3)];
        
        //添加金币
#warning 添加金币图片
        
        [self drawWithStr:_integralArr[3] Font:[UIFont systemFontOfSize:13] Color:[UIColor blackColor] Point:CGPointMake(20, self.width+size1.height+size2.height+10+3)];
        
        

        
    }
    
    
}

@end
