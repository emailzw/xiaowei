//
//  XWMyMessageController.m
//  XiaoWei
//
//  Created by 张玮 on 14-5-14.
//  Copyright (c) 2014年 Tonknet. All rights reserved.
//

#import "XWMyMessageController.h"
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
    
  /*  NSMutableArray *result = [[NSMutableArray alloc] init];
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
   */
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
    
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(20, 4.0, 290, 25)];
    lbl.text = item.messageTitle;
    lbl.font = [UIFont boldSystemFontOfSize:14];
    [cell.contentView addSubview:lbl];
    
    
    //留言日期
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(20, 30, 155.0, 15)];
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
  /*
    if(indexPath.row==0){
//MKNumberBadgeView *num = [MKNumberBadgeView
    MKNumberBadgeView *numview = [[MKNumberBadgeView alloc] initWithFrame:CGRectMake(10, 2, 40, 30)];
    numview.shadow=false;
    numview.shine=false;
    numview.value=2;
    numview.font = [UIFont boldSystemFontOfSize:13];
    [cell.contentView addSubview:numview];
    }*/
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
    
    
    
    XWMessageListItem *item =[self.results objectAtIndex:indexPath.row];

    
    NSString *uid =  [[NSUserDefaults standardUserDefaults] objectForKey:LOGIN];
    
    //获取留言
    
    
    NSMutableString  *url =  [[NSMutableString alloc] initWithString:SERVER_URL];
    [url appendString: [NSString  stringWithFormat: @"message/%@/%@/%@",uid,item.productID,item.mid]];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    
    UIActivityIndicatorView *activityIndicator;
    activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)];
    CGPoint center  = CGPointMake(self.view.center.x, self.view.center.y-50);
    [activityIndicator setCenter:center];
    [activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [self.view addSubview:activityIndicator];
    
    [activityIndicator startAnimating];
    
    
    @try {
        [NSURLConnection sendAsynchronousRequest:request
                                           queue:[NSOperationQueue mainQueue]
                               completionHandler:^(NSURLResponse *response,  NSData *data, NSError *error) {
                                   if (error != nil) {
                                       NSLog(@"Error on load = %@", [error localizedDescription]);
                                       [activityIndicator stopAnimating];
                                       
                                       UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"通讯错误"
                                                                                       message:nil
                                                                                      delegate:nil
                                                                             cancelButtonTitle:@"确定"
                                                                             otherButtonTitles:nil, nil];
                                       [alert show];
                                       return;
                                   }else {
                                       [activityIndicator stopAnimating];
                                       // check the HTTP status
                                       if ([response isKindOfClass:[NSHTTPURLResponse class]]) {                    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                                           if (httpResponse.statusCode != 200) {
                                               return;                    }
                                           NSLog(@"Headers: %@", [httpResponse allHeaderFields]);
                                           NSDictionary  *rawresult = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves  error:&error];
                                           
                                           NSMutableDictionary *t =
                                           [[NSMutableDictionary alloc ] initWithDictionary:
                                           [rawresult objectForKey:@"message"]];
                                           
                                     
                                           
                                           NSString *code = [rawresult objectForKey:@"code"];
                                           NSLog(@"查询结果 %@", rawresult );
                                           
                                           if(![code isEqualToString:@"101"]){
                                               UIAlertView * alert =
                                               [[UIAlertView alloc]
                                                initWithTitle:@"错误"
                                                message: [[NSString alloc] initWithFormat:@"用户信息获取:%@",code]
                                                delegate:nil
                                                cancelButtonTitle:nil
                                                otherButtonTitles:@"确定", nil];
                                               [alert show];
                                               return;
                                               
                                           }else if([code isEqualToString:@"101"]){
                                               
                                               
                                               XWMymessageDetailController  *detailViewController = [[XWMymessageDetailController alloc] initWithNibName:@"XWMymessageDetailController" bundle:nil];
                                              [t setObject:item.productID forKey:@"productID"];
                                               detailViewController.info = t;
                                               [self.navigationController pushViewController:detailViewController animated:YES];
                                           }//end 101
                                       }
                                   }
                               }
         ];
        
        
        
        
    }@catch (NSException *exception) {
        [activityIndicator stopAnimating];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"对不起，服务故障，请稍后再试"
                                                        message:nil
                                                       delegate:self
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil, nil];
        
        [alert show];
        return;
    }
    @finally {
        
    }

}


@end
