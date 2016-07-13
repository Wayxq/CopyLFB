//
//  SuperMarkModel.h
//  CopyLoveFreshBeen
//
//  Created by way on 16/7/12.
//  Copyright © 2016年 way. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GoodsModel.h"

@interface SuperMarkModel : NSObject

@property (copy,nonatomic) NSString * idd;

@property (strong,nonatomic) NSMutableArray * products;

+ (instancetype)cellModelWithDict:(NSMutableArray *)dict;

@end
