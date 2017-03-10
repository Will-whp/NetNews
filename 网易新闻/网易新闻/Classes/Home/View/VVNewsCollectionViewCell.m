//
//  VVNewsCollectionViewCell.m
//  网易新闻
//
//  Created by 王惠平 on 2017/3/10.
//  Copyright © 2017年 Will Wang. All rights reserved.
//

#import "VVNewsCollectionViewCell.h"
#import "VVNewsController.h"

@implementation VVNewsCollectionViewCell

- (void)awakeFromNib {
    
    [super awakeFromNib];
    
    //创建新闻列表控制器
    VVNewsController *tableViewVC = [[VVNewsController alloc]init];
    [self.contentView addSubview:tableViewVC.tableView];
    
    //设置tableView的大小
    tableViewVC.tableView.frame = self.contentView.bounds;
    
    //设置cell的随机颜色
    tableViewVC.tableView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1];
    

    
    
}


@end
