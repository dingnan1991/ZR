//
//  ZRHomeHeadView.m
//  zhiruProduct
//
//  Created by 魏嘉楠 on 16/6/29.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import "ZRHomeHeadView.h"
#import "AdView.h"  //轮播图

@interface ZRHomeHeadView ()


@property (nonatomic , weak) AdView  * homeAdView; // 首页轮播图

@property (nonatomic , strong) NSArray  * homeBtnTitleArr;
@property (nonatomic , strong) NSArray  * homeBtnImg;

@end

@implementation ZRHomeHeadView

-(NSArray *)homeBtnTitleArr{
    if (_homeBtnTitleArr == nil) {
        _homeBtnTitleArr = @[@"寻味",@"团购",@"订餐",@"娱乐",@"丽人",@"旅行",@"超市",@"更多"];
    }
    return _homeBtnTitleArr;
}

-(NSArray *)homeBtnImg{
    if (_homeBtnImg == nil) {
        _homeBtnImg = @[@"xunw",@"tuang",@"dingc",@"yul",@"lir",@"lvy",@"chaos",@"tuc"];
    }
    return _homeBtnImg;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //创建头视图
        NSArray * imgUrl = @[@"http://img11.360buyimg.com/cms/jfs/t196/241/2413424678/109726/34738058/53cf6e32Na0cbe3e5.jpg",@"http://img11.360buyimg.com/cms/g16/M00/0C/0A/rBEbRlOK07EIAAAAAAPXHfjijrkAACZxAMOZPwAA9c1025.jpg"];
        [self createAdvert:imgUrl];
        
        [self createBtnView];
    }
    return self;
}


#pragma mark -- 创建轮播图
- (void)createAdvert:(NSArray *)advertMarr
{
    
    AdView * myAdView = [AdView adScrollViewWithFrame:CGRectMake(0, 0, ScreenWidth, 226.f) imageLinkURL:advertMarr placeHoderImageName:@" " pageControlShowStyle:UIPageControlShowStyleCenter];
    
    
    //图片被点击后回调的方法
    WS(ws)
    myAdView.callBack = ^(NSInteger index,NSString * imageURL,UIImageView * imgView)
    {
        if (ws.clickImg) {
            ws.clickImg(index,imageURL,imgView);
        }
        
    };
    
    [self addSubview:myAdView];
    
    _homeAdView = myAdView;
}

#pragma mark -- 创建轮播图下方点击按钮
- (void)createBtnView{
    
    UIView * btnView = [[UIView alloc] init];
    
    [self addSubview:btnView];
    
    WS(ws)
   
    [btnView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.homeAdView.mas_bottom).offset(1);
        make.left.equalTo(ws.mas_left);
        make.right.equalTo(ws.mas_right);
        make.height.equalTo(@182);
    }];
    
    
    CGFloat rowCount = 0;
    CGFloat count = 0;
    CGFloat btnWH = 44.f;
    CGFloat btnSpacing = (ScreenWidth - 4 * btnWH) / 5;
    for (int i =0 ; i< self.homeBtnTitleArr.count; i++) {
        
        //4个为一行
        if (i == 4) {
            rowCount +=1;
            count = 0;
        }
        
        CGFloat btnX = count * btnWH + count * btnSpacing + btnSpacing;
        CGFloat btnY = rowCount * 40 + rowCount * 44  + 20;
        
        //创建按钮
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(btnX, btnY, btnWH, btnWH)];
        
        [btnView addSubview:btn];
        btn.tag = i;
        //设置按钮样式
        [btn setImage:[UIImage imageNamed : self.homeBtnImg[i]] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        //创建 下方文字
        UILabel * btnTitle = [[UILabel alloc] init];
        btnTitle.text = self.homeBtnTitleArr[i];
        btnTitle.font = [UIFont systemFontOfSize:12];
        btnTitle.textAlignment =  NSTextAlignmentCenter ;
        
        [btnView addSubview:btnTitle];
        
        [btnTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(btn.mas_centerX);
            make.top.equalTo(btn.mas_bottom).offset(6);
        }];
        
        count ++;
    }
}


#pragma mark -- 点击事件
- (void)BtnClick :(UIButton *)btn{
    
    if (self.clickBtn) {
        self.clickBtn(btn.tag);
    }
}
@end
