//
//  VVChannelModel.m
//  网易新闻
//
//  Created by 王惠平 on 2017/3/10.
//  Copyright © 2017年 Will Wang. All rights reserved.
//

#import "VVChannelModel.h"
#import <YYModel.h>

@implementation VVChannelModel

+ (NSArray *)getChannelModelData {
    
    //获取json文件路径
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"topic_news.json" ofType:nil];
    
    //获取json文件对应的二进制数据
    NSData *jsonData = [NSData dataWithContentsOfFile:jsonPath];
    
    //反序列化二进制数据
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:NULL];
    
    //获取tlist对应的频道数组字典数据
    NSArray *channelDicArray = [dic objectForKey:@"tList"];
    
    //使用YYModel完成字典转模型操作
    NSArray *modelArray = [NSArray yy_modelArrayWithClass:[VVChannelModel class] json:channelDicArray];
    
    //根据模型里的tid进行从大到小的排序
    modelArray = [modelArray sortedArrayUsingComparator:^NSComparisonResult(VVChannelModel *obj1, VVChannelModel *obj2) {
        
        return [obj1.tid compare:obj2.tid];
        
    }];
    
    //返回数据
    return modelArray;

}

- (NSString *)description {
    
    return [NSString stringWithFormat:@"%@ - %@",self.tid,self.tname];
    
}
@end
