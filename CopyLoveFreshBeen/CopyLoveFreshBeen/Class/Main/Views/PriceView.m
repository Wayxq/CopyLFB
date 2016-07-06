//
//  PriceView.m
//  CopyLoveFreshBeen
//
//  Created by way on 16/7/6.
//  Copyright © 2016年 way. All rights reserved.
//

#import "PriceView.h"
#import "UIColor+HexCode.h"

@interface PriceView ()

@property (strong,nonatomic) UILabel * nowPriceLabel;

@end

@implementation PriceView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self initViews];
    }
    return self;
}

-(void)initViews{
    
    self.nowPriceLabel = [[UILabel alloc] init];
    self.originalPriceLabel = [[UILabel alloc] init];
    [self addSubview:self.nowPriceLabel];
    [self addSubview:self.originalPriceLabel];
    
    _nowPriceLabel.font = [UIFont systemFontOfSize:14];
    _nowPriceLabel.textColor = [UIColor redColor];
    [_nowPriceLabel sizeToFit];
    
    _originalPriceLabel.font = [UIFont systemFontOfSize:14];
    _originalPriceLabel.textColor = [UIColor colorWithRed:80/255 green:80/255 blue:80/255 alpha:1];
}

-(void)setNowStr:(NSString *)nowStr{
    
    [self.nowPriceLabel setText:nowStr];
    [self.nowPriceLabel sizeToFit];
    
    self.originalPriceLabel.frame = CGRectMake(CGRectGetMaxX(self.nowPriceLabel.frame)+3, self.nowPriceLabel.y, 50, self.nowPriceLabel.height);
}

@end
