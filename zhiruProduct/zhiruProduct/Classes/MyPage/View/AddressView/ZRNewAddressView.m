//
//  ZRNewAddressView.m
//  zhiruProduct
//
//  Created by pj on 16/7/12.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import "ZRNewAddressView.h"
#import "ZRRegisterView.h"

@implementation ZRNewAddressView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createContentView];
        [self setViewMasonary];
    }
    return self;
}
- (void)createContentView
{
    self.nameView = [[ZRRegisterView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 40.0 / 667.0 * ScreenHeight)];
    [self.nameView labelText:@"联系人" labelTextFont:15.0 textFieldPlaceHolder:@"您的姓名" textFieldSecureTextEntry:NO];
    [self.nameView.textField setClearButtonMode:UITextFieldViewModeAlways];
    [self addSubview:self.nameView];
    self.lineView1 = [[UIView alloc] init];
    self.lineView1.backgroundColor = RGBCOLOR(187, 187, 187);
    [_nameView addSubview:_lineView1];
    
    self.sexView = [[ZRSelectSexView alloc] initWithFrame:CGRectMake(0, _nameView.frame.size.height, ScreenWidth, _nameView.frame.size.height)];
    [self addSubview:_sexView];
    self.lineView2 = [[UIView alloc] init];
    self.lineView2.backgroundColor = RGBCOLOR(187, 187, 187);
    [_sexView addSubview:_lineView2];
    
    self.phoneNumberView = [[ZRRegisterView alloc] initWithFrame:CGRectMake(0, _sexView.frame.origin.y + _sexView.frame.size.height, ScreenWidth, _nameView.frame.size.height)];
    [self.phoneNumberView labelText:@"联系电话" labelTextFont:15.0 textFieldPlaceHolder:@"您的手机号" textFieldSecureTextEntry:NO];
    [self.phoneNumberView.textField setClearButtonMode:UITextFieldViewModeAlways];
    [self addSubview:_phoneNumberView];
    
    self.lineView3 = [[UIView alloc] init];
    self.lineView3.backgroundColor = RGBCOLOR(187, 187, 187);
    [_phoneNumberView addSubview:_lineView3];
}
- (void)setViewMasonary
{
    WS(weakSelf);
    [self.lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.nameView).with.offset(0);
        make.right.equalTo(weakSelf.nameView).with.offset(-0);
        make.top.equalTo(weakSelf.nameView).with.offset(-0);
        make.height.mas_equalTo(@1);
    }];
    [self.lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.sexView).with.offset(15);
        make.right.equalTo(weakSelf.sexView).with.offset(-0);
        make.top.equalTo(weakSelf.sexView).with.offset(-0);
        make.height.mas_equalTo(@1);
    }];
    [self.lineView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.phoneNumberView).with.offset(15);
        make.right.equalTo(weakSelf.phoneNumberView).with.offset(-0);
        make.top.equalTo(weakSelf.phoneNumberView).with.offset(-0);
        make.height.mas_equalTo(@1);
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
