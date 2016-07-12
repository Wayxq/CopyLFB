//
//  CategoryTableViewCell.m
//  CopyLoveFreshBeen
//
//  Created by way on 16/7/11.
//  Copyright © 2016年 way. All rights reserved.
//

#import "CategoryTableViewCell.h"
#import "UIColor+HexCode.h"

static int number;

@interface CategoryTableViewCell ()
//{
////    stat int number;
//}

@property (strong,nonatomic) UIView * bgView;
@end

@implementation CategoryTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

+(instancetype)cellWithTableView:(UITableView *)tableView{
    
    static NSString * cellID = @"categoryCell";
    
    CategoryTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[CategoryTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    [self setViews];
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    self.bgView.hidden = !selected;
    if (selected) {
        self.nameLabel.backgroundColor = [UIColor whiteColor];
    }else{
        self.nameLabel.backgroundColor = [UIColor colorFromHexString:@"f4f4f4"];
    }
}

-(void)setViews{
   
//    number ++;
    
    self.nameLabel = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, (ScreenWidth * 0.25), self.height)];
    [self.nameLabel addTarget:self action:@selector(nameBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.nameLabel.titleLabel.font = [UIFont systemFontOfSize:14];
    self.nameLabel.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.nameLabel setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addSubview:self.nameLabel];
    self.nameLabel.userInteractionEnabled = NO;
//    if (number == 1) {
//        self.nameLabel.selected = YES;
//    }
    
    UIView * bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 5, 5 , self.height - 10)];
    self.bgView = bgView;
    bgView.backgroundColor = [UIColor colorWithRed:235/255.0 green:212/255.0 blue:49/255.0 alpha:1];
    [self.nameLabel addSubview:bgView];
}

-(void)setDict:(NSDictionary *)dict{
    
    [self.nameLabel setTitle:[NSString stringWithFormat:@"%@",dict[@"name"]] forState:UIControlStateNormal];
    
    self.bgView.hidden = !self.nameLabel.selected;
    
    if (self.nameLabel.selected) {
        
        self.nameLabel.backgroundColor = [UIColor whiteColor];
    }else{
        self.nameLabel.backgroundColor = [UIColor colorFromHexString:@"f4f4f4"];
        }
}

-(void)nameBtnClick:(UIButton *)btn{
    
    if (self.block) {
        self.block(btn);
    }
}


@end
