//
//  TwoViewController.m
//  CopyLoveFreshBeen
//
//  Created by way on 16/7/11.
//  Copyright © 2016年 way. All rights reserved.
//

#import "TwoViewController.h"
#import "CategoryTableViewCell.h"
#import "UIColor+HexCode.h"
#import "ProductTableViewController.h"
static int number;
@interface TwoViewController ()<UITableViewDelegate,UITableViewDataSource,CategoryTableViewSelectSection>

@property (strong,nonatomic) UITableView * horizontalTableView;
@property (strong,nonatomic) ProductTableViewController * verticalTableView;

@property (retain,nonatomic) NSMutableArray * dataSourceArr;

@property (strong,nonatomic) UIButton * threeBtn;

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
    
    self.verticalTableView = [[ProductTableViewController alloc] initWithStyle:UITableViewStylePlain];
    self.verticalTableView.cDelegate = self;
    self.verticalTableView.view.frame = CGRectMake(ScreenWidth * 0.25, 64, ScreenWidth - ScreenWidth * 0.25, ScreenHeight);
    [self addChildViewController:self.verticalTableView];
    [self.view addSubview:self.verticalTableView.view];
    
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
    
//    number ++;
    
    CategoryTableViewCell * cell = [CategoryTableViewCell cellWithTableView:tableView];

    
    if (number == 1) {
        if (indexPath.row == 0) {
            self.threeBtn = cell.nameLabel;
        }
    }
    
    NSDictionary * dic = self.dataSourceArr[indexPath.row];
    
    cell.block = ^(UIButton * btn){
        
        NSIndexPath *indexpath = [NSIndexPath indexPathForRow:0 inSection:btn.tag];
        
        [self.verticalTableView.tableView scrollToRowAtIndexPath:indexpath atScrollPosition:UITableViewScrollPositionTop animated:YES];
        
        NSLog(@"%@",btn.titleLabel.text);
        
//        if (self.threeBtn) {
//            self.threeBtn.selected = NO;
//        }
//        
//        btn.selected = YES;
//        
//        self.threeBtn = btn;
//        
//        [self.horizontalTableView reloadData];
        
    };

    cell.dict = dic;
    
    cell.nameLabel.tag = indexPath.row;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSourceArr.count;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"1");
}

-(void)categoryTableViewSelectSection:(NSInteger )section{
    
    NSIndexPath *indexPath =[NSIndexPath indexPathForRow:section inSection:0];
    [self.horizontalTableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
}

@end
