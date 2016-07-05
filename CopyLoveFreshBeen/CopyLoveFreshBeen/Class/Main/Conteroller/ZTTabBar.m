//
//  ZTTabBar.m
//  SinaWeibo
//
//  Created by user on 15/10/16.
//  Copyright © 2015年 ZT. All rights reserved.
//

#import "ZTTabBar.h"

@interface ZTTabBar ()

@property (nonatomic, weak) UIButton *plusBtn;

@end

@implementation ZTTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIButton *plusBtn = [[UIButton alloc] init];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];

        plusBtn.size = plusBtn.currentBackgroundImage.size;
        [plusBtn addTarget:self action:@selector(plusBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:plusBtn];
        self.plusBtn = plusBtn;
    }
    return self;
}

/**
 *  加号按钮点击
 */
- (void)plusBtnClick:(UIButton *)btn
{
    
    CAKeyframeAnimation * bounceAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    bounceAnimation.values = @[@1.0 ,@1.4, @0.9, @1.15, @0.95, @1.02, @1.0];
    bounceAnimation.duration = 0.6;
    bounceAnimation.calculationMode = kCAAnimationCubic;
    [btn.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    
    // 通知代理
    if ([self.delegate respondsToSelector:@selector(tabBarDidClickPlusButton:)]) {
        [self.delegate tabBarDidClickPlusButton:self];
    }
}

/**
 *  想要重新排布系统控件subview的布局，推荐重写layoutSubviews，在调用父类布局后重新排布。
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 1.设置加号按钮的位置
    self.plusBtn.centerX = self.width*0.5;
    self.plusBtn.centerY = self.height*0.5;
    
    // 2.设置其他tabbarButton的frame
    CGFloat tabBarButtonW = self.width / 5;
    CGFloat tabBarButtonIndex = 0;
    for (UIButton *child in self.subviews) {
        Class class = NSClassFromString(@"UITabBarButton");
        if ([child isKindOfClass:class]) {
            
            [child addTarget:self action:@selector(addAnimation:) forControlEvents:UIControlEventTouchUpInside];
            
            // 设置x
            child.x = tabBarButtonIndex * tabBarButtonW;
            // 设置宽度
            child.width = tabBarButtonW;
            // 增加索引
            tabBarButtonIndex++;
            if (tabBarButtonIndex == 2) {
                tabBarButtonIndex++;
            }
        }
    }
}

-(void)addAnimation:(UIButton *)btn{
    
    CAKeyframeAnimation * bounceAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    bounceAnimation.values = @[@1.0 ,@1.4, @0.9, @1.15, @0.95, @1.02, @1.0];
    bounceAnimation.duration = 0.6;
    bounceAnimation.calculationMode = kCAAnimationCubic;
    [btn.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
}

-(void)addAnimationWith:(UIView *)child{
    
        CAKeyframeAnimation * bounceAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
        bounceAnimation.values = @[@1.0 ,@1.4, @0.9, @1.15, @0.95, @1.02, @1.0];
        bounceAnimation.duration = 0.6;
        bounceAnimation.calculationMode = kCAAnimationCubic;
        [child.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
}

@end
