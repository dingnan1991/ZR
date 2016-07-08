//
//  ZRTableVIewHeadView.m
//  zhiruProduct
//
//  Created by 魏嘉楠 on 16/7/2.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import "ZRTableVIewHeadView.h"

@interface ZRTableVIewHeadView ()


@property (nonatomic , strong) NSArray * titleArr; //* 保存标题*/
@property (nonatomic , weak) UIView * baseView; //* 父视图*/

@property (nonatomic , strong) NSMutableArray * btnMarr ; //* 保存本视图按钮*/
@end

@implementation ZRTableVIewHeadView

-(NSMutableArray *)btnMarr{
    if (_btnMarr == nil) {
        _btnMarr = [NSMutableArray array];
    }
    return _btnMarr;
}

- (instancetype)initWithFrame:(CGRect)frame andTitleArr:(NSArray * )titleArr
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //背景色
//        self.backgroundColor = R_G_B_16(0xf0f0f0);
        
        _titleArr = titleArr;
        //添加子视图
        UIView * baseView = [[UIView alloc] init];
        _baseView = baseView;
        
        [self addSubview: baseView];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    if (_titleArr.count > 4) {
        _baseView.frame = CGRectMake(0, 0, ScreenWidth, 200);
    }else{
        _baseView.frame = CGRectMake(0, 0, ScreenWidth, 110);
    }
    
    [self createSubView];
}


- (void)createSubView{
    
    //创建 按钮
    CGFloat rowCount = 0;
    CGFloat count = 0;
    CGFloat btnWH = 44.f;
    CGFloat btnSpacing = (ScreenWidth - 4 * btnWH) / 5;
    for ( int i = 0  ; i < _titleArr.count; i++) {
        
        if (i == 4) {
            rowCount +=1;
            count = 0;
        }
        
        CGFloat btnX = count * btnWH + count * btnSpacing + btnSpacing;
        CGFloat btnY = rowCount * 40 + rowCount * 44  + 20;
        
        //创建手势
        UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickImgView:)];

        //创建图片V
        UIImageView * imgV = [[UIImageView alloc] initWithFrame:CGRectMake(btnX, btnY, btnWH, btnWH)];
        imgV.tag = i;
        imgV.userInteractionEnabled = YES;
        //添加点击手势
        [imgV addGestureRecognizer:tapGesture];
        
        [_baseView addSubview:imgV];
        //将图片view保存,等待网络请求到 图片,设置图片
        [self.btnMarr addObject:imgV];
        
        //创建 下方文字
        UILabel * btnTitle = [[UILabel alloc] init];
        btnTitle.text = self.titleArr[i];
        btnTitle.font = [UIFont systemFontOfSize:12];
        btnTitle.textAlignment =  NSTextAlignmentCenter ;
        
        [_baseView addSubview:btnTitle];
        
        [btnTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(imgV.mas_centerX);
            make.top.equalTo(imgV.mas_bottom).offset(10);
        }];
        
        count ++;
        
    }
    
    
    UIView * lineV = [[UIView alloc] init];
    
    lineV.backgroundColor = ZRBackgroundColor;
    
    [self addSubview:lineV];
    
    WS(ws)
    [lineV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.mas_left);
        make.right.equalTo(ws.mas_right);
        make.height.equalTo(@15);
        make.top.equalTo(ws.baseView.mas_bottom);
    }];
    
    
}

#pragma mark -- 设置图片数据
-(void)setTitleImgArr:(NSArray *)titleImgArr{
    
    _titleImgArr = titleImgArr;
    
    for (int i = 0; i < titleImgArr.count; i++) {
        
        UIImageView * imgV = self.btnMarr[i];
        
        [imgV sd_setImageWithURL:titleImgArr[i] placeholderImage:ZRPlaceholderImage];
        
    }
}

#pragma mark -- 图片点击
- (void)clickImgView :(UITapGestureRecognizer *)tap {
    
    if (self.clickImgView) {
        
        self.clickImgView (tap.self.view.tag);

    }
}


@end
