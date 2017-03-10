//
//  VVHomeController.m
//  网易新闻
//
//  Created by 王惠平 on 2017/3/10.
//  Copyright © 2017年 Will Wang. All rights reserved.
//

#import "VVHomeController.h"
#import "VVChannelModel.h"
#import "VVChannelLable.h"

@interface VVHomeController ()
@property (weak, nonatomic) IBOutlet UIScrollView *channelScrollView;

@property (weak, nonatomic) IBOutlet UICollectionView *newsCollectionView;

@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;

@end

@implementation VVHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //  iOS7 提供的,如果有导航栏显示的滚动的视图(UITextView, UITableView, UICollectionView, UIScrollView)内容会自动往下偏移64, 设置no表示不让其偏移
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self requestChannelData];
    
}

- (void)requestChannelData {
    
    
    NSArray *modelData = [VVChannelModel getChannelModelData];
    
//    for (VVChannelModel *model in modelData) {
//        
//        NSLog(@"%@",model);
//    }

    //遍历频道模型数组,创建对应的频道lable
    //频道Lable的大小
    CGFloat lableWidth = 80;
    CGFloat lableHeight = 44;
    
    for (int i = 0; i < modelData.count; i++) {
        
        //获取对应的模型数据
        VVChannelModel *model = modelData[i];
        
        //创建lable
        VVChannelLable *channelLable = [[VVChannelLable alloc]initWithFrame:CGRectMake(i * lableWidth, 0, lableWidth, lableHeight)];
        
        //获取显示内容
        channelLable.text = model.tname;
        
        //设置文字大小和居中显示
        channelLable.font = [UIFont systemFontOfSize:15];
        channelLable.textAlignment = NSTextAlignmentCenter;
        
        //添加到视图
        [self.channelScrollView addSubview:channelLable];
        
    }
    
    //设置scrollView的滚动范围
    self.channelScrollView.contentSize = CGSizeMake(lableWidth * modelData.count, 0);
    
    //取消滚动条
    self.channelScrollView.showsVerticalScrollIndicator = NO;
    self.channelScrollView.showsHorizontalScrollIndicator = NO;
    
    
    
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
