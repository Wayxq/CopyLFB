//
//  TabbarBadgeView.m
//  CopyLoveFreshBeen
//
//  Created by way on 16/7/8.
//  Copyright © 2016年 way. All rights reserved.
//

#import "TabbarBadgeView.h"

@interface TabbarBadgeView ()

@property (strong,nonatomic) UIImageView * imageV;
@property (strong,nonatomic) UILabel * badgeLabel;
@property (assign,nonatomic) int number;
@property (strong,nonatomic) NSMutableArray * productArr;


@end

@implementation TabbarBadgeView

-(NSMutableArray *)productArr{
    
    if (!_productArr) {
        _productArr = [NSMutableArray array];
    }
    return _productArr;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initViews];
    }
    return self;
}

+ (TabbarBadgeView *)sharedManager
{
    static TabbarBadgeView *tabbarBadgeView = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        tabbarBadgeView = [[self alloc] init];
    });
    return tabbarBadgeView;
}

-(void)initViews{
    
    self.imageV = [[UIImageView alloc] init];
    _imageV.hidden = true;
    [self addSubview:_imageV];
    _imageV.image = [UIImage imageNamed:@"reddot"];
    
    self.badgeLabel = [[UILabel alloc] init];
    _badgeLabel.font = [UIFont systemFontOfSize:11];
    _badgeLabel.textColor = [UIColor whiteColor];
    _badgeLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_badgeLabel];
}

-(void)layoutSubviews{
    
    self.imageV.frame = self.bounds;
    self.badgeLabel.frame = self.bounds;
}


-(void)addAnimationWith:(UIView *)child{
    
    CAKeyframeAnimation * bounceAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    bounceAnimation.values = @[@1.0 ,@1.4, @0.9, @1.15, @0.95, @1.02, @1.0];
    bounceAnimation.duration = 0.6;
    bounceAnimation.calculationMode = kCAAnimationCubic;
    [child.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
}

-(void)addProductIntoShopCar:(GoodsModel *)model{
    
    self.number ++;
    [self bianbian];
    
    if (self.number != 0) {
        self.imageV.hidden = false;
    }
    
    if (self.number > 99) {
        self.badgeLabel.font = [UIFont systemFontOfSize:9];
    }
    
    for (GoodsModel * cmodel in self.productArr) {
        if (cmodel.idd == model.idd) {
            return;
        }
    }
    [self.productArr addObject:model];
    
    NSLog(@"%@",_productArr);
}

-(void)reduceProductIntoShopCar:(GoodsModel *)model{
    
    if (self.number > 0) {
        self.number --;
    }
    [self bianbian];
    
    if (self.number < 99) {
        self.badgeLabel.font = [UIFont systemFontOfSize:11];
    }
    
    if (self.number == 0) {
        self.imageV.hidden = true;
    }
    
    for (int i = 0; i < self.productArr.count; i ++) {
        GoodsModel * cmodel = self.productArr[i];
        if (cmodel.idd == model.idd) {
            if (cmodel.userBuyNumber == 0) {
                [self.productArr removeObjectAtIndex:i];
            }
        }
    }
    
    NSLog(@"%@",_productArr);
}

-(void)bianbian{
    
    [self addAnimationWith:self];
    
    [self.badgeLabel setText:[NSString stringWithFormat:@"%d",_number]];
}

@end
