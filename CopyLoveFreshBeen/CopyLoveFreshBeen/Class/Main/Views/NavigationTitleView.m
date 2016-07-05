//
//  NavigationTitleView.m
//  CopyLoveFreshBeen
//
//  Created by way on 16/7/4.
//  Copyright © 2016年 way. All rights reserved.
//

#import "NavigationTitleView.h"

@interface NavigationTitleView ()

@property (strong,nonatomic) UILabel * toLabel;
@property (strong,nonatomic) UILabel * titleLabel;
@property (strong,nonatomic) UIImageView * arrowImgV;

@end

@implementation NavigationTitleView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self buildViews];
    }
    return self;
}

-(void)buildViews{
    
    self.toLabel = [[UILabel alloc] init];
    [self addSubview:_toLabel];
    _toLabel.textColor = [UIColor blackColor];
    _toLabel.backgroundColor = [UIColor clearColor];
    _toLabel.layer.borderWidth = 0.5;
    _toLabel.layer.borderColor = [UIColor blackColor].CGColor;
    _toLabel.font = [UIFont systemFontOfSize:10];
    _toLabel.text = @"配送至";
    _toLabel.textAlignment = NSTextAlignmentCenter;
    [_toLabel sizeToFit];
    _toLabel.frame = CGRectMake(0, 4, _toLabel.width, _toLabel.height);
    
    
    self.titleLabel = [[UILabel alloc] init];
    [self addSubview:_titleLabel];
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.font = [UIFont systemFontOfSize:15];
    [_titleLabel sizeToFit];
    _titleLabel.frame = CGRectMake(CGRectGetMaxX(_toLabel.frame)+4, (self.height-_titleLabel.height)/2, _titleLabel.width, _titleLabel.height);
    
    
    self.arrowImgV = [[UIImageView alloc] init];
    [self addSubview:_arrowImgV];
    _arrowImgV.image = [UIImage imageNamed:@"icon_down_arrow"];
    
}

-(void)setTitle:(NSString *)title{
    
    _titleLabel.text = title;
    [_titleLabel sizeToFit];
    _titleLabel.frame = CGRectMake(CGRectGetMaxX(_toLabel.frame)+4, (self.height-_titleLabel.height)/2, _titleLabel.width, _titleLabel.height);
    _arrowImgV.frame = CGRectMake(CGRectGetMaxX(_titleLabel.frame)+4, (self.height -6)/2, 10, 6);
    
    self.titleLabel.centerY = self.arrowImgV.centerY = self.toLabel.centerY;
    
    self.adressWidth = CGRectGetMaxX(_arrowImgV.frame);
}



@end
