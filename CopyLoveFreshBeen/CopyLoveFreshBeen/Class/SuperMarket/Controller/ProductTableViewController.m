
//
//  ProductTableViewController.m
//  CopyLoveFreshBeen
//
//  Created by way on 16/7/12.
//  Copyright © 2016年 way. All rights reserved.
//

#import "ProductTableViewController.h"
#import "SuperMarkModel.h"
#import "ProductTableViewCell.h"
#import "UIColor+HexCode.h"

@interface ProductTableViewController ()

@property (strong,nonatomic) NSDictionary * dataSource;
@property (strong,nonatomic) NSMutableArray * categoryArr;
@property(nonatomic, assign)BOOL isScrollUp;
@property(nonatomic, assign)CGFloat lastOffsetY;

@end

@implementation ProductTableViewController

-(NSMutableArray *)categoryArr{
    if (!_categoryArr) {
        _categoryArr = [NSMutableArray array];
    }
    return _categoryArr;
}

-(NSDictionary *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSDictionary dictionary];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initDatas];
    
    _isScrollUp = false;
    _lastOffsetY = 0;
}

-(void)initDatas{
    
    NSString * path = [[NSBundle mainBundle] pathForResource:@"supermarket" ofType:nil];
    NSData * data = [NSData dataWithContentsOfFile:path];
    NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
    NSDictionary * arr = dict[@"data"][@"products"];
    self.dataSource = arr;
    
    NSMutableArray * arrr = dict[@"data"][@"categories"];
    self.categoryArr = arrr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.categoryArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSDictionary * dic = self.categoryArr[section];
    NSString * idd = dic[@"id"];
    NSArray * arr = self.dataSource[idd];
    return arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ProductTableViewCell * cell = [ProductTableViewCell cellWithTableView:tableView];
    
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView * bgView = [[UIView alloc] init];
    bgView.backgroundColor = [UIColor colorFromHexString:@"f4f4f4"];
    
    UILabel * titleName = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 200, 25)];
    
    titleName.font = [UIFont systemFontOfSize:13];
    
    NSDictionary * dic = self.categoryArr[section];
    NSString * titlee = dic[@"name"];
    
    titleName.text = titlee;
    
    [bgView addSubview:titleName];
    return bgView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 25;
}

//-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    
//    NSIndexPath *path =  [self.tableView indexPathForRowAtPoint:CGPointMake(scrollView.contentOffset.x, scrollView.contentOffset.y)];
//    
//    NSLog(@"这是第%li section",(long)path.section);
//}

-(void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(nonnull UIView *)view forSection:(NSInteger)section{
    
    if (self.cDelegate && [self.cDelegate respondsToSelector:@selector(didEndDisplayingHeaderView:)] && _isScrollUp && self.tableView.isDragging) {
        [self.cDelegate didEndDisplayingHeaderView:section];
    }
}

-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(nonnull UIView *)view forSection:(NSInteger)section{
    
    if (self.cDelegate && [self.cDelegate respondsToSelector:@selector(willDisplayHeaderView:)] != _isScrollUp && self.tableView.isDragging) {
        [self.cDelegate willDisplayHeaderView:section];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
//    NSLog(@"_lastOffsetY : %f,scrollView.contentOffset.y : %f", _lastOffsetY, scrollView.contentOffset.y);
    _isScrollUp = _lastOffsetY < scrollView.contentOffset.y;
    _lastOffsetY = scrollView.contentOffset.y;
//    NSLog(@"______lastOffsetY: %f", _lastOffsetY);
}





@end
