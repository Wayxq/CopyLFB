//
//  HomeModel.h
//  CopyLoveFreshBeen
//
//  Created by way on 16/7/1.
//  Copyright © 2016年 way. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeModel : NSObject // 抽奖，秒杀，抢红包，风暴团

@property (copy,nonatomic) NSString * idd;

@property (copy,nonatomic) NSString * name;

@property (copy,nonatomic) NSString * img;

@property (copy,nonatomic) NSString * topimg;

@property (copy,nonatomic) NSString * jptype;

@property (copy,nonatomic) NSString * trackid;

@property (copy,nonatomic) NSString * mimg;

@property (copy,nonatomic) NSString * customURL;

+ (instancetype)cellModelWithDict:(NSDictionary *)dict;

@end
