//
//  PageScrollView.m
//  CopyLoveFreshBeen
//
//  Created by way on 16/7/1.
//  Copyright © 2016年 way. All rights reserved.
//

#import "PageScrollView.h"
#import "UIImageView+WebCache.h"

@interface PageScrollView()<UIScrollViewDelegate>

@property (weak,nonatomic) NSTimer * timer;
@property (strong,nonatomic) UIScrollView * scrollView;
@property (strong,nonatomic) UIPageControl * pageControl;

@end

@implementation PageScrollView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self buildScrollView];
        [self buildPageControl];
        
    }
    return self;
}

-(void)buildScrollView{
    
    self.scrollView = [[UIScrollView alloc] init];
    _scrollView.bounces = false;
    _scrollView.showsHorizontalScrollIndicator = false;
    _scrollView.showsHorizontalScrollIndicator = false;
    _scrollView.pagingEnabled = true;
    _scrollView.delegate = self;
    [self addSubview:_scrollView];
    
    for (int i = 0; i < 3; i ++) {
        UIImageView * imageView = [UIImageView new];
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewClick:)];
        [imageView addGestureRecognizer:tap];
        [_scrollView addSubview:imageView];
    }
}

-(void)buildPageControl{
    
    self.pageControl = [UIPageControl new];
    _pageControl.pageIndicatorTintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"v2_home_cycle_dot_normal"]];
    _pageControl.currentPageIndicatorTintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"v2_home_cycle_dot_selected"]];
    [self addSubview:_pageControl];
    
}

-(void)startTimer{
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    _timer = timer;
}

-(void)stopTimer{
    
    [_timer invalidate];
    _timer = nil;
}

-(void)timerAction{
    
    [self.scrollView setContentOffset:CGPointMake(2.0*_scrollView.frame.size.width, 0) animated:true];
}

-(void)returnText:(ReturnIndexBlock)block{
    self.returnIndexBlock = block;
}

-(void)imageViewClick:(UITapGestureRecognizer *)tap{
    
    if (self.returnIndexBlock) {
        self.returnIndexBlock(tap.view.tag);
    }
}

-(void)buildPageScrollViewWithModel:(NSMutableArray *)model andCount:(NSInteger)count{
    
    self.pageControl.numberOfPages = count;
    self.pageControl.currentPage = 0;
    
    [self updatePageScrollView];
    [self startTimer];
    
}

-(void)updatePageScrollView{
    
    for (int i = 0; i < _scrollView.subviews.count; i ++) {
        UIImageView * imageView = _scrollView.subviews[i];
        NSInteger index = _pageControl.currentPage;
        
        if (i == 0) {
            index--;
        }else if (i == 2){
            index++;
        }
        
        if (index < 0) {
            index = _pageControl.numberOfPages - 1;
        }else if (index >= _pageControl.numberOfPages){
            index = 0;
        }
        
        imageView.tag = index;
        
        HomeModel * model = self.dataArr[index];
        [imageView sd_setImageWithURL:[NSURL URLWithString:model.img] placeholderImage:[UIImage imageNamed:@"v2_home_cycle_dot_selected"]];
        
    }
    
    _scrollView.contentOffset = CGPointMake(_scrollView.width, 0);
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    _scrollView.frame = self.bounds;
    _scrollView.contentSize = CGSizeMake(3*ScreenWidth, 0);
    for (int i = 0; i < 3; i ++) {
        UIImageView * imageView = _scrollView.subviews[i];
        imageView.userInteractionEnabled = YES;
        imageView.frame = CGRectMake(i*_scrollView.width, 0, _scrollView.width, _scrollView.height);
        NSLog(@"%@",imageView);
        
     }
    
    CGFloat pageW = 80;
    CGFloat pageH = 20;
    CGFloat pageX = _scrollView.width - pageW;
    CGFloat pageY = _scrollView.height - pageH;
    
    _pageControl.frame = CGRectMake(pageX, pageY, pageW, pageH);
    
    [self updatePageScrollView];
}

#pragma mark - UIScrollView Delegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    NSInteger page = 0;
    CGFloat minDistance = MAXFLOAT;
    for (int i = 0; i < _scrollView.subviews.count; i ++) {
        UIImageView * imageView = _scrollView.subviews[i];
        CGFloat distance = fabs(imageView.x - _scrollView.contentOffset.x);
        
        if (distance < minDistance) {
            minDistance = distance;
            page = imageView.tag;
        }
    }
    _pageControl.currentPage = page;
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self stopTimer];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self startTimer];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self updatePageScrollView];
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    [self updatePageScrollView];
}

@end
