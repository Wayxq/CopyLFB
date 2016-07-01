//
//  HomeModel.m
//  CopyLoveFreshBeen
//
//  Created by way on 16/7/1.
//  Copyright © 2016年 way. All rights reserved.
//

#import "HomeModel.h"
#import "MJExtension.h"

@implementation HomeModel

+ (instancetype)cellModelWithDict:(NSDictionary *)dict
{
    HomeModel *model = [[self alloc] init];
    [model mj_setKeyValues:dict];
    model.idd = dict[@"id"];
    return model;
}

@end
