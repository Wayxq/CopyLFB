//
//  ProductTableViewCell.h
//  CopyLoveFreshBeen
//
//  Created by way on 16/7/12.
//  Copyright © 2016年 way. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodsModel.h"
#import "BuyView.h"


@interface ProductTableViewCell : UITableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView;

@property (strong,nonatomic) GoodsModel * model;
@property (strong,nonatomic) BuyView * buyView;

@end
