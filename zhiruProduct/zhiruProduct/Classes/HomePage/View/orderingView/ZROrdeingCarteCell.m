//
//  ZROrdeingCarteCell.m
//  zhiruProduct
//
//  Created by 魏嘉楠 on 16/7/9.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import "ZROrdeingCarteCell.h"
#import "ZRCarteTableViewCell.h"
@interface ZROrdeingCarteCell ()<UITableViewDelegate , UITableViewDataSource>

@property (nonatomic , strong) UIView * leftBarView;

@property (nonatomic ,strong) UIScrollView *leftScr;

//当前假数据---- 后期换成后台接收数据,响应方法位置也要换
@property (nonatomic ,strong) NSArray * CarteTitleArr;

@property (nonatomic , strong) UITableView * rightTableView;
@property (nonatomic , weak) UIButton * selectBtn;

@property (nonatomic , assign) CGFloat LastOffset;

@property (nonatomic , assign) CGFloat rightOffset;

@property (nonatomic , strong) NSMutableArray * leftButtonMarr;
@end


@implementation ZROrdeingCarteCell

-(NSMutableArray *)leftButtonMarr{
    if (_leftButtonMarr == nil) {
        _leftButtonMarr = [NSMutableArray array];
    }
    return _leftButtonMarr;
}

- (UITableView *)rightTableView{
    if (_rightTableView == nil ) {
        _rightTableView = [[UITableView alloc] initWithFrame:CGRectMake(90, 0, ScreenWidth -90 ,self.contentView.height  ) style:UITableViewStylePlain];
        
        [self addSubview:_rightTableView];
        
        _rightTableView.backgroundColor = [UIColor clearColor];
        
        _rightTableView.rowHeight = UITableViewAutomaticDimension;
        _rightTableView.estimatedRowHeight = 120.0;
        
        _rightTableView.delegate = self;
        _rightTableView.dataSource = self;
        
        
    }
    return _rightTableView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //左边栏
        _leftBarView = [UIView new];
        _leftBarView.backgroundColor = R_G_B_16(0xfafafa);
        [self addSubview:_leftBarView];
        
        _leftScr = [MyControl createUIScrollViewWithFrame:CGRectMake(0, 0, 90, self.contentView.height ) contentSize:CGSizeMake(90, _CarteTitleArr.count * 40) pagingEnabled:NO showsHorizontalScrollIndicator:NO showsVerticalScrollIndicator:NO delegate:self];
        [self addSubview:_leftScr];
        
        self.rightTableView.delegate = self;
        self.rightTableView.dataSource = self;
        
         [self createLeftTitle];
    }
    return self;
}

-(NSArray *)CarteTitleArr{
    if (_CarteTitleArr == nil) {
        _CarteTitleArr = @[@"热销榜",@"主食",@"配菜",@"炒菜",@"小菜",@"甜品",@"饮品",@"其他"];
    }
    return _CarteTitleArr;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    WS(ws)
    [self.leftBarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.mas_top);
        make.left.equalTo(ws.mas_left);
        make.bottom.equalTo(ws.mas_bottom);
        make.width.mas_equalTo(90);
    }];
   
   
}

#pragma mark - 创建左边栏标题
- (void)createLeftTitle{
    for (int i = 0; i<self.CarteTitleArr.count; i++) {
        
        UIButton *button = [MyControl createButtonWithFrame:CGRectMake(0, 40*i, 90*SCALE, 40) ImageName:nil Target:self Action:@selector(leftBarBtnClick:) Title:_CarteTitleArr[i]];
        button.titleLabel.font = CustomFont(Font_Content);
        [button setTitleColor:R_G_B_16(0x555555) forState:UIControlStateNormal];
        [button setBackgroundColor:R_G_B_16(0xf0f0f0) forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor whiteColor] forState:UIControlStateSelected];
        button.tag = 100 + i;
        [self.leftScr addSubview:button];
        
        [self.leftButtonMarr addObject:button];
        if (i == 0) {
            button.selected = YES;
            _selectBtn = button;
        }
    }
    
}


#pragma mark - tableView代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.CarteTitleArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * Cell = @"CarteCell";
    ZRCarteTableViewCell *carteCell = [tableView dequeueReusableCellWithIdentifier:Cell];
    
    if (carteCell == nil) {
        NSArray *nibs = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([ZRCarteTableViewCell class]) owner:self options:nil];
        carteCell = [nibs lastObject];
    }
    
    return carteCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 24;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    NSString *sectionTitle=[self tableView:tableView titleForHeaderInSection:section];
    
    if (sectionTitle==nil) {
        
        return nil;
        
    }
    
    // Create label with section title
    
    UILabel *label=[[UILabel alloc] init] ;
    
    label.backgroundColor=[UIColor clearColor];
    
    label.textColor=[UIColor blackColor];
    
    label.font=[UIFont systemFontOfSize:14];
    
    label.text=sectionTitle;
    
    label.textColor = R_G_B_16(0x555555);
    
    // Create header view and add label as a subview
    
    UIView *sectionView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 22)] ;
    
    [sectionView setBackgroundColor:R_G_B_16(0xf0f0f0)];
    
    [sectionView addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(sectionView.mas_left).offset(12);
        make.centerY.equalTo(sectionView.mas_centerY);
    }];
    
    return sectionView;
    
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    return self.CarteTitleArr[section];
}

#pragma mark -- 监听滑动距离
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetY = scrollView.contentOffset.y;
    //89
    CGFloat lastOffset;
    if (scrollView == self.rightTableView) {
        lastOffset = _LastOffset ;
    }else{
        lastOffset = _rightOffset;
    }
    if ([self.delegate respondsToSelector:@selector(ordeingCarteDidScrollWithOffsetY:)]) {
        [self.delegate ordeingCarteDidScrollWithOffsetY:offsetY - lastOffset];
    }
    
    
    NSArray * cellArr = [self.rightTableView indexPathsForVisibleRows];
    
    NSIndexPath * indexP = cellArr[0];
    
    
    if (self.leftButtonMarr[indexP.section] != _selectBtn) {
         _selectBtn.selected = NO;
        
        UIButton * btn =  self.leftButtonMarr[indexP.section];
        btn.selected = YES;
        
        _selectBtn = btn;
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    if (scrollView == self.rightTableView) {
        _LastOffset = scrollView.contentOffset.y;
    }else{
        _rightOffset = scrollView.contentOffset.y;
    }

}

#pragma mark -- 左边栏点击事件
- (void)leftBarBtnClick :(UIButton *)btn{
    
    _selectBtn.selected = NO;
    
    btn.selected = YES;
    
    _selectBtn = btn;
    
    NSInteger count = btn.tag - 100;
    
    [_rightTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:count] atScrollPosition:UITableViewScrollPositionTop animated:YES];
}
@end
