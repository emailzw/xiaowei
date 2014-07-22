//
//  XWMymessageDetailController.m
//  XiaoWei
//
//  Created by 张玮 on 14-5-18.
//  Copyright (c) 2014年 Tonknet. All rights reserved.
//

#import "XWMymessageDetailController.h"
#import "XWContactBankViewController.h"

@interface XWMymessageDetailController ()

@end

@implementation XWMymessageDetailController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title =   [self.info objectForKey:@"leaveMessageReceiver"];
    
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
    
    NSArray *dialog  = [self.info objectForKey:@"dialog"];
    return dialog.count;
}





-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* customView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 38.0)];
    customView.backgroundColor =  UIColorFromRGB(0xf4f4f4);
    UILabel * headerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    headerLabel.backgroundColor = [UIColor clearColor];
    headerLabel.opaque = NO;
    headerLabel.textColor = [UIColor blackColor];
    headerLabel.highlightedTextColor = [UIColor whiteColor];
    headerLabel.font = [UIFont boldSystemFontOfSize:15];
    headerLabel.frame = CGRectMake(10.0, 4.0, 200, 30.0);
    headerLabel.text =  [self.info objectForKey:@"leaveMessageTitle"];
    
    [customView addSubview:headerLabel];
    
    
    return customView;
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MessgeCell";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:CellIdentifier];
    cell.accessoryType = UITableViewCellAccessoryNone;
    
    
    NSArray *dialog  = [self.info objectForKey:@"dialog"];
    NSDictionary *info = [dialog objectAtIndex:indexPath.row];
    
    
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(12, 4.0, 155.0, 20)];
    [lbl setFont:[UIFont systemFontOfSize:13]];
    lbl.text =  [info objectForKey:@"name"];
    if(indexPath.row %2 ==1){
        lbl.textColor = [UIColor redColor];
    }else{
        lbl.textColor = [UIColor blueColor];

    }

    [cell.contentView addSubview:lbl];
    
    
    //留言日期
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(200, 4, 120, 20)];
    lbl.text = [info objectForKey:@"dialogDate"];
    lbl.font = [UIFont systemFontOfSize:13];
    lbl.textColor =UIColorFromRGB(0x9e9e9e);
    [cell.contentView addSubview:lbl];
    
    
    //留言消息（mine）
    CGSize constrainedSize = CGSizeMake(300, 1000);
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(12, 23, 290, 30)];
    lbl.font = [UIFont systemFontOfSize:13];
    
    lbl.text = [info objectForKey:@"dialogContent"];
    CGSize msgSie = [lbl.text sizeWithFont:lbl.font constrainedToSize:constrainedSize lineBreakMode:NSLineBreakByWordWrapping];
    lbl.lineBreakMode = NSLineBreakByWordWrapping;
    lbl.numberOfLines = 0;
    
    [lbl setFrame:CGRectMake(12,23,290, msgSie.height)];
    lbl.textColor =UIColorFromRGB(0x000000);
    [cell.contentView addSubview:lbl];
    
    return cell;
    
    
    
    
    
    
}



/*


- (UIView *) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView *result = nil;
    UIButton *button =  [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle: @"回复" forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(contact) forControlEvents:UIControlEventTouchUpInside];
    
    
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:19];
    [button setBackgroundImage:[UIImage imageNamed:@"btn.png"] forState:UIControlStateNormal];
    //button.backgroundColor = [UIColor clearColor];
    
    [button sizeToFit];
    button.frame = CGRectMake(20,10.0f,280,38);
    //container的宽度比UILabel多出是个像素这些像素用于缩进
    //  CGRect resultFrame = CGRectMake(0.0f, 0.0f,button.frame.size.height,button.frame.size.width + 10.0f);
    
    result = [[UIView alloc] initWithFrame:button.frame ];
    [result addSubview:button];
    
    
    return result;
}
*/


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *dialog  = [self.info objectForKey:@"dialog"];
    if(indexPath.row <= dialog.count){
        
        NSDictionary *info = [dialog objectAtIndex:indexPath.row];
        NSString *message = [info objectForKey:@"dialogContent"];
        return [self getRowHeightByKey:message width:290];
    }else{
        return 44;
    }
}



-  (int) getRowHeightByKey: (NSString*) key width:(NSInteger) width{
    
    
    NSString *str  = key;
    
    CGSize constrainedSize = CGSizeMake(width, 1000);
    
    
    CGSize msgSie = [str sizeWithFont:[UIFont systemFontOfSize:13] constrainedToSize:constrainedSize lineBreakMode:NSLineBreakByWordWrapping];
    int height =  msgSie.height+30;
    return height > 48 ?height :48;
}


- (void)contact
{
    XWContactBankViewController  *controller = [[ XWContactBankViewController alloc] initWithNibName:@"XWContactBankViewController" bundle:nil];
    // controller.results = result;
    
    NSMutableDictionary *info = [[NSMutableDictionary alloc] init];
    
    [info setObject:[self.info objectForKey:@"leaveMessageReceiver"] forKey:@"reciever"];
    [info setObject:[self.info objectForKey:@"productID"]  forKey:@"productID"];
    
    controller.info  = info;
    [self.navigationController pushViewController:controller  animated:YES];
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
