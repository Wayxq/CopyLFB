//
//  StartPageViewController.m
//  CopyLoveFreshBeen
//
//  Created by way on 16/6/30.
//  Copyright © 2016年 way. All rights reserved.
//

#import "StartPageViewController.h"
#import "StartPagrCollectionViewCell.h"

@interface StartPageViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (strong,nonatomic) UICollectionView * collectionView;
@property (strong,nonatomic) UIPageControl * pageControl;

@property (strong,nonatomic) NSArray * imageArr;

@end

@implementation StartPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [[NSUserDefaults standardUserDefaults] setObject:@"isFristOpenApp" forKey:@"isFristOpenApp"];
    
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.itemSize = ScreenBounds.size;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:ScreenBounds collectionViewLayout:flowLayout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.showsHorizontalScrollIndicator = false;
    _collectionView.showsVerticalScrollIndicator = false;
    _collectionView.pagingEnabled = true;
    _collectionView.bounces = false;
    [_collectionView registerClass:[StartPagrCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([StartPagrCollectionViewCell class])];
    [self.view addSubview:_collectionView];
    
    self.imageArr = @[@"guide_40_1",@"guide_40_2",@"guide_40_3",@"guide_40_4",];
    
    UIPageControl * pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, ScreenHeight - 50, ScreenWidth, 20)];
    self.pageControl = pageControl;
    [self.view addSubview:pageControl];
    pageControl.numberOfPages = self.imageArr.count;
    pageControl.currentPage = 0;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _imageArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    StartPagrCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([StartPagrCollectionViewCell class]) forIndexPath:indexPath];
    
        NSString * imageName = self.imageArr[indexPath.row];
        cell.bgImage = [UIImage imageNamed:imageName];
        if (self.imageArr.count - indexPath.row == 1) {
            [cell setNextBtnHidden:false];
        }else{
            [cell setNextBtnHidden:true];
        }
    
    return cell;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    self.pageControl.currentPage = ceilf(scrollView.contentOffset.x / ScreenWidth + 0.5)-1;
    NSLog(@"%f / %f",scrollView.contentOffset.x,ScreenWidth+0.5);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
