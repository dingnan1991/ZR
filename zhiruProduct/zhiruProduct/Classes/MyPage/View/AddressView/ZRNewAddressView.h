//
//  ZRNewAddressView.h
//  zhiruProduct
//
//  Created by pj on 16/7/12.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZRSelectSexView.h"

@class ZRRegisterView;


@interface ZRNewAddressView : UIView

@property (nonatomic, strong)UIView * lineView1;
@property (nonatomic, strong)ZRRegisterView * nameView;
@property (nonatomic, strong)UIView * lineView2;
@property (nonatomic, strong)ZRSelectSexView * sexView;
@property (nonatomic, strong)UIView * lineView3;
@property (nonatomic, strong)ZRRegisterView * phoneNumberView;
@property (nonatomic, strong)UILabel * addressLabel;
@property (nonatomic, strong)UITextView * addressTextView;
@end
