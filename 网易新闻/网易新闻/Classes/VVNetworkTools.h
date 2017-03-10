//
//  VVNetworkTools.h
//  网易新闻
//
//  Created by 王惠平 on 2017/3/10.
//  Copyright © 2017年 Will Wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

//请求方式类型
typedef enum : NSUInteger {
    GET,
    POST
} RequestType;

@interface VVNetworkTools : AFHTTPSessionManager

+ (instancetype) shardTools;


- (void)requestWithType: (RequestType)requestType andUrlStr: (NSString *)urlStr andParams: (id)parameters andSuccess: (void (^)(id responseObject))successBlock andFailture: (void (^)(NSError *error))failureBlock;

@end
