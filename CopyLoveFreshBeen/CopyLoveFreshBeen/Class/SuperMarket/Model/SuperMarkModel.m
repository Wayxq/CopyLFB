
//
//  SuperMarkModel.m
//  CopyLoveFreshBeen
//
//  Created by way on 16/7/12.
//  Copyright © 2016年 way. All rights reserved.
//

#import "SuperMarkModel.h"
#import "MJExtension.h"

@implementation SuperMarkModel
+ (instancetype)cellModelWithDict:(NSDictionary *)dict
{
    SuperMarkModel *model = [[self alloc] init];
    [model mj_setKeyValues:dict];
    return model;
}
@end
