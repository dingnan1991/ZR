//
//  orderingDetailsHeadView.m
//  zhiruProduct
//
//  Created by 魏嘉楠 on 16/7/8.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import "orderingDetailsHeadView.h"

@interface orderingDetailsHeadView ()

@property (weak, nonatomic) IBOutlet UIImageView *businessImg;  //商家图

@property (weak, nonatomic) IBOutlet UILabel *businessName; //商家名

@property (weak, nonatomic) IBOutlet UILabel *operatingStatus; //营业状态

@property (weak, nonatomic) IBOutlet UILabel *sale; //销量

@property (weak, nonatomic) IBOutlet UILabel *distributionStatus; //配送方式

@property (weak, nonatomic) IBOutlet UILabel *startPrice; //起送价格

@property (weak, nonatomic) IBOutlet UILabel *distributionPrice; //配送费用



@end

@implementation orderingDetailsHeadView

-(void)awakeFromNib{
    [super awakeFromNib];
    
    
    self.businessImg.layer.cornerRadius = 5;
    self.businessImg.layer.masksToBounds = YES;
}




@end
