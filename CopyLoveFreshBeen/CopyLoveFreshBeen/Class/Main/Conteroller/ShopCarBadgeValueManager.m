//
//  ShopCarBadgeValueManager.m
//  CopyLoveFreshBeen
//
//  Created by way on 16/7/7.
//  Copyright © 2016年 way. All rights reserved.
//

#define ShopCarProductNumber @"ShopCarProductNumber"
#import "ShopCarBadgeValueManager.h"
#import "ThreeViewController.h"

@interface ShopCarBadgeValueManager()

@property (strong,nonatomic) ThreeViewController * shopCarVC;
@property (assign,nonatomic) NSInteger numberOfBadgeValue;
@property (strong,nonatomic) NSMutableArray * productArr;

@end

@implementation ShopCarBadgeValueManager

-(NSMutableArray *)productArr{
    
    if (!_productArr) {
        _productArr = [NSMutableArray array];
    }
    return _productArr;
}

-(ThreeViewController *)shopCarVC{
    
    if (!_shopCarVC) {
        _shopCarVC = [[ThreeViewController alloc] init];
    }
    return _shopCarVC;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

-(void)addProductToShopCarWithGoodsModel:(GoodsModel *)goods{
    
    self.productArr = [[NSUserDefaults standardUserDefaults] objectForKey:ShopCarProductNumber];
    [self.productArr addObject:goods];
    
    self.shopCarVC.tabBarItem.badgeValue = [NSString stringWithFormat:@"%lu",(unsigned long)self.productArr.count];
    [[NSUserDefaults standardUserDefaults] setObject:self.productArr forKey:ShopCarProductNumber];
    
}

-(void)reduceProductToShopCarWithGoodsModel:(GoodsModel *)goods{
    
     self.productArr = [[NSUserDefaults standardUserDefaults] objectForKey:ShopCarProductNumber];
    for (GoodsModel * model in self.productArr) {
        if (model.idd == goods.idd) {
            [self.productArr removeObject:model];
        }
    }
    
    self.shopCarVC.tabBarItem.badgeValue = [NSString stringWithFormat:@"%lu",(unsigned long)self.productArr.count];
    [[NSUserDefaults standardUserDefaults] setObject:self.productArr forKey:ShopCarProductNumber];
}



@end
