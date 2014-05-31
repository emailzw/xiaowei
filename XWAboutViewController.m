//
//  XWAboutViewController.m
//  XiaoWei
//
//  Created by 张玮 on 14-5-28.
//  Copyright (c) 2014年 Tonknet. All rights reserved.
//

#import "XWAboutViewController.h"

@interface XWAboutViewController ()

@end

@implementation XWAboutViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title=@"关于我们";
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}



-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.section==0){
        return 190;
    }else if (indexPath.section==3&& indexPath.row==0){
        return 270;
    }else if(indexPath.section==2){
        return 35;
    }else {
        return 40;
    }
}



-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    if(section ==0){
        UIView* customView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 38.0)];
        customView.backgroundColor =  UIColorFromRGB(0xf4f4f4);
        UILabel * headerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        headerLabel.backgroundColor = [UIColor clearColor];
        headerLabel.opaque = NO;
        headerLabel.textColor = [UIColor blackColor];
        headerLabel.highlightedTextColor = [UIColor whiteColor];
        headerLabel.font = [UIFont boldSystemFontOfSize:15];
        headerLabel.frame = CGRectMake(10.0, 4.0, 320, 30.0);
        headerLabel.text =  @"APP 说明";
        headerLabel.textAlignment = NSTextAlignmentCenter;
        [customView addSubview:headerLabel];
        return customView;
    }else if (section ==1){
        UIView* customView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 38.0)];
        customView.backgroundColor =  UIColorFromRGB(0xf4f4f4);
        UILabel * headerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        headerLabel.backgroundColor = [UIColor clearColor];
        headerLabel.opaque = NO;
        headerLabel.textColor = [UIColor blackColor];
        headerLabel.highlightedTextColor = [UIColor whiteColor];
        headerLabel.font = [UIFont boldSystemFontOfSize:15];
        headerLabel.frame = CGRectMake(10.0, 4.0, 320, 30.0);
        headerLabel.text =  @"软件版本";
        headerLabel.textAlignment = NSTextAlignmentCenter;
        [customView addSubview:headerLabel];
        return customView;

    }else if (section ==2){
        UIView* customView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 38.0)];
        customView.backgroundColor =  UIColorFromRGB(0xf4f4f4);
        UILabel * headerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        headerLabel.backgroundColor = [UIColor clearColor];
        headerLabel.opaque = NO;
        headerLabel.textColor = [UIColor blackColor];
        headerLabel.highlightedTextColor = [UIColor whiteColor];
        headerLabel.font = [UIFont boldSystemFontOfSize:15];
        headerLabel.frame = CGRectMake(10.0, 4.0, 320, 30.0);
        headerLabel.text =  @"网址";
        headerLabel.textAlignment = NSTextAlignmentCenter;
        [customView addSubview:headerLabel];
        return customView;
    }else if (section ==3){
        UIView* customView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 38.0)];
        customView.backgroundColor =  UIColorFromRGB(0xf4f4f4);
        UILabel * headerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        headerLabel.backgroundColor = [UIColor clearColor];
        headerLabel.opaque = NO;
        headerLabel.textColor = [UIColor blackColor];
        headerLabel.highlightedTextColor = [UIColor whiteColor];
        headerLabel.font = [UIFont boldSystemFontOfSize:15];
        headerLabel.frame = CGRectMake(10.0, 4.0, 320, 30.0);
        headerLabel.text =  @"免责申明";
        headerLabel.textAlignment = NSTextAlignmentCenter;
        [customView addSubview:headerLabel];
        return customView;
    }else if (section ==4){
        UIView* customView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 38.0)];
        customView.backgroundColor =  UIColorFromRGB(0xf4f4f4);
        UILabel * headerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        headerLabel.backgroundColor = [UIColor clearColor];
        headerLabel.opaque = NO;
        headerLabel.textColor = [UIColor blackColor];
        headerLabel.highlightedTextColor = [UIColor whiteColor];
        headerLabel.font = [UIFont boldSystemFontOfSize:15];
        headerLabel.frame = CGRectMake(10.0, 4.0, 320, 30.0);
        headerLabel.text =  @"免责申明";
        headerLabel.textAlignment = NSTextAlignmentCenter;
        [customView addSubview:headerLabel];
        return customView;
    }

    return nil;

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

    if(indexPath.section == 0 && indexPath.row==0){
        
        
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0.0, 320, 0)];
        lbl.font = [UIFont systemFontOfSize:13];
        lbl.text = @"　　本应用是一款立足于服务小微企业的公益性平台，汇集了上海54家中外资商业银行的200多款服务小微企业的特色金融产品。本应用的发布将增进银企信息对接、提高银行业服务小微企业信贷产品信息的便捷性。\n　　您可直接登录平台，通过企业类型、担保方式、成立年限等要素，全方位、个性化地查找符合自身需求的银行产品。同时，平台以通俗易懂的文字向用户描述各产品的审批标准、审批时限、产品特点、担保方式等内容，并提供了产品信息的银行网页链接及热线电话，以便用户对查询结果做深入了解和比较。";
        lbl.lineBreakMode = NSLineBreakByWordWrapping;
        lbl.numberOfLines = 0;
        
        lbl.font = [UIFont systemFontOfSize:13];
        lbl.textColor =UIColorFromRGB(0x6e6e6e);
        lbl.textAlignment = NSTextAlignmentJustified;
        
        
        CGSize constrainedSize = CGSizeMake(300, 1000);
        
        
        CGSize msgSie = [lbl.text sizeWithFont:lbl.font constrainedToSize:constrainedSize lineBreakMode:NSLineBreakByWordWrapping];
        
        [lbl setFrame:CGRectMake(10, 10, 300, msgSie.height)];
        [cell.contentView addSubview:lbl];

        
        
        
    }else if(indexPath.section == 1 && indexPath.row==0){
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0.0, 320, 38)];
        lbl.text = @"V1.0";
        lbl.font = [UIFont systemFontOfSize:13];
        lbl.textColor =UIColorFromRGB(0x6e6e6e);
        lbl.textAlignment = NSTextAlignmentCenter;
        
        [cell.contentView addSubview:lbl];
        
    }else if(indexPath.section == 2 && indexPath.row==0){
       
        UITextView *utl = [[UITextView alloc] initWithFrame:CGRectMake(0, 0.0, 320, 38)];
        utl.text = @"http://loan.sbacn.org";
        utl.editable = NO;
        utl.dataDetectorTypes = UIDataDetectorTypeAll;
        utl.font = [UIFont systemFontOfSize:14];
        //lbl.textColor =UIColorFromRGB(0x6e6e6e);
        utl.textAlignment = NSTextAlignmentCenter;
        
        [cell.contentView addSubview:utl];
        
    }else if(indexPath.section == 3 && indexPath.row==0){
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0.0, 320, 0)];
        lbl.text = @"上海市银行同业公会提醒您：\n在使用本查询平台前，请务必仔细阅读并彻底理解本声明。\n1. 本平台是上海市银行同业公会开发设计，免费供广大小微企业和个人客户使用的小微企业信贷产品查询平台;\n2. 本平台所含产品的相关内容均由本市各大银行提供，由于各行产品更新较快，上海市银行同业公会不保证产品相关信息的及时性和准确性，请与各行相关部门确认产品最新信息；\n3. 使用本平台的所有用户应合理、规范地使用本平台，不得使用非法手段对本平台进行攻击、破坏，否则将被追究其法律责任；\n4. 本平台的最终解释权归上海市银行同业公会所有；\5. 上海市银行同业公会的联系邮箱：zlgfb@sbacn.org。";
        lbl.lineBreakMode = NSLineBreakByWordWrapping;
        lbl.numberOfLines = 0;
        
        lbl.font = [UIFont systemFontOfSize:13];
        lbl.textColor =UIColorFromRGB(0x6e6e6e);
        lbl.textAlignment = NSTextAlignmentJustified;
        
        
        CGSize constrainedSize = CGSizeMake(300, 1000);
        
        
        CGSize msgSie = [lbl.text sizeWithFont:lbl.font constrainedToSize:constrainedSize lineBreakMode:NSLineBreakByWordWrapping];
        
        [lbl setFrame:CGRectMake(10, 10, 300, msgSie.height)];
        [cell.contentView addSubview:lbl];
        

        
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
