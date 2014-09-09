//
//  XWBankListTableViewController.m
//  XiaoWei
//
//  Created by 张玮 on 14-8-14.
//  Copyright (c) 2014年 Tonknet. All rights reserved.
//

#import "XWBankListTableViewController.h"

@interface XWBankListTableViewController ()

@end

@implementation XWBankListTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
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

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return self.results.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ProductCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    //  if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:CellIdentifier];
    //}
    NSDictionary *item =[self.results objectAtIndex:indexPath.row];
    
    
    // cell.imageView.image =resizedImage;
    //银行名称
    
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(15, 4.0, 155.0, 30)];
    NSString *bankName =  [item objectForKey:@"bankName"];
    if(bankName == nil){
       bankName= @"";
    }
    
    lbl.text = bankName;
    lbl.font = [UIFont boldSystemFontOfSize:14];
    lbl.textColor = UIColorFromRGB(0xFF9933);
    [cell.contentView addSubview:lbl];
    
    //联系电话
    cell.accessoryType = UITableViewCellAccessoryNone;
   
    /*lbl = [[UILabel alloc] initWithFrame:CGRectMake(205.0, 5, 95.0, 30)];
   
    lbl.text = tel;
    lbl.font = [UIFont boldSystemFontOfSize:15];
    lbl.textColor =UIColorFromRGB(0x9e9e9e);*/
    
    NSString *tel =  [item objectForKey:@"tel"];
    if(tel == nil){
        tel= @"";
    }
    
    
    
    UITextView *utl = [[UITextView alloc] initWithFrame:CGRectMake(12, 41, 280, 25)];
    utl.text = [NSString stringWithFormat:@"联系电话：%@",tel];
    utl.backgroundColor = [UIColor clearColor];
    utl.editable = NO;
    utl.dataDetectorTypes = UIDataDetectorTypePhoneNumber;
    utl.font = [UIFont systemFontOfSize:13];
    utl.textAlignment = NSTextAlignmentLeft;

    [cell.contentView addSubview:utl];
    
    //地址
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(15, 26.0, 280, 25)];
    NSString *address =  [item objectForKey:@"address"];
    if(address == nil){
        address= @"";
    }
    lbl.text = address;

    lbl.font = [UIFont systemFontOfSize:11];
    lbl.textColor = UIColorFromRGB(0x0033cc);
    [cell.contentView addSubview:lbl];
        
    [cell.contentView addSubview:lbl];
    
    //工作时间
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(180, 4,140, 25)];
    NSString *workTime =  [item objectForKey:@"workTime"];
    if(workTime == nil){
        workTime= @"";
    }
    lbl.text = workTime;
    
    lbl.font = [UIFont systemFontOfSize:11];
    lbl.textColor = UIColorFromRGB(0x0033cc);
    [cell.contentView addSubview:lbl];
    
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

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

@end
