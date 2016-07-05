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
    
    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.borderWidth = 1;

    
    
    
}

#pragma mark - init methods
+(ZRDiscoveryTableCell *)cellWithTableView:(UITableView *)tableView;
{
    static NSString *cellID = @"cellID";
    ZRDiscoveryTableCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[ZRDiscoveryTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }else{
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
    switch (sender.tag) {
        case CategoryButtonTag:
        {
            
        }
            break;
        case CategoryButtonTag+1:
        {
            
        }
            break;
        case CategoryButtonTag+2:
        {
            
        }
            break;
        case CategoryButtonTag+3:
        {
            
        }
            break;
        case CategoryButtonTag+4:
        {
            
        }
            break;
        case CategoryButtonTag+5:
        {
            
        }
            break;
            
        default:
            break;
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
