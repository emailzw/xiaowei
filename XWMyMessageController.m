//
//  XWMyMessageController.m
//  XiaoWei
//
//  Created by 张玮 on 14-5-14.
//  Copyright (c) 2014年 Tonknet. All rights reserved.
//

#import "XWMyMessageController.h"
#import "MKNumberBadgeView.h"
#import "XWMymessageDetailController.h"

@interface XWMyMessageController ()

@end

@implementation XWMyMessageController



- (UIImage*)imageWithImage:(UIImage*)image
              scaledToSize:(CGSize)newSize;
{
    UIGraphicsBeginImageContext( newSize );
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSMutableArray *result = [[NSMutableArray alloc] init];
    XWMessageListItem *item = [[XWMessageListItem alloc] init];
    
    item.messageTitle = @"关于“三年贷”产品的咨询";
    item.postDate = @"2014/4/15";
    item.status = @"已读取";
    
    [result addObject:item];
    
    
    item = [[XWMessageListItem alloc] init];
    item.messageTitle = @"关于“全额贷”产品的咨询";
    item.postDate = @"2014/4/16";
    item.status = @"未读取";
    [result addObject:item];
    
    item = [[XWMessageListItem alloc] init];
    item.messageTitle = @"宽限期的疑问！";
    item.postDate = @"2014/4/26";
    item.status = @"已读取";
    [result addObject:item];
    
    
    self.results = result;
    self.title = @"我的留言";

    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil] ;
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.results.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ProductCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:CellIdentifier];
    }
    XWMessageListItem *item =[self.results objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryNone;

   
    
    //留言标题
    
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(55, 4.0, 155.0, 25)];
    lbl.text = item.messageTitle;
    lbl.font = [UIFont boldSystemFontOfSize:14];
    [cell.contentView addSubview:lbl];
    
    
    //留言日期
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(55, 30, 155.0, 15)];
    lbl.text = [NSString stringWithFormat:@"留言日期:%@",item.postDate];
    lbl.font = [UIFont boldSystemFontOfSize:10];
    lbl.textColor =UIColorFromRGB(0x9e9e9e);
    [cell.contentView addSubview:lbl];
    
    
    //    cell.textLabel.text = item.productName;
    //    cell.textLabel.font = [UIFont boldSystemFontOfSize:13];
    
    //留言状态
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(220, 30, 80.0, 15)];
    lbl.text = [NSString stringWithFormat:@"留言状态:%@",item.status];
    lbl.font = [UIFont boldSystemFontOfSize:10];
    lbl.textColor =UIColorFromRGB(0x9e9e9e);
    [cell.contentView addSubview:lbl];
    
    if(indexPath.row==0){
//MKNumberBadgeView *num = [MKNumberBadgeView
    MKNumberBadgeView *numview = [[MKNumberBadgeView alloc] initWithFrame:CGRectMake(10, 2, 40, 30)];
    numview.shadow=false;
    numview.shine=false;
    numview.value=2;
    numview.font = [UIFont boldSystemFontOfSize:13];
    [cell.contentView addSubview:numview];
    }
    return cell;

}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    XWMymessageDetailController *detailViewController = [[XWMymessageDetailController alloc] initWithNibName:@"XWMymessageDetailController" bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}


@end
