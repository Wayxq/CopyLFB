//
//  ImageTextView.m
//  CopyLoveFreshBeen
//
//  Created by way on 16/7/5.
//  Copyright © 2016年 way. All rights reserved.
//

#import "ImageTextView.h"
#import "UIImageView+WebCache.h"

@interface ImageTextView ()

@property (strong,nonatomic) UIImageView * imageView;
@property (strong,nonatomic) UILabel * textLabel;

@end

@implementation ImageTextView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self initViews];
    }
    return self;
}

-(void)initViews{
    
    self.imageView = [UIImageView new];
    _imageView.userInteractionEnabled = false;
    _imageView.contentMode = UIViewContentModeScaleAspectFit                                                                       ;
    [self addSubview:_imageView];
    self.imageView.centerX = self.centerX;
    
    self.textLabel = [UILabel new];
    _textLabel.textAlignment = NSTextAlignmentCenter;
    _textLabel.font = [UIFont systemFontOfSize:12];
    _textLabel.textColor = [UIColor blackColor];
    _textLabel.userInteractionEnabled = false;
    [self addSubview:_textLabel];
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.imageView.frame = self.bounds;
    self.imageView.y = self.imageView.y - 10;
    self.textLabel.frame = CGRectMake(0, self.imageView.height-20, _imageView.width, 20);
}

-(void)setModel:(HomeModel *)model{
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",model.img]] placeholderImage:[UIImage imageNamed:@"v2_home_cycle_dot_selected"]];
    
    [self.textLabel setText:[NSString stringWithFormat:@"%@",model.name]];
}

@end
