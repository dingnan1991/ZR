//
//  ZRSupermarketHome.m
//  zhiruProduct
//
//  Created by nanding on 16/7/9.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import "ZRSupermarketHome.h"

@interface ZRSupermarketHome ()<UITableViewDataSource, UITableViewDelegate>
/*左侧tableView*/
@property (nonatomic, strong) UITableView *categoryTable;
/*右侧tableView*/
@property (nonatomic, strong) UITableView *productTable;

@end

@implementation ZRSupermarketHome
#pragma mark - init methods
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}


#pragma mark - 懒加载

-(UITableView *)categoryTable
{
    if (!_categoryTable) {
        //_categoryTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, <#CGFloat width#>, <#CGFloat height#>) style:<#(UITableViewStyle)#>]
        
    }
    return _categoryTable;
}


-(UITableView *)productTable
{
    if (!_productTable) {
        
    }
    return _productTable;
}

#pragma mark - UITableViewDataSource methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == self.categoryTable) {
        return 1;
    }else{
        return 1;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    
    
    
    return cell;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
