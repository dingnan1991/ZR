//
//  ZRImmediatelyExchangeCell.m
//  zhiruProduct
//
//  Created by nanding on 16/7/6.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import "ZRImmediatelyExchangeCell.h"

@implementation ZRImmediatelyExchangeCell


-(void)setAddressArr:(NSArray *)addressArr
{
    _addressArr = addressArr;
    self.imageView.image = _addressArr[0];
    
    
}

+ (ZRImmediatelyExchangeCell *)cellWithTable:(UITableView *)table IndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    ZRImmediatelyExchangeCell *cell = [table dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[ZRImmediatelyExchangeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    return cell;
}



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}


-(void)drawRect:(CGRect)rect
{
    
    if (_addressArr) {
        //定位图标
        
        //content
        [self drawWithStr:_addressArr[1] Font:[UIFont systemFontOfSize:16] Color:[UIColor blackColor] Point:CGPointMake(50, 20)];
        
        [self drawWithStr:_addressArr[2] Font:[UIFont systemFontOfSize:16] Color:[UIColor grayColor] Point:CGPointMake(90, 20)];
        
        [self drawWithStr:_addressArr[3] Font:[UIFont systemFontOfSize:16] Color:[UIColor grayColor] Point:CGPointMake(130, 20)];
        
        [self drawWithStr:_addressArr[4] Font:[UIFont systemFontOfSize:12] Color:[UIColor grayColor] Point:CGPointMake(50, 50)];
        
    }
    
    //line
    //[self drawLineStartPoint:CGPointMake(0, self.height) endPoint:CGPointMake(SCREEN_WIDTH, self.height) Color:RGBCOLOR(0, 0, 0)];
    
    [self drawLineStartPoint:CGPointMake(0, self.height) endPoint:CGPointMake(SCREEN_WIDTH, self.height) Color:[UIColor blackColor]];
    
    
    
    
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
