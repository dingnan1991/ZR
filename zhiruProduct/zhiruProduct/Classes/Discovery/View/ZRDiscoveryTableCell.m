//
//  ZRDiscoveryTableCell.m
//  zhiruProduct
//
//  Created by nanding on 16/7/4.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import "ZRDiscoveryTableCell.h"

#define CategoryButtonTag            100

@implementation ZRDiscoveryTableCell

-(void)setCategoryDic:(NSDictionary *)categoryDic
{
    _categoryDic = categoryDic;
    CGFloat x = 15*SCREEN_WIDTH/375;
    CGFloat y = 16;
    CGFloat width = 40;
    CGFloat height = 68;
    CGFloat spacing = (SCREEN_WIDTH-2*x-6*width)/5;
    
    
    for (int i=0; i<_categoryDic.count; i++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(x+i*(width+spacing), y, width, height)];
        [button setImage:ZRImage(_categoryDic.allValues[i]) forState:UIControlStateNormal];
        button.tag = CategoryButtonTag+i;
        
        [button addTarget:self action:@selector(recommendBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:button];
    }
    
    
}


-(void)setDic:(NSDictionary *)dic
{
    _dic = dic;
    
}


-(void)setLatestProductArr:(NSArray *)latestProductArr
{
    _latestProductArr = latestProductArr;
    
    
    
    
}

#pragma mark - init methods
+(ZRDiscoveryTableCell *)cellWithTableView:(UITableView *)tableView withIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *cellID = @"cellID";
    ZRDiscoveryTableCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[ZRDiscoveryTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    else{
        for (UIView *view in cell.subviews) {
            [view removeFromSuperview];
        }
       
    }
    return cell;
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}


#pragma mark - click methods
/**
 *  推荐：分类点击事件
 *
 *  @param sender 美食、丽人、娱乐、旅行、购物、生活
 */
- (void)recommendBtnClick:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(categoriesClick:withCell:)]) {
        [self.delegate categoriesClick:sender.tag withCell:self];
    }
    
    
       
}



#pragma mark - drawRect
-(void)drawRect:(CGRect)rect
{
    if (_dic) {
        //绘制图片
        //self.imgView.image = ZRImage(@"hanbao");
        ZRImage(@"hanbao");
        UIImage* myImageObj = ZRImage(@"hanbao");
        CGFloat x = 15*SCREEN_WIDTH/375;
        CGFloat y = 7.5*SCREEN_HEIGHT/667;
        CGFloat width = 180*SCREEN_WIDTH/375;
        CGFloat height = 110*SCREEN_HEIGHT/667;
        [self drawImage:myImageObj Rect:CGRectMake(x, y, width, height)];
        //名字
        UIFont *font1 = [UIFont systemFontOfSize:14];
        NSString *str1 = @"双人烤肉套餐(烤肉饭)";
        NSString *str2 = @"已售2000";
        NSString *str3 = @"$ 200";
        
        CGSize size1 = [self drawWithStr:str1 Font:font1 Color:[UIColor blackColor] Point:CGPointMake(x+width+10, y+20)];
        [self drawWithStr:str2 Font:font1 Color:[UIColor blackColor] Point:CGPointMake(x+width+10, y+35+size1.height)];
        CGSize size3 = [self drawWithStr:str3 Font:[UIFont systemFontOfSize:16] Color:[UIColor redColor] Point:CGPointMake(x+width+10, y+50+size1.height*2)];
      
        
#warning 之后加一张图片
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextMoveToPoint(context, x+width+30+size3.width, y+45+size1.height*2);
        CGContextAddLineToPoint(context, x+width+30+size3.width+20, y+45+size1.height*2);
        CGContextAddLineToPoint(context, x+width+30+size3.width+20, y+45+size1.height*2+20);
        CGContextAddLineToPoint(context, x+width+30+size3.width, y+45+size1.height*2+20);
        CGContextAddLineToPoint(context, x+width+30+size3.width, y+45+size1.height*2);
        CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
        CGContextFillPath(context);
    }else if(_latestProductArr){
        //绘制图片
        [self drawImage:_latestProductArr[0] Rect:CGRectMake(0, 0, SCREEN_WIDTH, self.height)];
        
        [self drawRectangleWithPoint1:CGPointMake(0, 0) Point2:CGPointMake(SCREEN_WIDTH, 0) Point3:CGPointMake(SCREEN_WIDTH, self.height) Point4:CGPointMake(0, self.height) Color:0 G:0 B:0 Alpha:0.5];
        
        [self drawWithStr:_latestProductArr[1] Font:[UIFont systemFontOfSize:16] Color:[UIColor whiteColor] Point:CGPointMake(120, 40)];
        [self drawWithStr:_latestProductArr[2] Font:[UIFont systemFontOfSize:16] Color:[UIColor whiteColor] Point:CGPointMake(140, 80)];
        
        [self drawWithStr:_latestProductArr[3] Font:[UIFont systemFontOfSize:16] Color:[UIColor whiteColor] Point:CGPointMake(140, 120)];
        
        
        
    }
   
}







- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
