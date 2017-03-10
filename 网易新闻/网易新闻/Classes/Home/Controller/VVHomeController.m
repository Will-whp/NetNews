//
//  VVHomeController.m
//  网易新闻
//
//  Created by 王惠平 on 2017/3/10.
//  Copyright © 2017年 Will Wang. All rights reserved.
//

#import "VVHomeController.h"
#import "VVChannelModel.h"

@interface VVHomeController ()
@property (weak, nonatomic) IBOutlet UIScrollView *channelScrollView;

@property (weak, nonatomic) IBOutlet UICollectionView *newsCollectionView;

@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;

@end

@implementation VVHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self requestChannelData];
    
}

- (void)requestChannelData {
    
    
    NSArray *modelData = [VVChannelModel getChannelModelData];
    
    for (VVChannelModel *model in modelData) {
        
        NSLog(@"%@",model);
    }
    
    
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
