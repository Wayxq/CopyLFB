//
//  HomeCollectionViewCell.m
//  CopyLoveFreshBeen
//
//  Created by way on 16/7/6.
//  Copyright © 2016年 way. All rights reserved.
//

#import "HomeCollectionViewCell.h"
#import "PriceView.h"
#import "UIImageView+WebCache.h"
#import "UIColor+HexCode.h"

@interface HomeCollectionViewCell()<AddShopCarDelegate>

@property (strong,nonatomic) UIImageView * singleImageView;
@property (strong,nonatomic) UIImageView * halfImageView;
@property (strong,nonatomic) UILabel * nameLabel;
@property (strong,nonatomic) UIImageView * fineImageView;
@property (strong,nonatomic) UIImageView * giftImageView;
@property (strong,nonatomic) UILabel * specifiLabel;
@property (strong,nonatomic) PriceView * priceView;



@end

@implementation HomeCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self initViews];
    }
    return self;
}

-(void)initViews{
    
    self.singleImageView = [UIImageView new];
    self.halfImageView = [UIImageView new];
    self.nameLabel = [UILabel new];
    _nameLabel.font = [UIFont systemFontOfSize:14];
    _nameLabel.textAlignment = NSTextAlignmentLeft;
    self.fineImageView = [UIImageView new];
    _fineImageView.image = [UIImage imageNamed:@"jingxuan.png"];
    self.giftImageView = [UIImageView new];
    _giftImageView.image = [UIImage imageNamed:@"buyOne.png"];
    self.specifiLabel = [UILabel new];
    _specifiLabel.font = [UIFont systemFontOfSize:12];
    _specifiLabel.textColor = [UIColor colorFromHexString:@"888888"];
    self.priceView = [PriceView new];
    self.buyView = [BuyView new];
    self.buyView.delegate = self;
    
    self.singleImageView.hidden = true;
    self.halfImageView.hidden = true;
    self.nameLabel.hidden = true;
    self.fineImageView.hidden = true;
    self.giftImageView.hidden = true;
    self.specifiLabel.hidden = true;
    self.priceView.hidden = true;
    self.buyView.hidden = true;
    
    [self addSubview:self.singleImageView];
    [self addSubview:self.halfImageView];
    [self addSubview:self.nameLabel];
    [self addSubview:self.fineImageView];
    [self addSubview:self.giftImageView];
    [self addSubview:self.specifiLabel];
    [self addSubview:self.priceView];
    [self addSubview:self.buyView];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.singleImageView.frame = self.bounds;
    self.halfImageView.frame = CGRectMake(0, 0, self.width, self.width);
    self.nameLabel.frame = CGRectMake(5, CGRectGetMaxY(self.halfImageView.frame), self.width - 10, 20);
    self.fineImageView.frame = CGRectMake(5, CGRectGetMaxY(self.nameLabel.frame), 30, 15);
    self.giftImageView.frame = CGRectMake(CGRectGetMaxX(self.fineImageView.frame)+3, CGRectGetMaxY(self.nameLabel.frame), 35, 15);
    self.specifiLabel.frame = CGRectMake(5, CGRectGetMaxY(self.fineImageView.frame), self.width, 20);
    self.priceView.frame = CGRectMake(_nameLabel.x, CGRectGetMaxY(_specifiLabel.frame), 60, self.height - CGRectGetMaxY(_specifiLabel.frame));
    self.buyView.frame = CGRectMake(self.width - 85, self.height - 30, 80, 25);
}

-(void)setModel:(HomeModel *)model{
    self.cellType = 1;
    
    [self.singleImageView sd_setImageWithURL:[NSURL URLWithString:model.img] placeholderImage:[UIImage imageNamed:@"jingxuan"]];
    
}

-(void)setGoodsModel:(GoodsModel *)goodsModel{
    self.cellType = 0;
    
    [self.halfImageView sd_setImageWithURL:[NSURL URLWithString:goodsModel.img] placeholderImage:[UIImage imageNamed:@"jingxuan"]];
    
    [self.nameLabel setText:goodsModel.name];
    
    if ([goodsModel.pm_desc isEqualToString:@"买一赠一"]) {
        self.giftImageView.hidden = false;
    }else{
        self.giftImageView.hidden = true;
    }
    
    [self.specifiLabel setText:goodsModel.specifics];
    
    self.priceView.nowStr = goodsModel.price;
    
    NSString * str = goodsModel.market_price;
    NSMutableAttributedString * asstr = [[NSMutableAttributedString alloc] initWithString:str];
    [asstr addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid|NSUnderlineStyleSingle) range:NSMakeRange(0, str.length)];
    self.priceView.originalPriceLabel.attributedText = asstr;
    
    self.buyView.model = goodsModel;
}

-(void)setCellType:(HomeCellType)cellType{
    
        self.singleImageView.hidden = !cellType;
        
        self.halfImageView.hidden = cellType;
        self.nameLabel.hidden = cellType;
        self.fineImageView.hidden = cellType;
        self.giftImageView.hidden = cellType;
        self.specifiLabel.hidden = cellType;
        self.priceView.hidden = cellType;
        self.buyView.hidden = cellType;
}

-(void)addBtnClickWithGoodsName:(NSString *)name{
    if (self.buyView.clickAddShopCarBlock) {
        self.buyView.clickAddShopCarBlock(self.halfImageView);
    }
}

@end
