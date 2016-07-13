//
//  ZRAddressTableViewCell.m
//  zhiruProduct
//
//  Created by pj on 16/7/12.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import "ZRAddressTableViewCell.h"

@implementation ZRAddressTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self createContentView];
        [self setViewMasonary];
    }
    return self;
}
- (void)createContentView
{
    self.modifyImage = [[UIImageView alloc] init];
    [self.contentView addSubview:_modifyImage];
    [self.modifyImage setImage:[UIImage imageNamed:@"chaos"]];
    
    self.contentLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_contentLabel];
    
    self.addressLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_addressLabel];
    
}
- (void)setViewMasonary
{
    WS(weakSelf);
    [self.modifyImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf);
        make.right.equalTo(weakSelf).with.offset(-15);
//        make.height.mas_equalTo(weakSelf.modifyImage.width).multipliedBy(1.0);
        //        make.left.equalTo(weakSelf).with.offset(100);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).with.offset(15);
        make.top.equalTo(weakSelf).with.offset(5);
    }];
    
    [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).with.offset(15);
        make.bottom.equalTo(weakSelf).with.offset(-5);
    }];

}
- (void)setStr1:(NSString *)str1
{
    _str1 = str1;
    [self.contentLabel setText:_str1];
    [self.contentLabel setFont:[UIFont systemFontOfSize:16]];
    WS(weakSelf);
    [self.modifyImage mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf);
        make.right.equalTo(weakSelf).with.offset(-15);
        
    }];
    [self.contentLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).with.offset(15);
        make.top.equalTo(weakSelf).with.offset(7);

        
    }];
    
    [self.addressLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).with.offset(15);
        make.bottom.equalTo(weakSelf).with.offset(-7);
        
    }];
}
- (void)setStr2:(NSString *)str2
{
    _str2 = str2;
    [self.addressLabel setText:_str2];
    [self.addressLabel setFont:[UIFont systemFontOfSize:16]];
    WS(weakSelf);
    [self.modifyImage mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf);
        make.right.equalTo(weakSelf).with.offset(-15);
        
    }];
    [self.contentLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).with.offset(15);
        make.top.equalTo(weakSelf).with.offset(7);
        
        
    }];
    
    [self.addressLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).with.offset(15);
        make.bottom.equalTo(weakSelf).with.offset(-7);
        
    }];

}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
