//
//  SearchView.m
//  锄禾日当午
//
//  Created by 王奥运 on 16/7/5.
//  Copyright © 2016年 王奥运. All rights reserved.
//

#import "SearchView.h"

@interface SearchView()

@property (nonatomic ,strong) UILabel * SecTitle;

@end

@implementation SearchView

-(instancetype)initWithFrame:(CGRect)frame WithSearchSecTitle:(NSString *)secTtile andSearchArr:(NSArray *)btnArr{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.SecTitle = [UILabel new];
        _SecTitle.frame = CGRectMake(0, 0, frame.size.width - 30, 35);
        _SecTitle.font = [UIFont systemFontOfSize:15];
        _SecTitle.textColor = [UIColor grayColor];
        [self addSubview:_SecTitle];
        
        _SecTitle.text = secTtile;
        
        
        CGFloat btnW = 0;
        CGFloat btnH = 30;
        CGFloat addW = 30;
        CGFloat marginX = 10;
        CGFloat marginY = 10;
        CGFloat lastX = 0;
        CGFloat lastY = 35;
        
        for (int i = 0; i < btnArr.count; i ++) {
            
            UIButton * btn = [UIButton new];
            [btn setTitle:btnArr[i] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [btn.titleLabel setFont:[UIFont systemFontOfSize:14]];
            [btn.titleLabel sizeToFit];
            btn.backgroundColor = [UIColor whiteColor];
            btn.layer.masksToBounds = true;
            btn.layer.cornerRadius = 15;
            btn.layer.borderWidth = 0.5;
            btn.layer.borderColor = [UIColor colorWithRed:200/255 green:200/255 blue:200/255 alpha:1].CGColor;
            [btn addTarget:self action:@selector(searchButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            btnW = btn.titleLabel.frame.size.width + addW;
            
            if (self.frame.size.width - lastX > btnW) {
                btn.frame = CGRectMake(lastX, lastY, btnW, btnH);
            }else{
                btn.frame = CGRectMake(0, lastY + marginY + btnH, btnW, btnH);
            }
            
            lastX = CGRectGetMaxX(btn.frame) + marginX;
            lastY = btn.frame.origin.y;
            self.searchViewHeight = CGRectGetMaxY(btn.frame);
            
            [self addSubview:btn];
            
        }
    }
    
    return self;
}

-(void)searchButtonClick:(UIButton *)btn{
    
    // 写个代理或者block 把当前btn传出去
}


@end
