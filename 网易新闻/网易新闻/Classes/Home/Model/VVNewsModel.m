//
//  VVNewsModel.m
//  网易新闻
//
//  Created by 王惠平 on 2017/3/11.
//  Copyright © 2017年 Will Wang. All rights reserved.
//

#import "VVNewsModel.h"
#import "VVNetworkTools.h"
#import <YYModel.h>

@implementation VVNewsModel

+ (void)requestNewsModelArrayWithURLStr:(NSString *)urlStr andCompletionBlock:(void(^)(NSArray *modelArray))completionBlock {
    
    
    [[VVNetworkTools shardTools] requestWithType:GET andUrlStr:urlStr andParams:nil andSuccess:^(id responseObject) {
        
        //NSLog(@"%@", responseObject);
        
        NSDictionary *dic = (NSDictionary*)responseObject;
        
        NSString *key = dic.allKeys.firstObject;
        
        NSLog(@"%@",key);
        
        //通过key获取新闻的数组字典
        NSArray *dicArray = [dic objectForKey:key];
        
        // NSLog(@"%@",dicArray);
        
        NSArray *modelArray = [NSArray yy_modelArrayWithClass:[VVNewsModel class] json:dicArray];
        
        //回调模型数据, AFN回调主线程给你进行回调的
        NSLog(@"当前线程%@",[NSThread currentThread])
        ;
        
        completionBlock(modelArray);
        
    } andFailture:^(NSError *error) {
        
        NSLog(@"%@", error);
    }];
    
}


@end
