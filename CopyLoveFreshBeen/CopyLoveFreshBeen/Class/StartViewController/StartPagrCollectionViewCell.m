//
//  StartPagrCollectionViewCell.m
//  CopyLoveFreshBeen
//
//  Created by way on 16/6/30.
//  Copyright © 2016年 way. All rights reserved.
//

#import "StartPagrCollectionViewCell.h"

@interface StartPagrCollectionViewCell()

@property (strong,nonatomic) UIImageView * imageV;
@property (strong,nonatomic) UIButton * nextBtn;

@end

@implementation StartPagrCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self initViews];
    }
    return self;
}

-(void)initViews{
    
    UIImageView * imageV = [[UIImageView alloc] initWithFrame:ScreenBounds];
    [self.contentView addSubview:imageV];
    self.imageV = imageV;
    imageV.userInteractionEnabled = YES;
    
    UIButton * nextBtn = [[UIButton alloc] initWithFrame:CGRectMake((ScreenWidth - 100) * 0.5, ScreenHeight - 110, 100, 33)];
    [imageV addSubview:nextBtn];
    [nextBtn setHidden:true];
    [nextBtn setBackgroundImage:[UIImage imageNamed:@"icon_next"] forState:UIControlStateNormal];
    [nextBtn addTarget:self action:@selector(nextBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.nextBtn = nextBtn;
}

-(void)setBgImage:(UIImage *)bgImage{
    
    self.imageV.image = bgImage;
}

-(void)setNextBtnHidden:(BOOL)hidden{
    [self.nextBtn setHidden:hidden];
}

-(void)nextBtnClick:(UIButton *)btn{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:StartPageSussess object:nil];
}



@end
