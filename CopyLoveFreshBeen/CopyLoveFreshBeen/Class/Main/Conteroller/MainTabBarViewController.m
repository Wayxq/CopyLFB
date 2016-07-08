//
//  MainTabBarViewController.m
//  CopyLoveFreshBeen
//
//  Created by way on 16/6/30.
//  Copyright © 2016年 way. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
#import "SpecialViewController.h"
#import "ZTNavigationController.h"
#import "ZTTabBar.h"

@interface MainTabBarViewController ()<ZTTabBarDelegate,UITabBarControllerDelegate>
{
    UIViewController * three;
}
@end

@implementation MainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildVc:[[OneViewController alloc] init] title:@"首页" image:@"v2_home" selectedImage:@"v2_home_r" andTag:0];
    [self addChildVc:[[TwoViewController alloc] init] title:@"闪电超市" image:@"v2_order" selectedImage:@"v2_order_r" andTag:1];
    [self addChildVc:[[ThreeViewController alloc] init] title:@"购物车" image:@"shopCart" selectedImage:@"shopCart" andTag:2];
    [self addChildVc:[[FourViewController alloc] init] title:@"我的" image:@"v2_my" selectedImage:@"v2_my_r" andTag:3];
    
    ZTTabBar *tabBar = [[ZTTabBar alloc] init];
    tabBar.delegate = self;
    // KVC：如果要修系统的某些属性，但被设为readOnly，就是用KVC，即setValue：forKey：。
    [self setValue:tabBar forKey:@"tabBar"];
    
    self.delegate = self;
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ShopCarRedHot:) name:@"ShopCarRedHot" object:nil];
}
//
//-(void)setBadgeNumber{
//    
//    for (UINavigationController * obj in self.viewControllers) {
//        for (UIViewController * vc in obj.viewControllers) {
//            if ([vc isKindOfClass:[ThreeViewController class]]) {
//                three = vc;
//            }
//        }
//    }
//    
//    three.tabBarItem.badgeValue = @"3";
//}
//
//-(void)ShopCarRedHot:(NSNotification *)noti{
//    three.tabBarItem.badgeValue = @"7";
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage andTag:(NSInteger)tag
{
//     设置子控制器的文字(可以设置tabBar和navigationBar的文字)
    childVc.title = title;
//    childVc.tabBarItem.badgeValue
//
////    AnimationTabBarItem * item = [[AnimationTabBarItem alloc] initWithTitle:title image:[UIImage imageNamed:image] selectedImage:[UIImage imageNamed:selectedImage]];
////    item.ItemAnimation = [[BounceAnimation alloc] init];
////    childVc.tabBarItem = item;
//    
//    
    // 设置子控制器的tabBarItem图片
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    // 禁用图片渲染
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [childVc.tabBarItem setValue:[NSNumber numberWithInteger:tag] forKey:@"tag"];
    
    // 设置文字的样式
    [childVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : RGBColor(123, 123, 123)} forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor orangeColor]} forState:UIControlStateSelected];

//        childVc.view.backgroundColor = RandomColor; // 这句代码会自动加载主页，消息，发现，我四个控制器的view，但是view要在我们用的时候去提前加载
    
//     为子控制器包装导航控制器
    ZTNavigationController *navigationVc = [[ZTNavigationController alloc] initWithRootViewController:childVc];
    // 添加子控制器
    [self addChildViewController:navigationVc];
    
    //
//    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:childVc];
//    [self addChildViewController:nav];
    
//    [self setBadgeNumber];
}

#pragma ZTTabBarDelegate
- (void)tabBarDidClickPlusButton:(ZTTabBar *)tabBar
{
//    UIViewController *vc = [[UIViewController alloc] init];
//    [self presentViewController:vc animated:YES completion:nil];
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{

    
//    for (UIView * child in tabBarController.tabBar.subviews) {
//        Class class = NSClassFromString(@"UITabBarButton");
//        if ([child isKindOfClass:class]) {
//            
//            CAKeyframeAnimation * bounceAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
//            bounceAnimation.values = @[@1.0 ,@1.4, @0.9, @1.15, @0.95, @1.02, @1.0];
//            bounceAnimation.duration = 0.6;
//            bounceAnimation.calculationMode = kCAAnimationCubic;
//            [child.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
//        }
//    }
}

@end
