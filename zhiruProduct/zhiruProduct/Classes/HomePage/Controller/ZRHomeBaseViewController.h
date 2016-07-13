//
//  ZRHomeBaseViewController.h
//  zhiruProduct
//
//  Created by 魏嘉楠 on 16/7/7.
//  Copyright © 2016年 Zhiru. All rights reserved.
//  首页公用控制器

#import "ZRBaseViewController.h"
#import "ZRTableVIewHeadView.h"
#import "ZRScreeningView.h"
#import "ZRQueryView.h"
@interface ZRHomeBaseViewController : ZRBaseViewController

@property (nonatomic , strong) NSArray * titleArr;
@property (nonatomic , strong) NSDictionary * ScreeningDict;
@property (nonatomic , strong) NSArray * queryArr;
@property (nonatomic , strong) NSMutableArray * screeningMarr; //用于保存 筛选条件页
@property (nonatomic , weak) UITableView * myTableView;
@property (nonatomic , strong) ZRQueryView * queryView;
@property (nonatomic , strong) ZRScreeningView * screeningView;
/**
 *  首页公用类初始化
 *
 *  @param titleArr      顶部按钮视图 按钮标题
 *  @param screeningDict 筛选条件 字典里是集合,每个集合里存放筛选条件
 *  @param queryTitleArr 筛选标题
 *
 *  @return self
 */
- (instancetype)initWithTitleArr :(NSArray *)titleArr andScreeningDict :(NSDictionary *)screeningDict andQueryTitleArr :(NSArray*)queryTitleArr;

@end
