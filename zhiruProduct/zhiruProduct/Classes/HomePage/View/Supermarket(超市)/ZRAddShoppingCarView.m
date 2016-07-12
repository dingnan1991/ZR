//
//  ZRAddShoppingCarView.m
//  zhiruProduct
//
//  Created by nanding on 16/7/11.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import "ZRAddShoppingCarView.h"
#import "ZRSupermarketHomeObj.h"

@interface ZRAddShoppingCarView ()

@property (nonatomic, assign) NSInteger price;

@end

@implementation ZRAddShoppingCarView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
       
        self.shoppingCatBtn = [[UIButton alloc] init];
        [self.shoppingCatBtn setImage:ZRImage(@"supermarket_shoppingCar") forState:UIControlStateNormal];
        [self addSubview:self.shoppingCatBtn];
        
    }
    return self;
}


-(void)layoutSubviews
{
    [_shoppingCatBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(@10);
        make.bottom.equalTo(@0);
        make.width.equalTo(@28);
        
        
    }];
}


-(void)setDataArray:(NSArray *)dataArray
{
    _dataArray = dataArray;
    [self setNeedsDisplay];
}

-(void)drawRect:(CGRect)rect
{
    if (_dataArray) {
        //购物车
        //[self drawImage:ZRImage(@"supermarket_shoppingCar") Rect:CGRectMake(10, 12, 28, self.height-20)];
        CGSize size = [NSString getSize:_dataArray[2] strFont:[UIFont systemFontOfSize:16] maxSize:self.bounds.size];
        CGFloat x = CGRectGetMaxX(_shoppingCatBtn.frame)+5;
        CGFloat y = (self.height-size.height)/2;
        [self drawWithStr:[NSString stringWithFormat:@"$%ld",[ZRSupermarketHomeObj shareInstance].allPrice] Font:[UIFont systemFontOfSize:16] Color:[UIColor whiteColor] Point:CGPointMake(x, y)];
    }
   
    
    
}


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    NSString *str = (__bridge NSString *)(context);
    _price = [[str substringWithRange:NSMakeRange(1, str.length-1)] integerValue];
    [ZRSupermarketHomeObj shareInstance].allPrice = [ZRSupermarketHomeObj shareInstance].allPrice+_price;
    _price = [ZRSupermarketHomeObj shareInstance].allPrice;
    [self setNeedsDisplay];
    
    
    
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
