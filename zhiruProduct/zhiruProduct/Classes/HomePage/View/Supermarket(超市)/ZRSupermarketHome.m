//
//  ZRSupermarketHome.m
//  zhiruProduct
//
//  Created by nanding on 16/7/9.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import "ZRSupermarketHome.h"
#import "ZRSupermarketHomeCell.h"
#import "ZRAddShoppingCarView.h"
#import "ZRSupermarketHomeObj.h"

#define kLeftWidth            90*ScreenWidth/375

@interface ZRSupermarketHome ()<UITableViewDataSource, UITableViewDelegate, ZRSupermarketCellDelegate>
/*左侧tableView*/
@property (nonatomic, strong) UITableView *categoryTable;
/*右侧tableView*/
@property (nonatomic, strong) UITableView *productTable;


@property (nonatomic, strong) NSIndexPath *leftIndexPath;
@property (nonatomic, strong) NSIndexPath *rightIndexPath;




@property (nonatomic, assign) CGFloat endPoint_x;
@property (nonatomic, assign) CGFloat endPoint_y;
@property (nonatomic, strong) CALayer *dotLayer;
@property (nonatomic, strong) UIBezierPath *path;
@property (nonatomic, strong) ZRAddShoppingCarView *toolView;

@end

@implementation ZRSupermarketHome
#pragma mark - init methods
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.categoryTable];
        [self addSubview:self.productTable];
        
        
        //添加购物车
        _toolView = [[ZRAddShoppingCarView alloc] init];
        _toolView.backgroundColor = [UIColor blackColor];
        _toolView.alpha = 0.7;
        [self addSubview:_toolView];
        [_toolView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(@0);
            make.left.equalTo(@0);
            make.right.equalTo(@0);
            make.height.equalTo(@40);
            
        }];
        
        

    }
    return self;
}


-(void)setCategoryStyle:(HomeCategoryStyle)categoryStyle
{
    _categoryStyle = categoryStyle;
    
    if (_categoryStyle == kCheckAllCategory) {
        //查看全部
        [self tableView:self.categoryTable didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        
    }else if (_categoryStyle == kLatestDiscountCheckAllCategory){
        //最新折扣查看全部
        [self tableView:self.categoryTable didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
        
        
    }else if (_categoryStyle == kLiangyoufushi){
        //粮油副食
        [self tableView:self.categoryTable didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:4 inSection:0]];
        
    }else if (_categoryStyle == kXiuxianlingshi){
        //休闲零食
        [self tableView:self.categoryTable didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:0]];
        
        
        
    }else if (_categoryStyle == kHuoguojingxuan){
        //火锅精选
        [self tableView:self.categoryTable didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:3 inSection:0]];
        
    }else{
        //牛奶果汁
        [self tableView:self.categoryTable didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:5 inSection:0]];
        
    }

}




#pragma mark - 懒加载

-(UITableView *)categoryTable
{
    if (!_categoryTable) {
        _categoryTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kLeftWidth, SCREEN_HEIGHT-64) style:UITableViewStylePlain];
        _categoryTable.delegate = self;
        _categoryTable.dataSource = self;
        _categoryTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return _categoryTable;
}


-(UITableView *)productTable
{
    if (!_productTable) {
        _productTable = [[UITableView alloc] initWithFrame:CGRectMake(kLeftWidth, 0, SCREEN_WIDTH-kLeftWidth, SCREEN_HEIGHT-64) style:UITableViewStylePlain];
        _productTable.delegate = self;
        _productTable.dataSource = self;
        
    }
    return _productTable;
}

#pragma mark - UITableViewDataSource methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == self.productTable) {
        return [self.dataSource ZRRightnumberOfSectionsInTable:tableView];
    }else
        return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.categoryTable) {
        return [self.dataSource ZRLeftnumberOfRowsInSection:section Table:tableView];
    }else{
        return [self.dataSource ZRRightnumberOfRowsInSection:section Table:tableView];
    }
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    if (tableView == self.categoryTable) {
        static NSString *cellID = @"cellID";
        cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        
        // line
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 34, cell.width, 1)];
        line.backgroundColor = [UIColor grayColor];
        [cell addSubview:line];
        
        cell.textLabel.text = [self.dataSource ZRLeftTableView:tableView cellForRowAtIndexPath:indexPath];
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }else{
        ZRSupermarketHomeCell *myCell = [ZRSupermarketHomeCell cellWithTable:tableView];

        
        myCell.selectionStyle = UITableViewCellSelectionStyleNone;
        for (UIView *view in myCell.subviews) {
            [view removeFromSuperview];
        }
        myCell.delegate = self;
        [myCell addSubview:myCell.addBtn];
        myCell.indexPath = indexPath;
        myCell.listArray = [self.dataSource ZRRightTableView:tableView cellForRowAtIndexPath:indexPath];
        
        //监听每个cell数量的变化
        [myCell addObserver:self.toolView forKeyPath:@"countStr" options:NSKeyValueObservingOptionNew context:(__bridge void * _Nullable)(myCell.listArray[2])];
        
        cell = myCell;
        
    }
    
    
    
    
    
    
    return cell;
}


#pragma mark - UITableViewDelegate methods

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (tableView == self.categoryTable) {
        return 0;
    }else
        return 25;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.categoryTable) {
        return 35;
    }else{
        return 70;
    }
}


#pragma mark - ZRSupermarketHomeDelegate methods


- (UIView *)tableView:(UITableView *)tableView
viewForHeaderInSection:(NSInteger)section
{
    UIView *view = nil;
    if (tableView == self.categoryTable) {
        return view;
    }else{
        view =[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 25)];
        view.backgroundColor = [UIColor groupTableViewBackgroundColor];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, SCREEN_WIDTH-5, 25)];
        label.text = [self.delegate ZRRightTitleForHeaderInSection:section RightTable:tableView];
        label.font = [UIFont systemFontOfSize:12];
        [view addSubview:label];
    }
    return view;

}


#pragma mark - UITableViewDelegate methods
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (tableView == self.categoryTable) {

        [self.categoryTable selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
        
        CGRect rect;
        rect = [self.productTable rectForHeaderInSection:indexPath.row];
        [self.productTable setContentOffset:CGPointMake(0, CGRectGetMinY(rect)) animated:YES];
       
    }

    
    
}


#pragma mark - UIScrollViewDelegate

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView == self.productTable) {
       
        [self scrollRightTable];
        
    }
}


-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{

    if (scrollView == self.productTable) {
        if (decelerate == 0) {
           
            [self scrollRightTable];
            
        }
    }

    
}

#pragma mark - Private methods
- (void)scrollRightTable
{
    //获取当前的section
    NSArray *indexPaths = [self.productTable indexPathsForVisibleRows];
    NSIndexPath *indexPath = indexPaths[0];
    NSIndexPath *leftIndexPath = [NSIndexPath indexPathForRow:indexPath.section inSection:0];
    
    [self.categoryTable selectRowAtIndexPath:leftIndexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
}

- (void)scrollToHeaderInSection:(NSIndexPath *)indexPath
{
    CGRect rect;
    rect = [self.productTable rectForHeaderInSection:indexPath.row];
    [self.productTable setContentOffset:CGPointMake(0, CGRectGetMinY(rect)) animated:YES];
}



#pragma mark - ZRSupermarketCellDelegate methods
-(void)addToShoppingCar:(ZRSupermarketHomeCell *)cell WithData:(NSArray *)dataArr WithIndexPath:(NSIndexPath *)indexPath
{
    CGRect parentRect = [cell convertRect:cell.addBtn.frame toView:self];
    // 添加动画
    [self JoinCartAnimationWithRect:parentRect WithCell:cell];
    self.toolView.dataArray = dataArr;
    
     //将数据添加到model中
    if ([[ZRSupermarketHomeObj shareInstance].shoppingCarDic objectForKey:indexPath]) {
        NSMutableArray *array = [[ZRSupermarketHomeObj shareInstance].shoppingCarDic objectForKey:indexPath];
        [array addObject:dataArr];
        
        [[ZRSupermarketHomeObj shareInstance].shoppingCarDic setObject:array forKey:indexPath];
        
    }else{
        NSMutableArray *arr = [NSMutableArray array];
        [arr addObject:dataArr];
        [[ZRSupermarketHomeObj shareInstance].shoppingCarDic setObject:arr forKey:indexPath];
    }
    
   
    
    
}



#pragma mark -加入购物车动画
-(void) JoinCartAnimationWithRect:(CGRect)rect WithCell:(ZRSupermarketHomeCell *)cell
{
    _endPoint_x = 35;
    _endPoint_y = self.height - 35;
    
    CGFloat startX = rect.origin.x;
    CGFloat startY = rect.origin.y;
    
    _path= [UIBezierPath bezierPath];
    [_path moveToPoint:CGPointMake(startX, startY)];
    
    //三点曲线
    [_path addCurveToPoint:CGPointMake(_endPoint_x, _endPoint_y)
             controlPoint1:CGPointMake(startX, startY)
             controlPoint2:CGPointMake(startX - 180, startY - 200)];
    _dotLayer = [CALayer layer];
    _dotLayer.frame = cell.addBtn.frame;
    _dotLayer.contents = (id)[ZRImage(@"supermarket_plus") CGImage];
  
    
    [self.layer addSublayer:_dotLayer];
    [self groupAnimation];
}


#pragma mark - 组合动画
-(void)groupAnimation
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = _path.CGPath;
    animation.rotationMode = kCAAnimationRotateAuto;
    
    CABasicAnimation *alphaAnimation = [CABasicAnimation animationWithKeyPath:@"alpha"];
    alphaAnimation.duration = 0.5f;
    alphaAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    alphaAnimation.toValue = [NSNumber numberWithFloat:0.1];
    alphaAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    CAAnimationGroup *groups = [CAAnimationGroup animation];
    groups.animations = @[animation,alphaAnimation];
    groups.duration = 0.8f;
    groups.removedOnCompletion = NO;
    groups.fillMode = kCAFillModeForwards;
    groups.delegate = self;
    [groups setValue:@"groupsAnimation" forKey:@"animationName"];
    [_dotLayer addAnimation:groups forKey:nil];
    [self performSelector:@selector(removeFromLayer:) withObject:_dotLayer afterDelay:0.8f];
}
- (void)removeFromLayer:(CALayer *)layerAnimation{
    
    [layerAnimation removeFromSuperlayer];
}

#pragma mark - CAAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    
    if ([[anim valueForKey:@"animationName"]isEqualToString:@"groupsAnimation"]) {
        
        CABasicAnimation *shakeAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        shakeAnimation.duration = 0.25f;
        shakeAnimation.fromValue = [NSNumber numberWithFloat:0.8];
        shakeAnimation.toValue = [NSNumber numberWithFloat:1];
        shakeAnimation.autoreverses = YES;
        
        [_toolView.shoppingCatBtn.layer addAnimation:shakeAnimation forKey:nil];
        
    }
}

-(void)dealloc
{
    for (UIView *view in self.productTable.subviews) {
        [view removeObserver:self.toolView forKeyPath:@"countStr"];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
