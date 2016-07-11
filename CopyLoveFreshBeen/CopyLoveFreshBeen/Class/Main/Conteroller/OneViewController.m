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


#import "ImageTextView.h"
#import "UIImageView+WebCache.h"

#import "HomeCollectionViewCell.h"
#import "GoodsModel.h"
#import "HeaderCollectionReusableView.h"
#import "UIColor+HexCode.h"

@interface OneViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (strong,nonatomic) NSMutableArray * fourDataArr; // 四个按钮
@property (strong,nonatomic) NSMutableArray * scrollDataArr; // 轮播
@property (strong,nonatomic) UICollectionView * collectionView;
@property (strong,nonatomic) UISearchBar * searchBar;

@property (strong,nonatomic) NSMutableArray * singleCellArr;
@property (strong,nonatomic) NSMutableArray * complexCellArr;

@property (strong,nonatomic) UIView * headerView;

@end

@implementation OneViewController

-(NSMutableArray *)singleCellArr{
    
    if (!_singleCellArr) {
        _singleCellArr = [NSMutableArray array];
    }
    return _singleCellArr;
}

-(NSMutableArray *)complexCellArr{
    
    if (!_complexCellArr) {
        _complexCellArr = [NSMutableArray array];
    }
    return _complexCellArr;
}

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
    
    [self buildCollectionView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(goodsInventoryProblem:) name:@"HomeGoodsInventoryProblem" object:nil];
    
}

-(void)dealDataSouce{
    
    NSString * path = [[NSBundle mainBundle] pathForResource:@"首页焦点按钮" ofType:nil];
    NSData * data = [NSData dataWithContentsOfFile:path];
    NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
    NSArray * fourArr = dict[@"data"][@"icons"];
    NSArray * scrollArr = dict[@"data"][@"focus"];
    NSArray * singleArr = dict[@"data"][@"activities"];
    
    [fourArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        HomeModel * model = [HomeModel cellModelWithDict:obj];
        [self.fourDataArr addObject:model];
    }];
    
    [scrollArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        HomeModel * model = [HomeModel cellModelWithDict:obj];
        [self.scrollDataArr addObject:model];
    }];
    
    [singleArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        HomeModel * model = [HomeModel cellModelWithDict:obj];
        [self.singleCellArr addObject:model];
    }];
    
    // 首页商品
    NSString * goodsPath = [[NSBundle mainBundle] pathForResource:@"首页新鲜热卖" ofType:nil];
    NSData * goodsData = [NSData dataWithContentsOfFile:goodsPath];
    NSDictionary * goodsDict = [NSJSONSerialization JSONObjectWithData:goodsData options:NSJSONReadingAllowFragments error:nil];
    NSArray * goodsArr = goodsDict[@"data"];
    
    [goodsArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        GoodsModel * model = [GoodsModel cellModelWithDict:obj];
        [self.complexCellArr addObject:model];
    }];
}

-(void)goodsInventoryProblem:(NSNotification *)noti{
    
    NSLog(@"%@ 库存不足啦~",noti.object);
}


-(void)initScrollView{
    
    UIView * headerView = [UIView new];
    self.headerView = headerView;
    headerView.backgroundColor = [UIColor whiteColor];
    PageScrollView * pageS = [[PageScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenWidth * 0.31)];
    pageS.dataArr = self.scrollDataArr;
    [pageS buildPageScrollViewWithModel:self.scrollDataArr andCount:self.scrollDataArr.count];
    [headerView addSubview:pageS];
    
    [pageS returnText:^(NSInteger index) {
        NSLog(@"%ld",(long)index);
    }];
    
    for (int i = 0; i < 4; i ++) {
        
        CGFloat w = (ScreenWidth - 50)/4;
        CGFloat x = 10 + (i * w) + 10*i;
        
        ImageTextView * view = [[ImageTextView alloc] init];
        
        HomeModel * model = self.fourDataArr[i];
        view.model = model;
        [headerView addSubview:view];
        view.frame = CGRectMake(10+x, CGRectGetMaxY(pageS.frame)+5, 70, 70);
        view.tag = i;
        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hotViewTap:)];
        [view addGestureRecognizer:tap];
    }
    
    headerView.frame = CGRectMake(0, -(pageS.height + 75 + 5), ScreenWidth, pageS.height + 75);
}

-(void)hotViewTap:(UITapGestureRecognizer *)tap{
    
    HomeModel * model = self.fourDataArr[tap.view.tag];
    NSLog(@"%@",model.name);
}



-(void)buildCollectionView{
    
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumInteritemSpacing = 5;
    flowLayout.minimumLineSpacing = 8;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) collectionViewLayout:flowLayout];
    _collectionView.backgroundColor = [UIColor colorFromHexString:@"f4f4f4"];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self.view addSubview:self.collectionView];
    [_collectionView registerClass:[HomeCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([HomeCollectionViewCell class])];
    [_collectionView registerClass:[HeaderCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([HeaderCollectionReusableView class])];
    
    [self.collectionView addSubview:_headerView];
    self.collectionView.contentInset = UIEdgeInsetsMake(CGRectGetHeight(_headerView.frame)+5, 0, 0, 0);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UICollectionView Delegate, DataSouce

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    if (section == 0) {
        return self.singleCellArr.count;
    }else if(section == 1) {
        return self.complexCellArr.count;
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    HomeCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([HomeCollectionViewCell class]) forIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        HomeModel * model = self.singleCellArr[indexPath.row];
        cell.model = model;
        return cell;
    }else if (indexPath.section == 1){
        GoodsModel * model = self.complexCellArr[indexPath.row];
        cell.goodsModel = model;
        
        [cell.buyView ClickAddShopCarBlock:^(UIImageView *image) {
            NSLog(@"%@",image);
            [self addProductAnimation:image];
        }];
        
        return cell;
    }
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 2;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    CGSize size = CGSizeZero;
    if (indexPath.section == 0) {
        size = CGSizeMake(ScreenWidth - 20, 140);
    }else if (indexPath.section ==1){
        size = CGSizeMake((ScreenWidth - 20) * 0.5 - 4, 250);
    }
    return size;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(0, 10, 0, 10);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    HeaderCollectionReusableView * view = nil;
    if (kind == UICollectionElementKindSectionHeader) {
        view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([HeaderCollectionReusableView class]) forIndexPath:indexPath];
    }
    return view;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    CGSize size;
    
    if (section == 0) {
        size = CGSizeMake(ScreenWidth, 0);
    }else if(section == 1){
        size = CGSizeMake(ScreenWidth, 20);
    }
    return size;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
