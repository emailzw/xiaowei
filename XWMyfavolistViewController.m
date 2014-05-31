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
    
    
    
    
    NSMutableArray *result = [[NSMutableArray alloc] init];
    XWSearchResultItem *item = [[XWSearchResultItem alloc] init];
    
    item.bankIcon = @"zheshang";
    item.bankName = @"浙商银行上海分行";
    item.productName =@"三年贷";
    item.productDesc=@"还款方式：分期还款，一次还本";
    item.releaseDate=@"2014/4/15";
    [result addObject:item];
    
    item = [[XWSearchResultItem alloc] init];
    item.bankIcon = @"zheshang";
    item.bankName = @"浙商银行上海分行";
    item.productName =@"一日贷";
    item.productDesc=@"还款方式：分期还款，一次还本";
    item.releaseDate=@"2014/4/15";
    [result addObject:item];
    
    
    item = [[XWSearchResultItem alloc] init];
    item.bankIcon = @"zheshang";
    item.bankName = @"浙商银行上海分行";
    item.productName =@"全额贷";
    item.productDesc=@"还款方式：分期还款，一次还本";
    item.releaseDate=@"2014/4/15";
    [result addObject:item];
    

    
    self.results = result;
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
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:CellIdentifier];
    }
    XWSearchResultItem *item =[self.results objectAtIndex:indexPath.row];
    
    //UIImage *bankicon = [UIImage imageNamed:[item.bankIcon stringByAppendingString:@".png"]];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:item.bankIcon ofType:@"png"];
    UIImage *bankicon = [UIImage imageWithContentsOfFile:path];
    CGSize iconsize; ;
    iconsize.height=42;
    iconsize.width=42;
    
    UIImage *resizedImage = [self imageWithImage:bankicon scaledToSize:iconsize];
    UIImageView *resizedImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 45, 45)];
    resizedImageView.image = bankicon;
    //    resizedImageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleHeight;
    [cell addSubview:resizedImageView];
    
    // cell.imageView.image =resizedImage;
    //使用自定义定位
    
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(55.0, 4.0, 155.0, 30)];
    lbl.text = item.productName;
    lbl.font = [UIFont boldSystemFontOfSize:14];
    [cell.contentView addSubview:lbl];
    
    
    //    cell.textLabel.text = item.productName;
    //    cell.textLabel.font = [UIFont boldSystemFontOfSize:13];
    
    //银行名称
    cell.accessoryType = UITableViewCellAccessoryNone;
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(225.0, 5, 80.0, 30)];
    lbl.text = item.bankName;
    lbl.font = [UIFont boldSystemFontOfSize:10];
    lbl.textColor =UIColorFromRGB(0x9e9e9e);
    [cell.contentView addSubview:lbl];
    
    //还款方式
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(55.0, 26.0, 160.0, 25)];
    lbl.text = item.productDesc;
    lbl.font = [UIFont systemFontOfSize:10];;
    [cell.contentView addSubview:lbl];
    
    //日期
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(225, 26.0, 80, 25)];
    lbl.text = item.releaseDate;
    lbl.font = [UIFont systemFontOfSize:10];;
    lbl.textColor =UIColorFromRGB(0x9e9e9e);
    
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

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    XWProductDetailViewController  *detailViewController = [[XWProductDetailViewController alloc] initWithNibName:@"XWProductDetailViewController" bundle:nil];
    //
    //    // Pass the selected object to the new view controller.
    //
    //    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}

@end
