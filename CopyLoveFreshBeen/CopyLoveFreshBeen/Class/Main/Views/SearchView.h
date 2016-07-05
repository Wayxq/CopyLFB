//
//  SearchView.h
//  锄禾日当午
//
//  Created by 王奥运 on 16/7/5.
//  Copyright © 2016年 王奥运. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchView : UIView

@property (nonatomic ,assign) CGFloat searchViewHeight;

-(instancetype)initWithFrame:(CGRect)frame WithSearchSecTitle:(NSString *)secTtile andSearchArr:(NSArray *)btnArr;

@end
