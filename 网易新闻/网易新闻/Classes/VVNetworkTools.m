//
//  VVNetworkTools.m
//  网易新闻
//
//  Created by 王惠平 on 2017/3/10.
//  Copyright © 2017年 Will Wang. All rights reserved.
//

#import "VVNetworkTools.h"

@implementation VVNetworkTools

+ (instancetype) shardTools {
    
    static VVNetworkTools *tools;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        tools = [[VVNetworkTools alloc]initWithBaseURL:[NSURL URLWithString:@"http://c.m.163.com/nc/article/list/"]];
    });
    
    return tools;
}

- (void)requestWithType: (RequestType)requestType andUrlStr: (NSString *)urlStr andParams: (id)parameters andSuccess: (void (^)(id responseObject))successBlock andFailture: (void (^)(NSError *error))failureBlock{
    
    if (requestType == GET) {
        
        [self GET:urlStr parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
           
            successBlock(responseObject);
        
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
          
            failureBlock(error);
        }];
        
    } else {
       
        [self POST:urlStr parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
           
            successBlock(responseObject);
        
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
           
            failureBlock(error);
            
        }];
    }
}


@end
