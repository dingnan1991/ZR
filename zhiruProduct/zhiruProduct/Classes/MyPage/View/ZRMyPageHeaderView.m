//
//  ZRMyPageHeaderView.m
//  zhiruProduct
//
//  Created by pj on 16/7/8.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import "ZRMyPageHeaderView.h"
#import "ZRMyPageContentView.h"
@implementation ZRMyPageHeaderView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
        [self createHeaderView];
        [self setHeaderMasonary];
        [self createFooterView];
    }
    return self;
}
- (void)createHeaderView
{
    self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 80.0 / 667.0 * ScreenHeight)];
    [self addSubview:self.headerView];
    
    self.headerImageView = [[UIImageView alloc] init];
    self.userNameLabel = [[UILabel alloc] init];
    self.rightImageView = [[UIImageView alloc] init];
    self.lineView = [[UIView alloc] init];
    self.lineView.backgroundColor = RGBCOLOR(187, 187, 187);
    [self.headerView addSubview:self.headerImageView];
    [self.headerView addSubview:self.userNameLabel];
    [self.headerView addSubview:self.rightImageView];
    [self.headerView addSubview:self.lineView];
    
    [self.userNameLabel setText:@"点击登录"];
    [self.rightImageView setImage:[UIImage imageNamed:@"jiantou-you"]];
    
    self.headerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.headerButton setBackgroundColor:[UIColor clearColor]];
    self.headerButton.frame = CGRectMake(0, 0, self.headerView.frame.size.width, self.headerView.frame.size.height);
    [self.headerView addSubview:self.headerButton];
    
    
    

    
}
- (void)setHeaderMasonary
{
    WS(weakSelf);
    [self.headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.headerView).with.offset(15);
        make.centerY.mas_equalTo(weakSelf.headerView);
        make.size.mas_equalTo(CGSizeMake(60.0 / 667.0 * ScreenHeight, 60.0 / 667.0 * ScreenHeight));
    }];
    self.headerImageView.layer.cornerRadius = 60.0 / 667.0 * ScreenHeight / 2;
    [self.headerImageView setBackgroundColor:[UIColor orangeColor]];
    
    [self.userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.headerView);
        make.left.equalTo(weakSelf.headerImageView.mas_right).with.offset(10);
//        make.size.mas_equalTo(CGSizeMake(100.0 / 375.0 * ScreenWidth, 40.0 / 667.0 * ScreenHeight));
    }];
    
    
    [self.rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.headerView);
        make.right.equalTo(weakSelf).with.offset(-15);
        make.size.mas_equalTo(CGSizeMake(7.0 / 375.0 * ScreenWidth, 14.0 / 667.0 * ScreenHeight));
    }];
    
    
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.headerView.mas_top).with.offset(weakSelf.headerView.frame.size.height - 1);
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 1));
    }];
}
- (void)createFooterView
{
    self.footerView = [[UIView alloc] initWithFrame:CGRectMake(0, self.headerView.frame.size.height, ScreenWidth, 65.0 / 667.0 * ScreenHeight)];
    [self addSubview:self.footerView];
    
    CGFloat width = ScreenWidth / 3.0;
    CGFloat height = self.footerView.frame.size.height;
    
    self.footerView1 = [[ZRMyPageContentView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    _footerView1.contentButton.tag = 1000;
    [self.footerView addSubview:_footerView1];
    [_footerView1.contentLabel setText:@"我的钱包"];
    
    
    
    self.footerLine1 = [[UIView alloc] initWithFrame:CGRectMake(width, 0, 1, height)];
    [self.footerLine1 setBackgroundColor:RGBCOLOR(187, 187, 187)];
    [self.footerView addSubview:self.footerLine1];
    
    self.footerView2 = [[ZRMyPageContentView alloc] initWithFrame:CGRectMake(width, 0, width, height)];
    _footerView2.contentButton.tag = 2000;
    [self.footerView addSubview:_footerView2];
    [_footerView2.contentLabel setText:@"我的积分"];
    
    self.footerLine2 = [[UIView alloc] initWithFrame:CGRectMake(width * 2, 0, 1, height)];
    [self.footerLine2 setBackgroundColor:RGBCOLOR(187, 187, 187)];
    [self.footerView addSubview:self.footerLine2];
    
    self.footerView3 = [[ZRMyPageContentView alloc] initWithFrame:CGRectMake(width * 2, 0, width, height)];
    _footerView3.contentButton.tag = 3000;
    [self.footerView addSubview:_footerView3];
    [_footerView3.contentLabel setText:@"积分商城"];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
