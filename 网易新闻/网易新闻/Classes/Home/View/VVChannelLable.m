//
//  VVChannelLable.m
//  网易新闻
//
//  Created by 王惠平 on 2017/3/10.
//  Copyright © 2017年 Will Wang. All rights reserved.
//

#import "VVChannelLable.h"

@implementation VVChannelLable

- (void)setScalePercent:(CGFloat)scalePercent {
    
    _scalePercent = scalePercent;
    
    //设置颜色
    self.textColor = [UIColor colorWithRed:scalePercent green:0 blue:0 alpha:1];
    
    //设置缩放比
    CGFloat currentScalePrecent = 1 + scalePercent *0.3;
    self.transform = CGAffineTransformMakeScale(currentScalePrecent, currentScalePrecent);
    
}
@end
