//
//  XWSearchProductResultViewController.m
//  XiaoWei
//
//  Created by 张玮 on 14-5-4.
//  Copyright (c) 2014年 Tonknet. All rights reserved.
//

#import "XWSearchProductResultViewController.h"
#import "XWSearchResultItem.h"
#import "XWProductDetailViewController.h"

@interface XWSearchProductResultViewController ()

@end

@implementation XWSearchProductResultViewController

- (UIImage*)imageWithImage:(UIImage*)image
              scaledToSize:(CGSize)newSize;
{
    UIGraphicsBeginImageContext( newSize );
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil] ;
    
    
    //退回首页
    UIButton *homeButton = [UIButton buttonWithType:101];
    
    [homeButton addTarget:self action:@selector(home) forControlEvents:UIControlEventTouchUpInside];
    [homeButton setTitle:@"首页" forState:UIControlStateNormal];
    
    UIBarButtonItem *homeItem = [[UIBarButtonItem alloc] initWithCustomView:homeButton];
    
    
    homeItem.tintColor = [UIColor whiteColor];
    [homeItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                      [UIColor whiteColor],NSForegroundColorAttributeName,
                                      [UIFont boldSystemFontOfSize:19], NSFontAttributeName, nil] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem =  homeItem;



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
  //  if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:CellIdentifier];
    //}
    XWSearchResultItem *item =[self.results objectAtIndex:indexPath.row];

    //UIImage *bankicon = [UIImage imageNamed:[item.bankIcon stringByAppendingString:@".png"]];

//    NSString *path = [[NSBundle mainBundle] pathForResource:item.bankIcon ofType:@"png"];
      NSString *path = [[NSBundle mainBundle] pathForResource:@"list" ofType:@"png"];
    UIImage *bankicon = [UIImage imageWithContentsOfFile:path];
    CGSize iconsize; ;
    iconsize.height=14;
    iconsize.width=12;
    //关闭图片显示
   // UIImageView *resizedImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 45, 45)];
     UIImageView *resizedImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 15, 14, 12)];
    resizedImageView.image = bankicon;
    resizedImageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleHeight;
  //  [cell addSubview:resizedImageView];
   
    // cell.imageView.image =resizedImage;
    //产品名称

    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(15, 4.0, 155.0, 30)];
    lbl.text = item.productName;
    lbl.font = [UIFont boldSystemFontOfSize:14];
    lbl.textColor = UIColorFromRGB(0xFF9933);
    [cell.contentView addSubview:lbl];
    
    
//    cell.textLabel.text = item.productName;
//    cell.textLabel.font = [UIFont boldSystemFontOfSize:13];

    //银行名称
    cell.accessoryType = UITableViewCellAccessoryNone;
     lbl = [[UILabel alloc] initWithFrame:CGRectMake(205.0, 5, 95.0, 30)];
    lbl.text = item.bankName;
    lbl.font = [UIFont boldSystemFontOfSize:11];
    lbl.textColor =UIColorFromRGB(0x9e9e9e);
    [cell.contentView addSubview:lbl];
    
    //还款方式
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(15, 26.0, 280, 25)];
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
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
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
    XWProductDetailViewController  *detailViewController = [[XWProductDetailViewController alloc] initWithNibName:@"XWProductDetailViewController" bundle:nil];
    XWSearchResultItem *item =[self.results objectAtIndex:indexPath.row];

    detailViewController.productID =  item.productid;
//
//    // Pass the selected object to the new view controller.
//    
//    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
 

- (void)home{
    [self.navigationController popToRootViewControllerAnimated:true];

}

@end
