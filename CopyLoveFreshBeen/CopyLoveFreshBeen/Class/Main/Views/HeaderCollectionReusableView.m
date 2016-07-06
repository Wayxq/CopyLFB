//
//  HeaderCollectionReusableView.m
//  CopyLoveFreshBeen
//
//  Created by way on 16/7/6.
//  Copyright © 2016年 way. All rights reserved.
//

#import "HeaderCollectionReusableView.h"

@implementation HeaderCollectionReusableView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 200, 20)];
        [self addSubview:label];
        self.label = label;
        label.textAlignment = NSTextAlignmentLeft;
        [label setText:@"新鲜热卖"];
        [label setFont:[UIFont systemFontOfSize:14]];
        [label setTextColor:[UIColor grayColor]];
        
    }
    return self;
}

@end
