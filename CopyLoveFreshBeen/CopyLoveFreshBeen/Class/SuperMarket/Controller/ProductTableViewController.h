//
//  ProductTableViewController.h
//  CopyLoveFreshBeen
//
//  Created by way on 16/7/12.
//  Copyright © 2016年 way. All rights reserved.
//

@protocol CategoryTableViewSelectSection <NSObject>

-(void)didEndDisplayingHeaderView:(NSInteger )section;
-(void)willDisplayHeaderView:(NSInteger )section;
-(void)animationWithCellImageView:(UIImageView *)imageView;
@end
#import <UIKit/UIKit.h>

@interface ProductTableViewController : UITableViewController

@property (assign,nonatomic) id<CategoryTableViewSelectSection> cDelegate;

@end
