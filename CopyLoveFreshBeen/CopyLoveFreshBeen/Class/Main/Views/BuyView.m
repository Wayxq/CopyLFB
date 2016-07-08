//
//  BuyView.m
//  CopyLoveFreshBeen
//
//  Created by way on 16/7/6.
//  Copyright © 2016年 way. All rights reserved.
//

#import "BuyView.h"
#import "TabbarBadgeView.h"

@interface BuyView ()

@property (strong,nonatomic) UIButton * addBtn;
@property (strong,nonatomic) UIButton * reduceBtn;
@property (strong,nonatomic) UILabel * numLabel;
@property (strong,nonatomic) UILabel * supplementLabel;
@property (assign,nonatomic) NSInteger buyNumber;

@property (strong,nonatomic) TabbarBadgeView * manager;

@end

@implementation BuyView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self initViews];
    }
    return self;
}

-(void)initViews{
    
    self.addBtn = [UIButton new];
    [_addBtn setImage:[UIImage imageNamed:@"v2_increase"] forState:UIControlStateNormal];
    [self addSubview:_addBtn];
    [_addBtn addTarget:self action:@selector(addBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.numLabel = [UILabel new];
    _numLabel.font = [UIFont systemFontOfSize:14];
    _numLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_numLabel];
    
    self.reduceBtn = [UIButton new];
    [_reduceBtn setImage:[UIImage imageNamed:@"v2_reduce"] forState:UIControlStateNormal];
    [self addSubview:_reduceBtn];
    [_reduceBtn addTarget:self action:@selector(reduceBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.supplementLabel = [UILabel new];
    _supplementLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:_supplementLabel];
    _supplementLabel.textColor = [UIColor redColor];
    _supplementLabel.text = @"补货中..";
    _supplementLabel.textAlignment = NSTextAlignmentRight;
    
    self.numLabel.hidden = true;
    self.reduceBtn.hidden = true;
    self.supplementLabel.hidden = true;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.addBtn.frame = CGRectMake(self.width - 20 - 5, self.height - 20 - 5, 20, 20);
    
    self.numLabel.frame = CGRectMake(CGRectGetMinX(_addBtn.frame) - 20, _addBtn.y, 20, 20);
    
    self.reduceBtn.frame = CGRectMake(CGRectGetMinX(_numLabel.frame) - 20, _addBtn.y, 20, 20);
    
    self.supplementLabel.frame = CGRectMake(self.width - 60 - 5, self.height - 20 - 5, 60, 20);
}

-(void)setModel:(GoodsModel *)model{
    _model = model;
    
    if (self.model.userBuyNumber != 0) {
        self.reduceBtn.hidden = false;
        self.numLabel.text = [NSString stringWithFormat:@"%ld",(long)self.model.userBuyNumber];
        self.numLabel.hidden = false;
    }else{
        self.reduceBtn.hidden = true;
        self.numLabel.text = @"";
        self.numLabel.hidden = true;
    }
    
    if (model.number <= 0) {
        self.supplementLabel.hidden = false;
        self.addBtn.hidden = true;
    }else{
        self.supplementLabel.hidden = true;
        self.addBtn.hidden = false;
    }
}

-(void)addBtnClick:(UIButton *)btn{
    
    if (_buyNumber >= self.model.number) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"HomeGoodsInventoryProblem" object:self.model.name];
        return;
    }
    
    _buyNumber++;
    _reduceBtn.hidden = false;
    _model.userBuyNumber = _buyNumber;
    _numLabel.hidden = false;
    _numLabel.text = [NSString stringWithFormat:@"%ld",(long)_buyNumber];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(addBtnClickWithGoodsName:)]) {
        [self.delegate addBtnClickWithGoodsName:@""];
    }
    
    self.manager = [TabbarBadgeView sharedManager];
//    manager.badgeStr = @"16";
    [_manager addProductIntoShopCar:self.model];
    
    // 在MainTabBarViewController找出three 通知改变badge
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"ShopCarRedHot" object:nil];
}

-(void)reduceBtnClick:(UIButton *)btn{
    
    if (_buyNumber <= 0) {
        return;
    }
    
    _buyNumber--;
    _model.userBuyNumber = _buyNumber;
    _numLabel.text = [NSString stringWithFormat:@"%ld",(long)_buyNumber];
    if (_buyNumber == 0) {
        _reduceBtn.hidden = true;
        _numLabel.hidden = true;
        _numLabel.text = @"";
    }
    
    [_manager reduceProductIntoShopCar:self.model];
}

-(void)ClickAddShopCarBlock:(ClickAddShopCarBlock)block{
    self.clickAddShopCarBlock = block;
}

@end
