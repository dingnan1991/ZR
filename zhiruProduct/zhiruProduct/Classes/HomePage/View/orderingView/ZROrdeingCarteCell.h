//
//  ZROrdeingCarteCell.h
//  zhiruProduct
//
//  Created by 魏嘉楠 on 16/7/9.
//  Copyright © 2016年 Zhiru. All rights reserved.
//  菜单界面

#import <UIKit/UIKit.h>

@protocol ZROrdeingCarteCellDelegate <NSObject>

@optional
- (void)ordeingCarteDidScrollWithOffsetY :(CGFloat)offsetY ;

@end


@interface ZROrdeingCarteCell : UICollectionViewCell



@property (nonatomic , weak) id<ZROrdeingCarteCellDelegate> delegate;

@end
