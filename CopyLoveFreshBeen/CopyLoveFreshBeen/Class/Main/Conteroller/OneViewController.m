//
//  OneViewController.m
//  CopyLoveFreshBeen
//
//  Created by way on 16/6/30.
//  Copyright © 2016年 way. All rights reserved.
//

#import "OneViewController.h"
#import "HomeModel.h"
#import "PageScrollView.h"
#import "Masonry.h"
#import "NavigationTitleView.h"
#import "AddressViewController.h"
#import "ImageTextView.h"
#import "UIImageView+WebCache.h"

@interface OneViewController ()

@property (strong,nonatomic) NSMutableArray * fourDataArr; // 四个按钮
@property (strong,nonatomic) NSMutableArray * scrollDataArr; // 轮播
@property (strong,nonatomic) UICollectionView * collectionView;
@property (strong,nonatomic) UISearchBar * searchBar;

@end

@implementation OneViewController

-(NSMutableArray *)fourDataArr{
    
    if (!_fourDataArr) {
        _fourDataArr = [NSMutableArray array];
    }
    return _fourDataArr;
}

-(NSMutableArray *)scrollDataArr{
    
    if (!_scrollDataArr) {
        _scrollDataArr = [NSMutableArray array];
    }
    return _scrollDataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self dealDataSouce];
    
    
    
    [self buildNav];

}

-(void)dealDataSouce{
    
    NSString * path = [[NSBundle mainBundle] pathForResource:@"首页焦点按钮" ofType:nil];
    NSData * data = [NSData dataWithContentsOfFile:path];
    NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
    NSArray * fourArr = dict[@"data"][@"icons"];
    NSArray * scrollArr = dict[@"data"][@"focus"];
    
    [fourArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        HomeModel * model = [HomeModel cellModelWithDict:obj];
        [self.fourDataArr addObject:model];
    }];
    
    [scrollArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        HomeModel * model = [HomeModel cellModelWithDict:obj];
        [self.scrollDataArr addObject:model];
        
    }];
    
    [self initScrollView];
}

-(void)initScrollView{
    
//    PageScrollView * pageS = [[PageScrollView alloc] initWithFrame:CGRectMake(0,64, ScreenWidth, ScreenWidth * 0.31)];
//    pageS.dataArr = self.scrollDataArr;
//    [pageS buildPageScrollViewWithModel:self.scrollDataArr andCount:self.scrollDataArr.count];
//    [self.view addSubview:pageS];
//    
//    [pageS returnText:^(NSInteger index) {
//        NSLog(@"%ld",(long)index);
//    }];
    
    
    UIView * aview = [[UIView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, 0)];
    [self.view addSubview:aview];
    
    PageScrollView * pageS = [[PageScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(aview.frame), ScreenWidth, ScreenWidth * 0.31)];
    pageS.dataArr = self.scrollDataArr;
    [pageS buildPageScrollViewWithModel:self.scrollDataArr andCount:self.scrollDataArr.count];
    [self.view addSubview:pageS];
    
    [pageS returnText:^(NSInteger index) {
        NSLog(@"%ld",(long)index);
    }];
    
    
    for (int i = 0; i < 4; i ++) {
        
        CGFloat w = (ScreenWidth - 50)/4;
        CGFloat x = 10 + (i * w) + 10*i;

        ImageTextView * view = [[ImageTextView alloc] init];
        view.backgroundColor = [UIColor cyanColor];
        
        HomeModel * model = self.fourDataArr[i];
        
        view.model = model;
        [self.view addSubview:view];
        
        view.frame = CGRectMake(x, 300, 70, 70);
//        [view mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(@300);
//            make.left.equalTo(@(x));
//            make.height.equalTo(@70);
//            make.width.equalTo(@70);
//        }];
    }

    
//    UIView * caoniam  = [[UIView alloc] initWithFrame:CGRectMake(10, 500, 60, 60)];
//    [self.view addSubview:caoniam];
//    caoniam.backgroundColor = [UIColor cyanColor];
//    
//    UIImageView * asdf = [[UIImageView alloc] initWithFrame:CGRectMake(100, 500, 60, 60)];
//    asdf.contentMode = UIViewContentModeScaleAspectFit;
//    [self.view addSubview:asdf];
//    [asdf sd_setImageWithURL:[NSURL URLWithString:@"http://img01.bqstatic.com/upload/activity/activity_v4_20206_1452163603_icon.jpg"] placeholderImage:[UIImage imageNamed:@""]];
//    
//    asdf.centerX = caoniam.centerX;
    
    
}

-(void)buildNav{
    
    NavigationTitleView * titleView = [[NavigationTitleView alloc] init];
    [titleView setTitle:@"人民大会堂"];
    titleView.frame = CGRectMake(0, 0, titleView.adressWidth, 30);
    self.navigationItem.titleView = titleView;
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(titleViewTap)];
    [self.navigationItem.titleView addGestureRecognizer:tap];
    
}

-(void)titleViewTap{
    
    AddressViewController * vc = [[AddressViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
