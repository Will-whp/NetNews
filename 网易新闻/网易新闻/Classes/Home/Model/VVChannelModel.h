//
//  VVChannelModel.h
//  网易新闻
//
//  Created by 王惠平 on 2017/3/10.
//  Copyright © 2017年 Will Wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VVChannelModel : NSObject

//频道名称
@property (nonatomic,copy) NSString *tname;

//频道id
@property (nonatomic,copy) NSString *tid;

//获取频道模型数据
+ (NSArray *)getChannelModelData;


@end
