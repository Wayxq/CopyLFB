//
//  PageScrollView.h
//  CopyLoveFreshBeen
//
//  Created by way on 16/7/1.
//  Copyright © 2016年 way. All rights reserved.
//
typedef void (^ReturnIndexBlock)(NSInteger index);

#import <UIKit/UIKit.h>
#import "HomeModel.h"

@interface PageScrollView : UIView

@property (strong,nonatomic) NSMutableArray * dataArr;
@property (nonatomic, copy) ReturnIndexBlock returnIndexBlock;

- (void)returnText:(ReturnIndexBlock)block;
-(void)buildPageScrollViewWithModel:(NSMutableArray *)model andCount:(NSInteger)count;

@end
