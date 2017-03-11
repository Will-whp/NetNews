//
//  VVNewsController.m
//  网易新闻
//
//  Created by 王惠平 on 2017/3/10.
//  Copyright © 2017年 Will Wang. All rights reserved.
//

#import "VVNewsController.h"
#import "VVNetworkTools.h"
#import "VVNewsModel.h"
#import "VVNewsTableViewCell.h"

@interface VVNewsController ()

@property (nonatomic,strong)NSArray *newsModelArray;

@end

@implementation VVNewsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
    
}

- (void)setupTableView {
    
    [self.tableView registerNib:[UINib nibWithNibName:@"BaseCell" bundle:nil] forCellReuseIdentifier:@"baseCell"];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"BigImageCell" bundle:nil] forCellReuseIdentifier:@"bigImageCell"];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ImagesCell" bundle:nil] forCellReuseIdentifier:@"imagesCell"];
}

- (void)setUrlStr:(NSString *)urlStr {
    
    _urlStr = urlStr;
    
    NSLog(@"%@",_urlStr);

 
    [VVNewsModel requestNewsModelArrayWithURLStr:urlStr andCompletionBlock:^(NSArray *modelArray) {
        
        self.newsModelArray = modelArray;
        
        //获取到数据
        [self.tableView reloadData];
        
    }];
    
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.newsModelArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   

    VVNewsModel *model = self.newsModelArray[indexPath.row];
    
    VVNewsTableViewCell *cell;
    
    if (model.imgType) {
        
        cell = [tableView dequeueReusableCellWithIdentifier:@"bigImageCell" forIndexPath:indexPath];
        
    } else if (model.imgextra.count == 2) {
        
        
        cell = [tableView dequeueReusableCellWithIdentifier:@"imagesCell" forIndexPath:indexPath];
        
    } else {
        
        cell = [tableView dequeueReusableCellWithIdentifier:@"baseCell" forIndexPath:indexPath];
    }
    
    cell.newsModel = model;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    VVNewsModel *model = self.newsModelArray[indexPath.row];
    
    if (model.imgType) {
       
        //大图cell
        return 130;
    } else if (model.imgextra.count == 2) {
        
        //多图cell
        return 180;
    } else {
        
        //基本cell
        return 80;
    }
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
