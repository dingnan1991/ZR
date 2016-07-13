//
//  ZRRegisterView.h
//  zhiruProduct
//
//  Created by pj on 16/7/9.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZRRegisterView : UIView


@property (nonatomic, strong)UILabel * label;

@property (nonatomic, strong)UITextField * textField;

- (void)labelText:(NSString *)labelStr labelTextFont:(CGFloat)font textFieldPlaceHolder:(NSString *)textFieldStr textFieldSecureTextEntry:(BOOL)YesOrNo;
@end
