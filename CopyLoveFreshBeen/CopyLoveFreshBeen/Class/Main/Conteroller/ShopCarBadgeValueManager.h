//
//  ShopCarBadgeValueManager.h
//  CopyLoveFreshBeen
//
//  Created by way on 16/7/7.
//  Copyright © 2016年 way. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GoodsModel.h"

@interface ShopCarBadgeValueManager : NSObject

-(void)addProductToShopCarWithGoodsModel:(GoodsModel *)goods;
-(void)reduceProductToShopCarWithGoodsModel:(GoodsModel *)goods;

@end
