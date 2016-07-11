//
//  TwoViewController.m
//  CopyLoveFreshBeen
//
//  Created by way on 16/7/11.
//  Copyright © 2016年 way. All rights reserved.
//

#import "TwoViewController.h"
#import "CategoryTableView.h"
#import "CategoryTableViewCell.h"
#import "UIColor+HexCode.h"

@interface TwoViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) UITableView * horizontalTableView;
@property (strong,nonatomic) UITableView * verticalTableView;

@property (retain,nonatomic) NSMutableArray * dataSourceArr;

@end

@implementation TwoViewController

-(NSMutableArray *)dataSource{
    if (!_dataSourceArr) {
        _dataSourceArr = [NSMutableArray array];
    }
    return _dataSourceArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.horizontalTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth * 0.25, ScreenHeight) style:UITableViewStylePlain];
    self.horizontalTableView.delegate = self;
    self.horizontalTableView.dataSource = self;
    self.horizontalTableView.showsVerticalScrollIndicator = false;
    [self.view addSubview:self.horizontalTableView];
    
    [self initDatas];
}

-(void)initDatas{
    
    NSString * path = [[NSBundle mainBundle] pathForResource:@"supermarket" ofType:nil];
    NSData * data = [NSData dataWithContentsOfFile:path];
    NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSMutableArray * arr = dict[@"data"][@"categories"];
    self.dataSourceArr = arr;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CategoryTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CategoryTableViewCell * cell = [CategoryTableViewCell cellWithTableView:tableView];
    
    NSDictionary * dic = self.dataSourceArr[indexPath.row];
    
    cell.dict = dic;
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSourceArr.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CategoryTableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
//    cell.backgroundColor = [UIColor whiteColor];
//    cell.nameLabel.backgroundColor = [UIColor cyanColor];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
