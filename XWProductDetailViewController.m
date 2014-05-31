//
//  XWProductDetailViewController.m
//  XiaoWei
//
//  Created by 张玮 on 14-5-5.
//  Copyright (c) 2014年 Tonknet. All rights reserved.
//

#import "XWProductDetailViewController.h"
#import "XWContactBankViewController.h"

@interface XWProductDetailViewController ()

@end

@implementation XWProductDetailViewController

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
    
    self.navigationItem.title = @"产品详情";

    UIButton *favoButton = [UIButton buttonWithType:101];

    [favoButton addTarget:self action:@selector(favorite) forControlEvents:UIControlEventTouchUpInside];
    [favoButton setTitle:@"收藏" forState:UIControlStateNormal];
    
    UIBarButtonItem *favaItem = [[UIBarButtonItem alloc] initWithCustomView:favoButton];
    
    
    favaItem.tintColor = [UIColor whiteColor];
    [favaItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                      [UIColor whiteColor],NSForegroundColorAttributeName,
                                      [UIFont boldSystemFontOfSize:19], NSFontAttributeName, nil] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem =  favaItem;


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
    return 15;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
   /* UITableViewCell  *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    UILabel *lbl = [[[cell contentView] subviews] objectAtIndex:0];
    return lbl.frame.size.height;

    if (indexPath.section == 0 && indexPath.row == 0) {
        return 132;
    } else {
        return 38;
    }
    
    return cell.frame.size.height;*/
    
    if (indexPath.row == 3){
        return 50;

    }else  if (indexPath.row == 14){
        return 55;
        
    }
    
    else{
        return 38;
    }
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.font = [UIFont systemFontOfSize:13];
        cell.textLabel.textColor = [UIColor blackColor];
        cell.accessoryType = UITableViewCellAccessoryNone;

        
    }
    
    if(indexPath.row == 0){
        cell.textLabel.text = @"银行名称：";

        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(120, 0.0, 150, 38)];
        lbl.text = @"宁波银行上海分行";
        lbl.font = [UIFont systemFontOfSize:13];;
        lbl.textColor =UIColorFromRGB(0x6e6e6e);
        lbl.textAlignment = NSTextAlignmentLeft;
        [cell.contentView addSubview:lbl];
        UIButton  *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        CGRect frame = CGRectMake(250, 1, 65, 35);
        
        
        [button setFrame:frame];
        [button setTitle: @" 联系银行" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

        
        [button addTarget:self action:@selector(contact) forControlEvents:UIControlEventTouchUpInside];
        
        
        button.titleLabel.font = [UIFont boldSystemFontOfSize:12];
        button.titleLabel.textColor = [UIColor whiteColor];
        button.backgroundColor = UIColorFromRGB(0x2586d4);
        [cell.contentView addSubview:button];
         
         
         
//        lbl = [[UILabel alloc] initWithFrame:CGRectMake(260, 1, 60, 35)];
//        lbl.font = [UIFont systemFontOfSize:11];
//        lbl.text = @"联系银行";
//        lbl.textColor = [UIColor whiteColor];
//        lbl.backgroundColor = [UIColor blueColor];
//        lbl.textAlignment = NSTextAlignmentCenter;
//        [lbl addTarget:self action:@selector(confirm) forControlEvents:UIControlEventTouchUpInside];

     //   [cell.contentView addSubview:lbl];

        
        
    }else if(indexPath.row == 1){
        cell.textLabel.text = @"产品名称：";
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(120, 0.0, 150, 38)];
        lbl.text = @"贷易融";
        lbl.font = [UIFont systemFontOfSize:13];
        lbl.textColor =UIColorFromRGB(0x6e6e6e);
        lbl.textAlignment = NSTextAlignmentLeft;

        [cell.contentView addSubview:lbl];

    }else if(indexPath.row == 2){
        cell.textLabel.text = @"业务实质：";
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(120, 0.0, 150, 38)];
        lbl.text = @"企业流动资金贷款";
        lbl.font = [UIFont systemFontOfSize:13];
        lbl.textColor =UIColorFromRGB(0x6e6e6e);
        lbl.textAlignment = NSTextAlignmentLeft;
        
        [cell.contentView addSubview:lbl];
        
    }else if(indexPath.row == 3){
        cell.textLabel.text = @"贷款主体：";
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(120, 0.0, 180, 0)];
        lbl.font = [UIFont systemFontOfSize:13];
        lbl.text = @"企业类型：制造业企业，服务业企业，科技型企业，批发，零售企业";
        lbl.lineBreakMode = NSLineBreakByWordWrapping;
        lbl.numberOfLines = 0;
        
        lbl.font = [UIFont systemFontOfSize:13];
        lbl.textColor =UIColorFromRGB(0x6e6e6e);
        lbl.textAlignment = NSTextAlignmentLeft;
        
        
        CGSize constrainedSize = CGSizeMake(180, 1000);
        
        
        CGSize msgSie = [lbl.text sizeWithFont:lbl.font constrainedToSize:constrainedSize lineBreakMode:NSLineBreakByWordWrapping];
        
        [lbl setFrame:CGRectMake(120, 0, 180, msgSie.height)];
        [cell.contentView addSubview:lbl];
        
    }else if(indexPath.row == 4){
        cell.textLabel.text = @"企业成立年限：";
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(120, 0.0, 150, 38)];
        lbl.text = @"1年";
        lbl.font = [UIFont systemFontOfSize:13];
        lbl.textColor =UIColorFromRGB(0x6e6e6e);
        lbl.textAlignment = NSTextAlignmentLeft;
        
        [cell.contentView addSubview:lbl];
        
    }else if(indexPath.row == 5){
        cell.textLabel.text = @"企业注册地：";
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(120, 0.0, 150, 38)];
        lbl.text = @"本地";
        lbl.font = [UIFont systemFontOfSize:13];
        lbl.textColor =UIColorFromRGB(0x6e6e6e);
        lbl.textAlignment = NSTextAlignmentLeft;
        
        [cell.contentView addSubview:lbl];
        
    }else if(indexPath.row == 6 ){
        cell.textLabel.text = @"营业收入：";
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(120, 0.0, 150, 38)];
        lbl.text = @"1000000";
        lbl.font = [UIFont systemFontOfSize:13];
        lbl.textColor =UIColorFromRGB(0x6e6e6e);
        lbl.textAlignment = NSTextAlignmentLeft;
        lbl.lineBreakMode = NSLineBreakByWordWrapping;
        lbl.numberOfLines = 0;
        [cell.contentView addSubview:lbl];

        
        lbl = [[UILabel alloc] initWithFrame:CGRectMake(260, 0.0, 140, 38)];
        lbl.text = @"（万元）";
        lbl.font = [UIFont systemFontOfSize:13];
        lbl.textAlignment = NSTextAlignmentLeft;
        
        [cell.contentView addSubview:lbl];
        
    }else if(indexPath.row == 7 ){
        cell.textLabel.text = @"企业总资产：";
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(120, 0.0, 150, 38)];
        lbl.text = @"不限";
        lbl.font = [UIFont systemFontOfSize:13];
        lbl.textColor =UIColorFromRGB(0x6e6e6e);
        lbl.textAlignment = NSTextAlignmentLeft;
        [cell.contentView addSubview:lbl];
        
        
        lbl = [[UILabel alloc] initWithFrame:CGRectMake(260, 0.0, 140, 38)];
        lbl.text = @"（万元）";
        lbl.font = [UIFont systemFontOfSize:13];
        lbl.textAlignment = NSTextAlignmentLeft;
        
        [cell.contentView addSubview:lbl];
        
    }else if(indexPath.row == 8 ){
        cell.textLabel.text = @"担保方式：";
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(120, 0.0, 150, 38)];
        lbl.text = @"抵押：厂房，商业房产";
        lbl.font = [UIFont systemFontOfSize:13];
        lbl.textColor =UIColorFromRGB(0x6e6e6e);
        lbl.textAlignment = NSTextAlignmentLeft;
        lbl.lineBreakMode = NSLineBreakByWordWrapping;
        lbl.numberOfLines = 0;
        [cell.contentView addSubview:lbl];
        
    }else if(indexPath.row == 9 ){
        cell.textLabel.text = @"额度：";
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(120, 0.0, 150, 38)];
        lbl.text = @"上限：1000.00;下限：不限";
        lbl.font = [UIFont systemFontOfSize:13];
        lbl.textColor =UIColorFromRGB(0x6e6e6e);
        lbl.textAlignment = NSTextAlignmentLeft;
        lbl.lineBreakMode = NSLineBreakByWordWrapping;
        lbl.numberOfLines = 0;
        [cell.contentView addSubview:lbl];
        
        
        lbl = [[UILabel alloc] initWithFrame:CGRectMake(260, 0.0, 140, 38)];
        lbl.text = @"（万元）";
        lbl.font = [UIFont systemFontOfSize:13];
        lbl.textAlignment = NSTextAlignmentLeft;
        
        [cell.contentView addSubview:lbl];
        
    }else if(indexPath.row == 10 ){
        cell.textLabel.text = @"贷款期限：";
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(120, 0.0, 150, 38)];
        lbl.text = @"上限：12;下限：不限";
        lbl.font = [UIFont systemFontOfSize:13];
        lbl.textColor =UIColorFromRGB(0x6e6e6e);
        lbl.textAlignment = NSTextAlignmentLeft;
        lbl.lineBreakMode = NSLineBreakByWordWrapping;
        lbl.numberOfLines = 0;
        [cell.contentView addSubview:lbl];
        
        
        lbl = [[UILabel alloc] initWithFrame:CGRectMake(260, 0.0, 140, 38)];
        lbl.text = @"（月）";
        lbl.font = [UIFont systemFontOfSize:13];
        lbl.textAlignment = NSTextAlignmentLeft;
        
        [cell.contentView addSubview:lbl];
        
    }else if(indexPath.row == 11 ){
        cell.textLabel.text = @"还款方式：";
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(120, 0.0, 150, 38)];
        lbl.text = @"随借随还";
        lbl.font = [UIFont systemFontOfSize:13];
        lbl.textColor =UIColorFromRGB(0x6e6e6e);
        lbl.textAlignment = NSTextAlignmentLeft;
        [cell.contentView addSubview:lbl];
        
    }else if(indexPath.row == 12 ){
        cell.textLabel.text = @"审批时间：";
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(120, 0.0, 150, 38)];
        lbl.text = @"5工作日";
        lbl.font = [UIFont systemFontOfSize:13];
        lbl.textColor =UIColorFromRGB(0x6e6e6e);
        lbl.textAlignment = NSTextAlignmentLeft;
        [cell.contentView addSubview:lbl];
        
        
    }else if(indexPath.row == 13 ){
        cell.textLabel.text = @"产品特点：";
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(120, 0.0, 150, 38)];
        lbl.text = @"";
        lbl.font = [UIFont systemFontOfSize:13];
        lbl.textColor =UIColorFromRGB(0x6e6e6e);
        lbl.textAlignment = NSTextAlignmentLeft;
        [cell.contentView addSubview:lbl];
        
    }else if (indexPath.row ==14){
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"footer"];
        UIButton *button =  [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button setTitle: @"联系银行" forState:UIControlStateNormal];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [button addTarget:self action:@selector(contact) forControlEvents:UIControlEventTouchUpInside];
        
        
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont boldSystemFontOfSize:19];
        [button setBackgroundImage:[UIImage imageNamed:@"btn.png"] forState:UIControlStateNormal];
        //button.backgroundColor = [UIColor clearColor];
        
        [button sizeToFit];
        button.frame = CGRectMake(20,10.0f,280,38);
        //container的宽度比UILabel多出是个像素这些像素用于缩进
        CGRect resultFrame = CGRectMake(0.0f, 0.0f,320,52);
        UIView *background = [[UIView alloc] initWithFrame:resultFrame];
        background.opaque = NO;
        
        background.backgroundColor = [UIColor redColor];
        [background addSubview:button];
        
        /*
         UIView *tempView = [[UIView alloc] init];
         
         [cell setBackgroundView:tempView];
         [cell setBackgroundColor:[UIColor clearColor]];*/
        
        
        [cell addSubview:button];

        
    }

    
    
    
    return cell;
}



-(void)favorite{
    
    
    
    
    UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"收藏成功！"    //标题
                                                  message:Nil   //显示内容
                                                 delegate:nil          //委托，可以点击事件进行处理
                                        cancelButtonTitle:nil
                                        otherButtonTitles:@"确定"
                         //,@"其他",    //添加其他按钮
                         　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　,　 nil];
    [view show];
}

- (void)contact
{
   XWContactBankViewController  *controller = [[ XWContactBankViewController alloc] initWithNibName:@"XWContactBankViewController" bundle:nil];
   // controller.results = result;
    controller.title = @"资金需求为1万、贷款期限为2月、 本地注册资金为100万、担保方式为";
    
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

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];

    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
 
 */

@end
