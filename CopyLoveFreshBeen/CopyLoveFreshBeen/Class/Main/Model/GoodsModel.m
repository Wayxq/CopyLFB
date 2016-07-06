//
//  GoodsModel.m
//  CopyLoveFreshBeen
//
//  Created by way on 16/7/6.
//  Copyright © 2016年 way. All rights reserved.
//

#import "GoodsModel.h"
#import "MJExtension.h"

@implementation GoodsModel

+ (instancetype)cellModelWithDict:(NSDictionary *)dict
{
    GoodsModel *model = [[self alloc] init];
    [model mj_setKeyValues:dict];
    model.idd = dict[@"id"];
    return model;
}

@end
