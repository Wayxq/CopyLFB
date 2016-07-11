//
//  CategoryTableViewCell.m
//  CopyLoveFreshBeen
//
//  Created by way on 16/7/11.
//  Copyright © 2016年 way. All rights reserved.
//

#import "CategoryTableViewCell.h"
#import "UIColor+HexCode.h"

@interface CategoryTableViewCell ()



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
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
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

    // Configure the view for the selected state
}

-(void)setViews{
    
    self.backgroundColor = [UIColor colorFromHexString:@"f4f4f4"];
    
    ;
    UIView * bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 5, 5 , self.height - 10)];
    bgView.backgroundColor = [UIColor colorWithRed:235/255.0 green:212/255.0 blue:49/255.0 alpha:1];
    [self addSubview:bgView];
    
    self.nameLabel = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(bgView.frame)-5, 0, ScreenWidth * 0.25, self.height)];
    [self.nameLabel addTarget:self action:@selector(nameBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.nameLabel.titleLabel.font = [UIFont systemFontOfSize:15];
    self.nameLabel.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.nameLabel setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addSubview:self.nameLabel];
//    self.nameLabel.userInteractionEnabled = NO;
}

-(void)setDict:(NSDictionary *)dict{
    
    [self.nameLabel setTitle:[NSString stringWithFormat:@"%@",dict[@"name"]] forState:UIControlStateNormal];
    
}

-(void)nameBtnClick:(UIButton *)btn{
    
    btn.selected = !btn.selected;
    if (btn.selected) {
        self.nameLabel.backgroundColor = [UIColor whiteColor];
    }else{
        self.nameLabel.backgroundColor = [UIColor colorFromHexString:@"f4f4f4"];
    }
}

@end
