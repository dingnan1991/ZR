//
//  ZRBaseOrderingViewCell.h
//  zhiruProduct
//
//  Created by 魏嘉楠 on 16/7/9.
//  Copyright © 2016年 Zhiru. All rights reserved.
//  订餐根tableview的cell

#import <UIKit/UIKit.h>

@protocol ZRBaseOrderingViewCellDelegate <NSObject>

@optional
- (void)baseOrderingViewCellDidScrollWithOffsetY :(CGFloat)offsetY ;

@end

@interface ZRBaseOrderingViewCell : UITableViewCell

@property (nonatomic , assign) NSInteger index;

@property (nonatomic , copy) void(^cellDisplaying)(NSIndexPath * indexPath);

@property (nonatomic , weak) id<ZRBaseOrderingViewCellDelegate> delegate;
@end
