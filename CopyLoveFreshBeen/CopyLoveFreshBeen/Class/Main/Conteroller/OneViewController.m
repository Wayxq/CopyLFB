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

@interface OneViewController ()

@property (strong,nonatomic) NSMutableArray * fourDataArr; // 四个按钮
@property (strong,nonatomic) NSMutableArray * scrollDataArr; // 轮播

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
    
    [self initScrollView];

    
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
}

-(void)initScrollView{
    
    PageScrollView * pageS = [[PageScrollView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenWidth * 0.31)];
    pageS.dataArr = self.scrollDataArr;
    [pageS buildPageScrollViewWithModel:self.scrollDataArr andCount:self.scrollDataArr.count];
    [self.view addSubview:pageS];
    
//    pageS.backgroundColor = [UIColor redColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
