//
//  VVNewsTableViewCell.h
//  网易新闻
//
//  Created by 王惠平 on 2017/3/11.
//  Copyright © 2017年 Will Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VVNewsModel.h"

@interface VVNewsTableViewCell : UITableViewCell

///数据源绑定
@property (nonatomic,strong) VVNewsModel *newsModel;

@end
