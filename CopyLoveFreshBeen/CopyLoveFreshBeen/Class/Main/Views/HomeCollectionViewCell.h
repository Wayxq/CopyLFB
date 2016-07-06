//
//  HomeCollectionViewCell.h
//  CopyLoveFreshBeen
//
//  Created by way on 16/7/6.
//  Copyright © 2016年 way. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"
#import "GoodsModel.h"
#import "BuyView.h"

typedef enum {
    Horizontal = 0,
    Vertical
} HomeCellType;

@interface HomeCollectionViewCell : UICollectionViewCell

@property (assign,nonatomic) HomeCellType cellType;

@property (strong,nonatomic) HomeModel * model;
@property (strong,nonatomic) GoodsModel * goodsModel;

@property (strong,nonatomic) BuyView * buyView;

@end
