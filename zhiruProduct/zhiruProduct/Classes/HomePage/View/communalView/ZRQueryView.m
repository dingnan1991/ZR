//
//  ZRQueryView.m
//  zhiruProduct
//
//  Created by 魏嘉楠 on 16/7/5.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import "ZRQueryView.h"

@interface ZRQueryView ()
@property (nonatomic , strong) NSArray * titleArr;

@property (nonatomic , strong) UIButton * selectBtn; //记录当前选中 按钮
@property (nonatomic , strong) UIView * selectView; //记录当前选中 view
@property (nonatomic , strong) UIButton * searchBtn; //记录按钮位置

@property (nonatomic , strong) NSMutableArray * rootViewArr; //保存搜索条件根视图
@end

@implementation ZRQueryView

-(NSMutableArray *)rootViewArr{
    if (_rootViewArr == nil) {
        _rootViewArr = [NSMutableArray array];
    }
    return _rootViewArr ;
}

- (NSArray *)titleArr{
    if (_titleArr == nil) {
        _titleArr = @[@"地理",@"品类",@"排序",@"筛选"];
    }
    return _titleArr;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        //暂时写着,后期后台有数据 这个方法 要换位置调用
        [self createSearchBox];
        //暂时写着,后期后台有数据 这个方法 要换位置调用
        [self createSearchInfo];
    }
    return self;
}


#pragma mark -- 创建视图
- (void)createSearchBox{
    
    CGFloat SearchBtnH = 40 ;
    CGFloat SearchBtnW = ScreenWidth / 4 ;

    
    
    for (int i = 0 ; i < 4; i++) {
        UIButton * searchBtn = [[UIButton alloc] initWithFrame:CGRectMake(i * SearchBtnW, 25, SearchBtnW, SearchBtnH) ];
        searchBtn.tag = i;
        
        [searchBtn setImage:[UIImage imageNamed:@"jiantoushang"] forState:UIControlStateNormal];
        [searchBtn setImage:[UIImage imageNamed:@"jiantouxia"] forState:UIControlStateSelected];
        
        [searchBtn setTitle:self.titleArr[i] forState:UIControlStateNormal];
        [searchBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [searchBtn setTitle:self.titleArr[i] forState:UIControlStateSelected];
        
        searchBtn.layer.borderWidth = 1;
        searchBtn.layer.borderColor = [UIColor grayColor].CGColor;
        
        [searchBtn addTarget:self action:@selector(searchBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:searchBtn];
        _searchBtn = searchBtn;
    }
}
#pragma mark -- 创建筛选条件
- (void)createSearchInfo{
    
    //.................................................这个方法 要在传完数据模型后 调用
    
    //假数据
    NSDictionary * searchdict = @{@"1":@[@"200",@"300"],@"2":@[@"400",@"500"],@"3":@[@"100"],@"4":@[@"1000",@"2000"]};
    NSArray * infoArr = @[@"200",@"300",@"1000",@"5000"];
    NSInteger count = 0;
    for (NSArray * titleArr in searchdict) {
        UIView * rootView = [[UIView alloc] init];
        [self addSubview:rootView];
        
        rootView.tag = count;
        //默认隐藏
        rootView.hidden = YES;
        
        [self.rootViewArr addObject:rootView];
        
        CGFloat searchTableH = infoArr.count * 40;
        
        WS(ws)
        [rootView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(ws.mas_left);
            make.right.equalTo(ws.mas_right);
            make.top.equalTo(ws.searchBtn.mas_bottom);
            make.height.offset(searchTableH);
        }];
        
        for (int i = 0; i < infoArr.count; i++) {
            UIButton * searchInfoBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, i * 40, ScreenWidth, 40)];
            
            [searchInfoBtn setTitle:infoArr[i] forState:UIControlStateNormal];
            [searchInfoBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            
            [searchInfoBtn setBackgroundColor:[UIColor blackColor]];
            [searchInfoBtn addTarget:self action:@selector(searchInfoBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [rootView addSubview:searchInfoBtn];
        }
        count ++;
    }
    
}

#pragma mark -- 筛选条件点击事件
- (void)searchInfoBtnClick :(UIButton *) btn{
    _selectView.hidden = YES;
    
    //执行回调
    
}

#pragma mark -- 按钮点击事件
- (void)searchBtnClick:(UIButton *)btn{
    if (btn != _selectBtn) {
        _selectBtn.selected = NO;
        _selectBtn = btn;
    }
    
    btn.selected = !btn.selected;
    //动画效果弹出 筛选视图
    
    if ( _selectView != self.rootViewArr[btn.tag]) {
        _selectView.hidden = YES;
    }
    UIView * rootV = self.rootViewArr[btn.tag];
    _selectView = rootV;
    
    if (rootV.hidden == YES) {
        rootV.hidden = NO;
    }else{
        rootV.hidden = YES;
    }
    
}

@end
