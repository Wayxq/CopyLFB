
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
+ (instancetype)cellModelWithDict:(NSMutableArray *)dict
{
    SuperMarkModel *model = [[self alloc] init];
    [model mj_setKeyValues:dict];
    
    model.products = dict;
    
    return model;
}



@end
