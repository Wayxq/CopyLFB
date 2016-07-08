//
//  TabbarBadgeView.h
//  CopyLoveFreshBeen
//
//  Created by way on 16/7/8.
//  Copyright © 2016年 way. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodsModel.h"

@interface TabbarBadgeView : UIView

+ (TabbarBadgeView *)sharedManager;

-(void)addProductIntoShopCar:(GoodsModel *)model;
-(void)reduceProductIntoShopCar:(GoodsModel *)model;

@end
