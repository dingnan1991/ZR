//
//  ZRTabBarViewController.m
//  zhiruProduct
//
//  Created by 魏嘉楠 on 16/6/22.
//  Copyright © 2016年 Zhiru. All rights reserved.
//

#import "ZRTabBarViewController.h"

#import "ZRHomeController.h"
#import "ZRMyPageController.h"
#import "ZRDiscoveryController.h"
#import "ZRNavigationController.h"
#import "ZRTabBar.h"


@interface ZRTabBarViewController ()<ZRTabBarDelegate,UIAlertViewDelegate>

@property (nonatomic , weak) ZRTabBar* myTabBar;
@property (nonatomic , strong) NSMutableArray * items;
@end

@implementation ZRTabBarViewController

- (NSMutableArray *)items
{
    if (_items == nil) {
        _items = [NSMutableArray array];
    }
    return _items;
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    // 干掉系统tabBarButton
    for (UIView *tabBarButton in self.tabBar.subviews) {

        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabBarButton removeFromSuperview];
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc]init]];
    
    // 添加所有子控制器
    [self setUpAllChildController];
    
    // 设置tabBar
    [self setUpTabBar];
}

#pragma mark - 添加子控制器

-(void)setUpAllChildController{
    // *首页*/
    ZRHomeController * homeVC = [[ZRHomeController alloc] init];
    [self setUpOneChildViewController:homeVC image:[UIImage imageNamed:@"home01"] selImg:[UIImage imageNamed:@"home02"] title:@""];
    
    //*发现*/
    ZRDiscoveryController * discoveryVC = [[ZRDiscoveryController alloc]init];
     [self setUpOneChildViewController:discoveryVC image:[UIImage imageNamed:@"find01"] selImg:[UIImage imageNamed:@"find02"] title:@"发现"];
    
    //*个人中心*/
    ZRMyPageController * myPageVC = [[ZRMyPageController alloc] init];
     [self setUpOneChildViewController:myPageVC image:[UIImage imageNamed:@"mine01"] selImg:[UIImage imageNamed:@"mine02"] title:@"个人中心"];
}
- (void)setUpOneChildViewController:(UIViewController *)vc image:(UIImage *)image selImg:(UIImage *)selImg title:(NSString *)title{
    
    UILabel * titleLB = [[UILabel alloc] init];
    titleLB.font = [UIFont fontWithName:@"Lantinghei SC Extralight" size:16];
    titleLB.text = title;
    titleLB.textColor = [UIColor blackColor];
    [titleLB sizeToFit];
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selImg;
    vc.navigationItem.titleView = titleLB;
    
    //将 控制器的 item模型保存到数组中
    [self.items addObject:vc.tabBarItem];
    
    ZRNavigationController * nav = [[ZRNavigationController alloc]initWithRootViewController:vc];
    
    [self addChildViewController:nav];
}



#pragma mark - 设置tabBar
- (void)setUpTabBar{
    ZRTabBar * tabBar = [[ZRTabBar alloc] initWithFrame:self.tabBar.bounds];

    tabBar.delegate = self;
    tabBar.items = self.items;
    _myTabBar = tabBar;
    [self.tabBar addSubview:tabBar];
}

//按钮点击
- (void)tabBar:(ZRTabBar *)tabBar didClickBtn:(UIButton *)btn
{
    if (self.selectedIndex == btn.tag) {
        return;
    }
    // 切换控制器
    self.selectedIndex = btn.tag;
    [self setAnimation];
    [self imgAnimate:btn];
    
}

//动画跳转
- (void)setAnimation{
    CATransition *myTransition=[CATransition animation];
    myTransition.duration=0.3;
    
    [self.view.layer addAnimation:myTransition forKey:nil];
}

//- (void)moveShadeBtn:(UIButton*)btn{
//    
//    [UIView animateWithDuration:0.3 animations:
//     ^(void){
//         
//         CGRect frame = shadeBtn.frame;
//         frame.origin.x = btn.frame.origin.x;
//         shadeBtn.frame = frame;
//         
//         
//     } completion:^(BOOL finished){//do other thing
//     }];
//    
//    
//}

- (void)imgAnimate:(UIButton*)btn{
    
    UIView *view=btn.imageView;
    
    [UIView animateWithDuration:0.1 animations:
     ^(void){
         
         view.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.5, 0.5);
         
         
     } completion:^(BOOL finished){//do other thing
         [UIView animateWithDuration:0.2 animations:
          ^(void){
              
              view.transform = CGAffineTransformScale(CGAffineTransformIdentity,1.2, 1.2);
              
          } completion:^(BOOL finished){//do other thing
              [UIView animateWithDuration:0.1 animations:
               ^(void){
                   
                   view.transform = CGAffineTransformScale(CGAffineTransformIdentity,1,1);
                   
                   
               } completion:^(BOOL finished){//do other thing
               }];
          }];
     }];
    
    
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
