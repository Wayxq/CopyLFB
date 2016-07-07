//
//  AnimationViewController.m
//  CopyLoveFreshBeen
//
//  Created by way on 16/7/7.
//  Copyright © 2016年 way. All rights reserved.
//

#import "AnimationViewController.h"

@interface AnimationViewController ()

@property (strong,nonatomic) NSMutableArray * animationLayers;

@end

@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)addProductAnimation:(UIImageView *)imageView{
    
    if (self.animationLayers == nil) {
        self.animationLayers = [NSMutableArray new];
    }
    
    CGRect frame = [imageView convertRect:imageView.bounds toView:self.view];
    CALayer * transitionLayer = [CALayer new];
    transitionLayer.frame = frame;
    transitionLayer.contents = imageView.layer.contents;
    [self.view.layer addSublayer:transitionLayer];
    [self.animationLayers addObject:transitionLayer];
    
    CGPoint p1 = transitionLayer.position;
    CGPoint p3 = CGPointMake(self.view.width - self.view.width / 4 - self.view.width / 8 -6, self.view.layer.bounds.size.height - 40);
    
    CAKeyframeAnimation * positionAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, p1.x, p1.y);
    CGPathAddCurveToPoint(path, nil, p1.x, p1.y, p3.x, p1.y, p3.x + 30, p3.y);
    positionAnimation.path = path;
    
    CABasicAnimation * opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue = [NSNumber numberWithFloat:1];
    opacityAnimation.toValue = [NSNumber numberWithFloat:0.9];
    opacityAnimation.fillMode = kCAFillModeForwards;
    opacityAnimation.removedOnCompletion = true;
    
    CABasicAnimation * transformAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    transformAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    transformAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.2, 0.2, 1)];
    
    CAAnimationGroup * groupAnimation = [[CAAnimationGroup alloc] init];
    groupAnimation.animations = @[positionAnimation,transformAnimation,opacityAnimation];
    groupAnimation.duration = 0.8;
    groupAnimation.delegate = self;
    [transitionLayer addAnimation:groupAnimation forKey:@"cartParabola"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
    if (self.animationLayers.count > 0) {
        CALayer * transitionLayer = self.animationLayers[0];
        transitionLayer.hidden = true;
        [transitionLayer removeFromSuperlayer];
        [self.animationLayers removeObjectAtIndex:0];
        [self.view.layer removeAnimationForKey:@"cartParabola"];
    }
}



@end
