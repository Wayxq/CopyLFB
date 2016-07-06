//
//  GoodsModel.h
//  CopyLoveFreshBeen
//
//  Created by way on 16/7/6.
//  Copyright © 2016年 way. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodsModel : NSObject

// 商品id
@property (copy,nonatomic) NSString * idd;
// 商品名字
@property (copy,nonatomic) NSString * name;
@property (copy,nonatomic) NSString * brand_id;
// 超市价格
@property (copy,nonatomic) NSString * market_price;
@property (copy,nonatomic) NSString * cid;
@property (copy,nonatomic) NSString * category_id;
// 当前价格
@property (copy,nonatomic) NSString * partner_price;
@property (copy,nonatomic) NSString * brand_name;
@property (copy,nonatomic) NSString * pre_img;

@property (copy,nonatomic) NSString * pre_imgs;
// 参数
@property (copy,nonatomic) NSString * specifics;
@property (copy,nonatomic) NSString * product_id;
@property (copy,nonatomic) NSString * dealer_id;
// 当前价格
@property (copy,nonatomic) NSString * price;
// 库存
@property (assign,nonatomic) NSInteger  number;
// 买一赠一
@property (copy,nonatomic) NSString * pm_desc;
@property (assign,nonatomic) NSInteger had_pm;
// urlStr
@property (copy,nonatomic) NSString * img;
// 是不是精选 0 : 不是, 1 : 是
@property (assign,nonatomic) NSInteger is_xf;
// 记录用户对商品添加次数
@property (assign,nonatomic) NSInteger userBuyNumber;

+ (instancetype)cellModelWithDict:(NSDictionary *)dict;

@end
