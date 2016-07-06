//
//  BuyView.h
//  CopyLoveFreshBeen
//
//  Created by way on 16/7/6.
//  Copyright © 2016年 way. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodsModel.h"

typedef void (^ClickAddShopCarBlock)(UIImageView * image);

@protocol AddShopCarDelegate <NSObject>

-(void)addBtnClickWithGoodsName:(NSString *)name;

@end

@interface BuyView : UIView

@property (strong,nonatomic) GoodsModel * model;

@property (assign,nonatomic) id <AddShopCarDelegate> delegate;

@property (nonatomic, copy) ClickAddShopCarBlock clickAddShopCarBlock;
- (void)ClickAddShopCarBlock:(ClickAddShopCarBlock)block;

@end
