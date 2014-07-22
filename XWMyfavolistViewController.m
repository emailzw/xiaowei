//
//  XWMyfavolistViewController.m
//  XiaoWei
//
//  Created by 张玮 on 14-5-28.
//  Copyright (c) 2014年 Tonknet. All rights reserved.
//

#import "XWMyfavolistViewController.h"
#import "XWSearchResultItem.h"
#import "XWProductDetailViewController.h"

@interface XWMyfavolistViewController ()

@end

@implementation XWMyfavolistViewController

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
    
       self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil] ;
    
    
    
    NSString *uid =  [[NSUserDefaults standardUserDefaults] objectForKey:LOGIN];
    
    if (uid == nil){
        
        UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"登录提示"    //标题
                                                       message:@"该功能需要登录后使用，您目前还没有登录。"   //显示内容
                                                      delegate:self          //委托，可以点击事件进行处理
                                             cancelButtonTitle:@"取消"
                                             otherButtonTitles:@"登录"
                             //,@"其他",    //添加其他按钮
                             ,nil];
        [view show];
        return;
    }
    
    

     /*
     NSMutableArray *result = [[NSArray alloc] init];
    
    
    //收藏产品
    @try{
        
        NSMutableString  *url =  [[NSMutableString alloc] initWithString:SERVER_URL];
        [url appendString: [NSString  stringWithFormat: @"/collect/query/%@",uid]];
        
        NSError *error;
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
        NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        NSDictionary *raw = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves  error:&error];
        NSString *code = [raw objectForKey:@"code"];
        NSLog( [NSString stringWithFormat: @"raw:%@",raw ]);
        NSArray *queryproducts = [raw objectForKey:@"message"];

       

        if([code isEqualToString:@"40021"]){
            UIAlertView * alert =
            [[UIAlertView alloc]
             initWithTitle:@"您还没有任何收藏的产品"
             message: nil
             delegate:nil
             cancelButtonTitle:nil
             otherButtonTitles:@"确定", nil];
            [alert show];
            
        }else if(![code isEqualToString:@"101"]){
            UIAlertView * alert =
            [[UIAlertView alloc]
             initWithTitle:@"错误"
             message: [[NSString alloc] initWithFormat:@"查询失败:%@",code]
             delegate:nil
             cancelButtonTitle:nil
             otherButtonTitles:@"确定", nil];
            [alert show];
            return;
            
        }else if([code isEqualToString:@"101"]){
            
            result = [[NSMutableArray alloc] init];
            XWSearchResultItem *item = [[XWSearchResultItem alloc] init];
            
            
            for(int i=0;i<[queryproducts count];i++){
                item = [[XWSearchResultItem alloc] init];
                
                item.bankName = [queryproducts[i] objectForKey:@"bankname"];
                item.productName = [queryproducts[i] objectForKey:@"productname"];
                item.productDesc= [queryproducts[i] objectForKey:@"repaymentType"];
                item.productid= [queryproducts[i] objectForKey:@"productid"];
                
                //item.releaseDate=@"2014/4/15";
                [result addObject:item];
                
            }
            

        }
        
    }@catch (NSException *e){
        NSLog(@"Exception: %@", e);
        UIAlertView * alert =
        [[UIAlertView alloc]
         initWithTitle:@"错误"
         message: [[NSString alloc] initWithFormat:@"系统错误"]
         delegate:self
         cancelButtonTitle:nil
         otherButtonTitles:@"确定", nil];
        [alert show];
        return ;
    }

    self.results = result;*/
    self.title = @"我的收藏";
    
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
    //  if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:CellIdentifier];
    //}
    XWSearchResultItem *item =[self.results objectAtIndex:indexPath.row];
    
    //产品名称
    
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(15, 4.0, 155.0, 30)];
    if(item.productName == nil){
        item.productName = @"";
    }
    lbl.text = item.productName;
    lbl.font = [UIFont boldSystemFontOfSize:14];
    lbl.textColor = UIColorFromRGB(0xFF9933);
    [cell.contentView addSubview:lbl];
    
    //银行名称
    cell.accessoryType = UITableViewCellAccessoryNone;
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(205.0, 5, 95.0, 30)];
    if(item.bankName == nil){
        item.bankName = @"";
    }
    lbl.text = item.bankName;
    lbl.font = [UIFont boldSystemFontOfSize:11];
    lbl.textColor =UIColorFromRGB(0x9e9e9e);
    [cell.contentView addSubview:lbl];
    
    //还款方式
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(15, 26.0, 280, 25)];
    if(item.productDesc == nil){
        item.productDesc = @"";
    }
    lbl.text = item.productDesc;
    lbl.font = [UIFont systemFontOfSize:11];
    lbl.textColor = UIColorFromRGB(0x0033cc);
    [cell.contentView addSubview:lbl];
    
    //日期
    //    lbl = [[UILabel alloc] initWithFrame:CGRectMake(225, 26.0, 80, 25)];
    //    lbl.text = item.releaseDate;
    //    lbl.font = [UIFont systemFontOfSize:10];;
    //    lbl.textColor =UIColorFromRGB(0x9e9e9e);
    
    [cell.contentView addSubview:lbl];
    
    
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


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    XWProductDetailViewController  *detailViewController = [[XWProductDetailViewController alloc] initWithNibName:@"XWProductDetailViewController" bundle:nil];
    XWSearchResultItem *item =[self.results objectAtIndex:indexPath.row];
    
    detailViewController.productID =  item.productid;
    //
    //    // Pass the selected object to the new view controller.
    //
    //    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}


@end
