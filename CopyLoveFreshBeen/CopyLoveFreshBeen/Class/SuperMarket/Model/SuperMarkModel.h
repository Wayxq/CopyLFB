//
//  SuperMarkModel.h
//  CopyLoveFreshBeen
//
//  Created by way on 16/7/12.
//  Copyright © 2016年 way. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SuperMarkModel : NSObject

@property (strong,nonatomic) NSDictionary * products;
@property (strong,nonatomic) NSArray * categories;

+ (instancetype)cellModelWithDict:(NSDictionary *)dict;

@end
