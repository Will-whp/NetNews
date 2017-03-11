//
//  VVNewsTableViewCell.m
//  网易新闻
//
//  Created by 王惠平 on 2017/3/11.
//  Copyright © 2017年 Will Wang. All rights reserved.
//

#import "VVNewsTableViewCell.h"
#import <UIImageView+WebCache.h>

@interface VVNewsTableViewCell ()

///新闻图标
@property (weak, nonatomic) IBOutlet UIImageView *imgsrcImageView;

///新闻标题
@property (weak, nonatomic) IBOutlet UILabel *labTitle;

///新闻来源
@property (weak, nonatomic) IBOutlet UILabel *labSource;

///阅读数
@property (weak, nonatomic) IBOutlet UILabel *labReplyCount;

@end

@implementation VVNewsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    //设置图片按照原始比例显示 超出的部分删除
    self.imgsrcImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imgsrcImageView.clipsToBounds = YES;
    
    
    
}

- (void)setNewsModel:(VVNewsModel *)newsModel {
    
    _newsModel = newsModel;
    
    //通过获取的model数据给控件赋值
    [self.imgsrcImageView sd_setImageWithURL:[NSURL URLWithString:newsModel.imgsrc] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
    
    self.labTitle.text = newsModel.title;
    self.labSource.text = newsModel.source;
    self.labReplyCount.text = [NSString stringWithFormat:@"%zd",newsModel.replyCount];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
