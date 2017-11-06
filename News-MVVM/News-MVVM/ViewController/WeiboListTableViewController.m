//
//  WeiboListTableViewController.m
//  News-MVVM
//
//  Created by dev on 2017/11/4.
//  Copyright © 2017年 dev. All rights reserved.
//

#import "WeiboListTableViewController.h"
#import "WeiboViewModel.h"
#import "WeiboTableViewCell.h"

@interface WeiboListTableViewController ()

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation WeiboListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableView.estimatedRowHeight = 100;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self configData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataArray;
}

-(void)configData
{
    //HUD
    [HUD showHUD];
    
    WeiboViewModel *vm = [[WeiboViewModel alloc] init];
    [vm netWorkStateWithNetConnectBlock:^(BOOL netConnetState) {
        if (netConnetState) {
            NSLog(@"网络可用");
        } else {
            NSLog(@"网络不可用");
        }
    }];
    
    [vm setBlockWithReturnBlock:^(id returnValue) {
        
        self.dataArray = returnValue;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [HUD hideHUD];
            [self.tableView reloadData];
        });
        
    } WithErrorBlock:^(id errorCode) {

        [HUD showHUDWithMsg:[NSString stringWithFormat:@"%@",errorCode]];
        [HUD hideHUD];
    } WithFailureBlock:^{
        [HUD showHUDWithMsg:@"请求失败"];
        [HUD hideHUD];
    }];
    
    [vm fetchPublicWeiBo];
};

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WeiboTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"weiboCell" forIndexPath:indexPath];
    
    // Configure the cell...
    [cell setDataModel:self.dataArray[indexPath.row]];
    return cell;
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
