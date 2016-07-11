//
//  CategoryTableViewCell.h
//  CopyLoveFreshBeen
//
//  Created by way on 16/7/11.
//  Copyright © 2016年 way. All rights reserved.
//
typedef void(^CategoryNameBtnClick)(UIButton * btn);
#import <UIKit/UIKit.h>

@interface CategoryTableViewCell : UITableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView;
@property (strong,nonatomic) NSDictionary * dict;
@property (strong,nonatomic) UIButton * nameLabel;

@property (copy,nonatomic) CategoryNameBtnClick block;

@end
