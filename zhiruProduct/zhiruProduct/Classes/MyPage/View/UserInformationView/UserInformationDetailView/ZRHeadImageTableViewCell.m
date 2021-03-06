//
//  ZRHeadImageTableViewCell.m
//  zhiruProduct
//
//  Created by pj on 16/7/11.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import "ZRHeadImageTableViewCell.h"

@implementation ZRHeadImageTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self createContentView];
    }
    return self;
}
- (void)createContentView
{
    self.headImage = [[UIImageView alloc] init];
    [self addSubview:_headImage];
    WS(weakSelf);
    [self.headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).with.offset(15);
        make.top.equalTo(weakSelf).with.offset(10);
        make.bottom.equalTo(weakSelf).with.offset(-10);
        make.size.mas_equalTo(CGSizeMake(80.0 / 667.0 * ScreenHeight - 20, 80.0 / 667.0 * ScreenHeight - 20));
    }];
    self.headImage.layer.masksToBounds = YES;
    self.headImage.layer.cornerRadius = (80.0 / 667.0 * ScreenHeight - 20) / 2.0;
    [self.headImage setBackgroundColor:[UIColor blackColor]];
    
    self.rightImage = [[UIImageView alloc] init];
    [self addSubview:_rightImage];
    [self.rightImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf).with.offset(-15);
        make.centerY.mas_equalTo(weakSelf);
        make.size.mas_equalTo(CGSizeMake(7.0, 15.0));
    }];
//    [self.rightImage setBackgroundColor:[UIColor blackColor]];
    [self.rightImage setImage:[UIImage imageNamed:@"jiantou-you"]];
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
