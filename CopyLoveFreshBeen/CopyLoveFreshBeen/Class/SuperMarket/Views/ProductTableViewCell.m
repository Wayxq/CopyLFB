//
//  ProductTableViewCell.m
//  CopyLoveFreshBeen
//
//  Created by way on 16/7/12.
//  Copyright © 2016年 way. All rights reserved.
//

#import "ProductTableViewCell.h"

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
    
}

@end
