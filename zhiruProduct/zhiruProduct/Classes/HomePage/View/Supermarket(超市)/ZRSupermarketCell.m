//
//  ZRSupermarketCell.m
//  zhiruProduct
//
//  Created by nanding on 16/7/7.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import "ZRSupermarketCell.h"

@implementation ZRSupermarketCell

-(void)setListArr:(NSArray *)listArr
{
    _listArr = listArr;
    
    
}


-(void)setTravelArr:(NSArray *)travelArr
{
    _travelArr = travelArr;
}

-(void)setCategoryTravelArr:(NSArray *)categoryTravelArr
{
    _categoryTravelArr = categoryTravelArr;
}



-(void)drawRect:(CGRect)rect
{
  
    if (_listArr) {
        //商品图片
        CGRect rect;
        if (_cellIndex%2 == 0) {
            rect = CGRectMake(15, 10, self.width-22.5, self.height*2/3);
        }else{
            rect = CGRectMake(7.5, 10, self.width-22.5, self.height*2/3);
        }
        [self drawImage:_listArr[0] Rect:rect];
        
        //context
        [self drawWithStr:_listArr[1] Font:[UIFont systemFontOfSize:12] Color:[UIColor blackColor] Point:CGPointMake(rect.origin.x, rect.size.height+10+5)];
        [self drawWithStr:_listArr[2] Font:[UIFont systemFontOfSize:12] Color:[UIColor redColor] Point:CGPointMake(rect.origin.x, rect.size.height+15+15)];
        CGSize size = [self drawWithStr:_listArr[3] Font:[UIFont systemFontOfSize:12] Color:[UIColor grayColor] Point:CGPointMake(rect.origin.x+40, rect.size.height+15+15)];
        //line
        [self drawLineStartPoint:CGPointMake(rect.origin.x+38, rect.size.height+30+size.height/2) endPoint:CGPointMake(rect.origin.x+42+size.width, rect.size.height+30+size.height/2) Color:[UIColor grayColor]];
        
        [self drawImage:_listArr[4] Rect:CGRectMake(self.width-40, rect.size.height+15+15, 20, 20)];
        
    }else if (_travelArr){
        [self drawImage:_travelArr[0] Rect:CGRectMake((self.width-60)/2, (self.height-60)/2-10, 60, 60)];
        CGSize size = [NSString getSize:_travelArr[1] strFont:[UIFont systemFontOfSize:16] maxSize:CGSizeMake(SCREEN_WIDTH, 40)];
        UIColor *color;
        if ([_travelArr[2] isEqualToString:@"1"]) {
            color = [UIColor blueColor];
        }else{
            color = [UIColor blackColor];
        }
        [self drawWithStr:_travelArr[1] Font:[UIFont systemFontOfSize:16] Color:color Point:CGPointMake((self.width-size.width)/2, (self.height-60)/2-10+60+5)];
    }else if (_categoryTravelArr){
        //边框
//        [self drawRectangleWithPoint1:CGPointMake(15, 15) Point2:CGPointMake(self.width-22.5+15, 15) Point3:CGPointMake(self.width-22.5+15, self.height) Point4:CGPointMake(15, self.height) Color:173/255 G:173/255 B:173/255 Alpha:1];
        
        CGRect rect;
        if (_cellIndex%2 == 0) {
            rect = CGRectMake(15, 15, self.width-22.5, self.height*3/5);
        }else{
            rect = CGRectMake(7.5, 15, self.width-22.5, self.height*3/5);
        }
        [self drawImage:_categoryTravelArr[0] Rect:rect];
        
        CGSize strSize = [NSString getSize:_categoryTravelArr[1] strFont:[UIFont systemFontOfSize:10] maxSize:CGSizeMake(self.width-22.5, self.height)];
        [self drawWithStr:_categoryTravelArr[1] Font:[UIFont systemFontOfSize:10] Color:[UIColor grayColor] Point:CGPointMake(15, self.height*3/5+5+15) Size:strSize];
        
        [self drawWithStr:_categoryTravelArr[2] Font:[UIFont systemFontOfSize:10] Color:[UIColor redColor] Point:CGPointMake(15, 15+rect.size.height+5+strSize.height+5)];
        
        CGSize strSize2 = [NSString getSize:_categoryTravelArr[3] strFont:[UIFont systemFontOfSize:10] maxSize:CGSizeMake(SCREEN_WIDTH, 40)];
        [self drawWithStr:_categoryTravelArr[3] Font:[UIFont systemFontOfSize:10] Color:[UIColor grayColor] Point:CGPointMake(self.width-22.5+15-10-strSize2.width, 15+rect.size.height+5+strSize.height+5)];
        
    }
    
}



@end
