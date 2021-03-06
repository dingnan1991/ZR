//
//  ZRCaptchaView.m
//  zhiruProduct
//
//  Created by pj on 16/7/9.
//  Copyright © 2016年 Zhiru. All rights reserved.
//


// 验证码
#import "ZRCaptchaView.h"

@implementation ZRCaptchaView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createContentView];
    }
    return self;
}
- (void)createContentView
{
    CGFloat superViewHeight = self.frame.size.height;
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 10, superViewHeight)];
    [self.label setText:@"1"];
    [self.label setFont:[UIFont systemFontOfSize:14.0]];
//    [self.label setBackgroundColor:[UIColor purpleColor]];
    [self.label setTextAlignment:NSTextAlignmentLeft];
    [self addSubview:self.label];
    
    self.img = [[UIImageView alloc] initWithFrame:CGRectMake(self.label.frame.origin.x + self.label.frame.size.width + 2, (superViewHeight - 8) / 2.0, 16, 8)];
    [self addSubview:self.img];
    [self.img setImage:[UIImage imageNamed:@"jiantouxia"]];
//    [self.img setBackgroundColor:[UIColor orangeColor]];
    
    
    
    self.lineView = [[UIView alloc] init];
    [self addSubview:self.lineView];
    
    WS(weakSelf);
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).with.offset(70);
        make.top.equalTo(weakSelf).with.offset(5);
        make.bottom.equalTo(weakSelf).with.offset(-5);
        make.width.mas_offset(@1);
    }];
    [self.lineView setBackgroundColor:RGBCOLOR(187, 187, 187)];
    
    
    self.clearButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:_clearButton];
    [self.clearButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).with.offset(15);
        make.top.equalTo(weakSelf).with.offset(0);
        make.bottom.equalTo(weakSelf).with.offset(-0);
        make.right.equalTo(weakSelf.lineView.mas_left).with.offset(0);
    }];
    [self.clearButton setBackgroundColor:[UIColor clearColor]];
    
    
    
    self.captchaButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.captchaButton];
    
    [self.captchaButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf).with.offset(7);
        make.right.equalTo(weakSelf).with.offset(-15);
        make.bottom.equalTo(weakSelf).with.offset(-7);
//        make.left.equalTo(weakSelf).with.offset(265);
        make.width.mas_equalTo(100.0 / 375.0 * ScreenWidth);
    }];
    self.captchaButton.layer.masksToBounds = YES;
    self.captchaButton.layer.borderWidth = 1;
    self.captchaButton.layer.borderColor = RGBCOLOR(187, 187, 187).CGColor;
    self.captchaButton.layer.cornerRadius = 4;
    [self.captchaButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self.captchaButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.captchaButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
    
    self.textField = [[UITextField alloc] init];
    [self addSubview:self.textField];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf).with.offset(5);
        make.bottom.equalTo(weakSelf).with.offset(-5);
        make.left.equalTo(weakSelf.lineView.mas_right).with.offset(15);
        make.right.equalTo(weakSelf.captchaButton.mas_left).with.offset(-5);
    }];
    [self.textField setBorderStyle:UITextBorderStyleNone];
    [self.textField setClearButtonMode:UITextFieldViewModeAlways];
    [self.textField setPlaceholder:@"请输入手机号"];
//    [self.textField setValue:[UIFont systemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
