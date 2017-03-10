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

@interface VVHomeController () <UICollectionViewDelegate,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UIScrollView *channelScrollView;

@property (weak, nonatomic) IBOutlet UICollectionView *newsCollectionView;

@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;

//频道数据源
@property (nonatomic,strong) NSArray *channelModelData;

@end

@implementation VVHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //  iOS7 提供的,如果有导航栏显示的滚动的视图(UITextView, UITableView, UICollectionView, UIScrollView)内容会自动往下偏移64, 设置no表示不让其偏移
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self requestChannelData];
    [self setupNewsCollectionView];
    
}

- (void)requestChannelData {
    
    self.channelModelData = [VVChannelModel getChannelModelData];
    
//    for (VVChannelModel *model in modelData) {
//        
//        NSLog(@"%@",model);
//    }

    //遍历频道模型数组,创建对应的频道lable
    //频道Lable的大小
    CGFloat lableWidth = 80;
    CGFloat lableHeight = 44;
    
    for (int i = 0; i < self.channelModelData.count; i++) {
        
        //获取对应的模型数据
        VVChannelModel *model = self.channelModelData[i];
        
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
    self.channelScrollView.contentSize = CGSizeMake(lableWidth * self.channelModelData.count, 0);
    
    //取消滚动条
    self.channelScrollView.showsVerticalScrollIndicator = NO;
    self.channelScrollView.showsHorizontalScrollIndicator = NO;
    
}

//设置新闻视图
- (void)setupNewsCollectionView {
    
    //遵守数据源和代理
    self.newsCollectionView.delegate = self;
    self.newsCollectionView.dataSource = self;
    
    //设置每个item的大小
    self.flowLayout.itemSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height - 64- 44);
    
    //设置间距
    self.flowLayout.minimumLineSpacing = 0; //垂直间距
    self.flowLayout.minimumInteritemSpacing = 0; //水平间距
    
    //设置滚动方向
    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    //取消弹簧效果
    self.newsCollectionView.bounces = NO;
    
    //去掉滚动条
    self.newsCollectionView.showsHorizontalScrollIndicator = NO;
    self.newsCollectionView.showsVerticalScrollIndicator = NO;
    
    //设置分页效果
    self.newsCollectionView.pagingEnabled = YES;
    
    //ios10提供了一个预加载的功能  会把下一个将要显示的cell提前准备好
    self.newsCollectionView.prefetchingEnabled = YES;
    
    
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.channelModelData.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"newsCell" forIndexPath:indexPath];
    
        return cell;

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
