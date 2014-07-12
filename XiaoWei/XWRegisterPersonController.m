//
//  XWRegisterController.m
//  XiaoWei
//
//  Created by 张玮 on 14-5-21.
//  Copyright (c) 2014年 Tonknet. All rights reserved.
//

#import "XWRegisterPersonController.h"
#import "PSTextField.h"
#import "XWSingleSelectionTableViewController.h"
#import "XWSearchProductConditonViewController.h"
@interface XWRegisterPersonController ()

@end 

@implementation XWRegisterPersonController




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    if(indexPath.row == 0){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"rownew0"];
        cell.textLabel.text = @"*通过网站填写完整信息将有助于您获得更多银行的关注!!!!!";
        cell.textLabel.font = [UIFont systemFontOfSize:11];
        cell.textLabel.textColor =[UIColor redColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        /*  UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(80, 0.0, 200, 44.0)];
         lbl.text = @"宁波银行上海分行";
         lbl.font = [UIFont boldSystemFontOfSize:15];;
         lbl.textColor =UIColorFromRGB(0x9e9e9e);
         [cell.contentView addSubview:lbl];*/
    }
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 9){
        return 60;
    }else{
        return  44;
    }
}




#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
        
    }


@end
