//
//  ZRGroupBuyingController.m
//  zhiruProduct
//
//  Created by 魏嘉楠 on 16/7/5.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import "ZRGroupBuyingController.h"
#import "ZRGroupBuyingCell.h"

@interface ZRGroupBuyingController ()


@end

@implementation ZRGroupBuyingController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.screeningView.screeningViewClick = ^(NSString * infoStr){
        NSLog(@"%@",infoStr);
    };
}

- (void)createHeadView{
    

    for (int i = 0; i < self.ScreeningDict.count; i++) {
      
        
        ZRScreeningView * screeningView = [[ZRScreeningView alloc] initWithFrame:CGRectMake(0, 104, ScreenWidth, ScreenHeight - 40)andTitleArr:self.ScreeningDict[self.queryArr[i]]];
        [self.view addSubview:screeningView];
        

        
        screeningView.screeningViewClick = ^(NSString * infoStr){
            NSLog(@"%@",infoStr);
        };
        
        [self.screeningMarr addObject:screeningView];
    }
    
    
    
}
#pragma mark - tableView代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * Cell = @"GroupBuyingCell";
    ZRGroupBuyingCell *ordeingCell = [tableView dequeueReusableCellWithIdentifier:Cell];
    
    if (ordeingCell == nil) {
        NSArray *nibs = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([ZRGroupBuyingCell class]) owner:self options:nil];
        ordeingCell = [nibs lastObject];
    }
    
    return ordeingCell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
