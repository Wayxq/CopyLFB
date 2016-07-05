//
//  SearchViewController.m
//  CopyLoveFreshBeen
//
//  Created by 王奥运 on 16/7/5.
//  Copyright © 2016年 way. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchView.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray * arr = @[@"锄禾",@"日党务",@"汗滴禾下土",@"谁知",@"盘中餐餐",@"丽丽",@"皆辛苦",@"窗前",@"明月光",@"疑是地上霜",@"汗滴禾下土",@"丽丽",@"姐",@"辛苦"];
    
    SearchView * searchView = [[SearchView alloc] initWithFrame:CGRectMake(10, 64, ScreenWidth - 20, 100) WithSearchSecTitle:@"热门搜索" andSearchArr:arr];
    searchView.height = searchView.searchViewHeight;
    [self.view addSubview:searchView];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
