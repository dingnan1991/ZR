//
//  ZRSupermarketHomeCell.m
//  zhiruProduct
//
//  Created by nanding on 16/7/9.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import "ZRSupermarketHomeCell.h"
#import "ZRSupermarketHomeObj.h"


#define CellWidth     (SCREEN_WIDTH-(90*ScreenWidth/375))

@interface ZRSupermarketHomeCell ()

@property (nonatomic, strong) UIButton *minusBtn;


@end

@implementation ZRSupermarketHomeCell

-(void)setListArray:(NSArray *)listArray
{
    _listArray = listArray;
    
}


-(void)setIndexPath:(NSIndexPath *)indexPath
{
    _indexPath = indexPath;
    
    self.countStr = nil;
   [[ZRSupermarketHomeObj shareInstance].shoppingCarDic.allKeys enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       if ([obj isEqual:indexPath]) {
           //显示减号
           self.minusBtn.frame = CGRectMake(CellWidth-79, 70-15-22, 22, 22);
           [self addSubview:self.minusBtn];
           
           self.countStr = [NSString stringWithFormat:@"%lu",[[[ZRSupermarketHomeObj shareInstance].shoppingCarDic objectForKey:obj] count]];
           [self setNeedsDisplay];
           
           *stop = YES;
       }else{
           [self setNeedsDisplay];
       }

   }];
    
}



+(ZRSupermarketHomeCell *)cellWithTable:(UITableView *)table
{
    static NSString *cellID = @"cellIdentifier";
    ZRSupermarketHomeCell *cell = [table dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[ZRSupermarketHomeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    
    return cell;
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
        
    }
    return self;
}


#pragma mark - 懒加载
-(UIButton *)addBtn
{
    if (!_addBtn) {
       _addBtn = [MyControl createButtonWithFrame:CGRectMake(0, 0, 0, 0) ImageName:@"supermarket_plus" Target:self Action:@selector(addBtnClick:) Title:nil];
    }
    return _addBtn;
}


-(UIButton *)minusBtn
{
    if (!_minusBtn) {
        _minusBtn = [MyControl createButtonWithFrame:self.addBtn.frame ImageName:@"supermarket_minus" Target:self Action:@selector(minusBtnClick:) Title:nil];
    }
    return _minusBtn;
}



#pragma mark - click methods
/**
 *  添加到购物车
 *
 *  @param sender 
 */
- (void)addBtnClick:(UIButton *)sender
{
    
    
    //判断该商品是否添加过到购物车，如果从未添加过则添加减号并加动画
    ZRSupermarketHomeObj *object = [ZRSupermarketHomeObj shareInstance];
    
    if (object.shoppingCarDic.allKeys.count>0) {
        __block BOOL added;
        //__weak ZRSupermarketHomeCell *muSelf = self;
        [object.shoppingCarDic.allKeys enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            if ([obj isEqual:self.indexPath]) {
                //添加过，则更改中间数据
                
                added = YES;
                *stop = YES;
            }else{
                added = NO;
            }
            
        }];
        
        if (added == YES) {
            self.countStr = [NSString stringWithFormat:@"%lu",[[object.shoppingCarDic objectForKey:self.indexPath] count]+1];
            [self setNeedsDisplay];

        }else{
            [self addAnimation];
            
            self.countStr = @"1";
            [self setNeedsDisplay];
        }
        
    }else{
        
        [self addAnimation];
        self.countStr = @"1";
        [self setNeedsDisplay];
    }
    
    
    if ([self.delegate respondsToSelector:@selector(addToShoppingCar:WithData:WithIndexPath:)]) {
        [self.delegate addToShoppingCar:self WithData:_listArray WithIndexPath:self.indexPath];
    }
    
    
    
    
}


- (void)minusBtnClick:(UIButton *)sender
{
    NSInteger count = [[[ZRSupermarketHomeObj shareInstance].shoppingCarDic objectForKey:self.indexPath] count];
    if (count>1) {
        //直接减1
        self.countStr = [NSString stringWithFormat:@"%ld",count-1];
        [self setNeedsDisplay];
        
        //更新数据
        NSMutableArray *arr = [[ZRSupermarketHomeObj shareInstance].shoppingCarDic  objectForKey:self.indexPath];
        [arr removeLastObject];
        [[ZRSupermarketHomeObj shareInstance].shoppingCarDic setObject:arr forKey:self.indexPath];
        
    }else{
        //收起减号动画
        [self deleteAnimation];
        
        
        //更新数据
        [[ZRSupermarketHomeObj shareInstance].shoppingCarDic removeObjectForKey:self.indexPath];
        
    }
    
}



-(void)drawRect:(CGRect)rect
{
    if (_listArray) {
        CGFloat x = 15;
        CGFloat y = 10;
        CGFloat width = 50*SCREEN_WIDTH/375;
        [self drawImage:_listArray[0] Rect:CGRectMake(x, y, width, width)];
        
        [self drawWithStr:_listArray[1] Font:[UIFont systemFontOfSize:14] Color:[UIColor blackColor] Point:CGPointMake(15+width+15, 12)];
        
        [self drawWithStr:_listArray[2] Font:[UIFont systemFontOfSize:12] Color:[UIColor redColor] Point:CGPointMake(15+width+15, width/2+15)];
        
        
        if (self.countStr) {
            
            CGSize size = [NSString getSize:self.countStr strFont:[UIFont systemFontOfSize:16] maxSize:self.frame.size]
            ;
            [self drawWithStr:self.countStr Font:[UIFont systemFontOfSize:16] Color:RGBCOLOR(85, 85, 85) Point:CGPointMake(CGRectGetMaxX(self.minusBtn.frame)+(20-size.width)/2, CGRectGetMinY(self.addBtn.frame))];
        }
        
    }
}




-(void)layoutSubviews
{
    self.addBtn.frame = CGRectMake(CellWidth-15-22, 70-15-22, 22, 22);
    
    
    
    
}



#pragma mark - Private methods
- (void)addAnimation
{
    [self addSubview:self.minusBtn];
    //未添加过
    [UIView animateWithDuration:1 animations:^{
        self.minusBtn.frame = CGRectMake(CellWidth-79, 70-15-22, 22, 22);
        [self addSubview:self.minusBtn];
        
    } completion:^(BOOL finished) {
        
    }];
}



- (void)deleteAnimation
{
    [UIView animateWithDuration:1 animations:^{
        self.minusBtn.frame = CGRectMake(CellWidth-15-22, 70-15-22, 22, 22);
        self.countStr = nil;
        [self setNeedsDisplay];
        
        
    } completion:^(BOOL finished) {
        [self.minusBtn removeFromSuperview];
        self.minusBtn = nil;
        
    }];
}

@end
