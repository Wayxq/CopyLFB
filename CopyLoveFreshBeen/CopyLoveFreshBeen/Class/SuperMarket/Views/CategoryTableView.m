//
//  CategoryTableView.m
//  CopyLoveFreshBeen
//
//  Created by way on 16/7/11.
//  Copyright © 2016年 way. All rights reserved.
//

#import "CategoryTableView.h"
#import "CategoryTableViewCell.h"

@interface CategoryTableView ()<UITableViewDataSource,UITableViewDelegate>

@property (retain,nonatomic) NSMutableArray * dataSourceArr;

@end

@implementation CategoryTableView

-(NSMutableArray *)dataSource{
    if (!_dataSourceArr) {
        _dataSourceArr = [NSMutableArray array];
    }
    return _dataSourceArr;
}

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        [self initDatas];
    }
    return self;
}

-(void)initDatas{
    
    NSString * path = [[NSBundle mainBundle] pathForResource:@"supermarket" ofType:nil];
    NSData * data = [NSData dataWithContentsOfFile:path];
    NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSMutableArray * arr = dict[@"data"][@"categories"];
    self.dataSourceArr = arr;
    
}

-(CategoryTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CategoryTableViewCell * cell = [CategoryTableViewCell cellWithTableView:tableView];
    
    NSDictionary * dic = self.dataSourceArr[indexPath.row];
    
    cell.dict = dic;
    
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 14;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
