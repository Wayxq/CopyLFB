//
//  AnimationViewController.m
//  CopyLoveFreshBeen
//
//  Created by way on 16/7/7.
//  Copyright © 2016年 way. All rights reserved.
//

#import "AnimationViewController.h"
#import "AddressViewController.h"
#import "SearchViewController.h"
#import "NavigationTitleView.h"

@interface AnimationViewController ()

@property (strong,nonatomic) NSMutableArray * animationLayers;

@end

@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self buildNav];
    
}

-(void)buildNav{
    
    NavigationTitleView * titleView = [[NavigationTitleView alloc] init];
    [titleView setTitle:@"人民大会堂"];
    titleView.frame = CGRectMake(0, 0, titleView.adressWidth, 30);
    self.navigationItem.titleView = titleView;
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(titleViewTap)];
    [self.navigationItem.titleView addGestureRecognizer:tap];
    
    UIImage * leftImg = [UIImage imageNamed:@"icon_black_scancode"];
    UIBarButtonItem * left = [[UIBarButtonItem alloc] initWithImage:[leftImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonItemClick)];
    
    UIImage * rightImg = [UIImage imageNamed:@"icon_search"];
    UIBarButtonItem * right = [[UIBarButtonItem alloc] initWithImage:[rightImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonItemClick)];
    
    self.navigationItem.leftBarButtonItem = left;
    self.navigationItem.rightBarButtonItem = right;
}


-(void)leftBarButtonItemClick{
    
    NSLog(@"扫一扫");
}

-(void)rightBarButtonItemClick{
    
    SearchViewController * vc = [[SearchViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)titleViewTap{
    
    AddressViewController * vc = [[AddressViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
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
