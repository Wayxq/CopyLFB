//
//  ProductTableViewCell.m
//  CopyLoveFreshBeen
//
//  Created by way on 16/7/12.
//  Copyright © 2016年 way. All rights reserved.
//

#import "ProductTableViewCell.h"
#import "PriceView.h"
#import "UIImageView+WebCache.h"
#import "UIColor+HexCode.h"

@interface ProductTableViewCell ()


@property (strong,nonatomic) PriceView * priceView;
@property (strong,nonatomic) UIImageView * goodImageView;
@property (strong,nonatomic) UIImageView * fineImageView;
@property (strong,nonatomic) UILabel * goodName;
@property (strong,nonatomic) UIImageView * giftImageView;
@property (strong,nonatomic) UILabel * specificationLabel;

@end

@implementation ProductTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    [self setUpView];
    
    return self;
}

+(instancetype)cellWithTableView:(UITableView *)tableView{
    
    static NSString * cellID = @"ProductTableViewCell";
    ProductTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[ProductTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return cell;
}

-(void)setUpView{
    
    self.goodImageView = [[UIImageView alloc] init];
    
    self.goodName = [[UILabel alloc] init];
    self.goodName.font = [UIFont systemFontOfSize:14];
    self.goodName.textAlignment = NSTextAlignmentLeft;
    
    self.fineImageView = [[UIImageView alloc] init];
    self.giftImageView = [[UIImageView alloc] init];
    
    self.fineImageView.image = [UIImage imageNamed:@"jingxuan.png"];
    self.giftImageView.image = [UIImage imageNamed:@"buyOne.png"];
    
    self.specificationLabel = [[UILabel alloc] init];
    self.specificationLabel.font = [UIFont systemFontOfSize:12];
    self.specificationLabel.textColor = [UIColor colorFromHexString:@"888888"];

    
    self.priceView = [[PriceView alloc] init];
    
    self.buyView = [[BuyView alloc] init];
    
    [self addSubview:self.goodImageView];
    [self addSubview:self.goodName];
    [self addSubview:self.fineImageView];
    [self addSubview:self.giftImageView];
    [self addSubview:self.specificationLabel];
    [self addSubview:self.priceView];
    [self addSubview:self.buyView];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.goodImageView.frame = CGRectMake(0, 0, 80, 80);
    
    self.fineImageView.frame = CGRectMake(CGRectGetMaxX(self.goodImageView.frame)+5, 7.5, 30, 15);
    
    self.goodName.frame = CGRectMake(CGRectGetMaxX(self.fineImageView.frame)+3, 5, self.width - CGRectGetMaxX(self.fineImageView.frame) - 8, 20);
    
    self.giftImageView.frame = CGRectMake(CGRectGetMaxX(self.goodImageView.frame)+5, CGRectGetMaxY(self.fineImageView.frame)+3, 35, 15);
    
    self.specificationLabel.frame = CGRectMake(CGRectGetMaxX(self.goodImageView.frame)+5, CGRectGetMaxY(self.giftImageView.frame)+5, self.width - CGRectGetMaxX(self.goodImageView.frame) - 10, 15);
    
    self.priceView.frame = CGRectMake(CGRectGetMaxX(self.goodImageView.frame)+5, self.height - 25, self.width - CGRectGetMaxX(self.goodImageView.frame) - 10, 20);
    
    self.buyView.frame = CGRectMake(self.width - 85, self.height - 30, 80, 25);
}

-(void)setModel:(GoodsModel *)model{
    
    [self.goodImageView sd_setImageWithURL:[NSURL URLWithString:model.img] placeholderImage:[UIImage imageNamed:@"jingxuan"]];
    
    [self.goodName setText:model.name];
    
    if ([model.pm_desc isEqualToString:@"买一赠一"]) {
        self.giftImageView.hidden = false;
    }else{
        self.giftImageView.hidden = true;
    }
    
     [self.specificationLabel setText:model.specifics];
    
    self.priceView.nowStr = model.price;
    
    NSString * str = model.market_price;
    NSMutableAttributedString * asstr = [[NSMutableAttributedString alloc] initWithString:str];
    [asstr addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid|NSUnderlineStyleSingle) range:NSMakeRange(0, str.length)];
    self.priceView.originalPriceLabel.attributedText = asstr;
    
    self.buyView.model = model;

}

@end
