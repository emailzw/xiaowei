//
//  XWContactBankViewController.m
//  XiaoWei
//
//  Created by 张玮 on 14-5-12.
//  Copyright (c) 2014年 Tonknet. All rights reserved.
//

#import "XWContactBankViewController.h"
#import "PSTextField.h"
#import "XWMyMessageController.h"
#import "XWMessageListItem.h"

@interface XWContactBankViewController ()

@end

@implementation XWContactBankViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"联系银行";

    
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

    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    if(indexPath.row == 0){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"row0"];
        cell.textLabel.text = @"收件人：";
        cell.textLabel.font = [UIFont boldSystemFontOfSize:15];
        cell.textLabel.textColor = UIColorFromRGB(0x000000);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(80, 0.0, 200, 44.0)];
        lbl.text = @"宁波银行上海分行";
        lbl.font = [UIFont boldSystemFontOfSize:15];;
        lbl.textColor =UIColorFromRGB(0x9e9e9e);
        [cell.contentView addSubview:lbl];
    }else if(indexPath.row == 1){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"row1"];
        cell.textLabel.text = @"标题：";
        cell.textLabel.font = [UIFont boldSystemFontOfSize:15];
        cell.textLabel.textColor = UIColorFromRGB(0x000000);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        
        UITextField  *tf = [[PSTextField alloc] initWithFrame:CGRectMake(80, 4.5, 220,35)
                                                  cornerRadio:5
                                                  borderColor:RGB(166.0, 166.0, 166.0)
                                                  borderWidth:0
                                                   lightColor:RGB(55.0, 154.0, 255.0)
                                                    lightSize:8
                                             lightBorderColor:RGB(235.0, 235.0, 235.0)
                                              backgroundColor:UIColorFromRGB(0xdff0ff)
                            ];
        tf.placeholder = @"请输入您的留言标题";
        tf.delegate = self;
        tf.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        tf.font = [UIFont systemFontOfSize:15];
        tf.textAlignment = NSTextAlignmentLeft;
        tf.keyboardType = UIKeyboardTypeDefault;
        tf.returnKeyType = UIReturnKeyDone;
        [cell.contentView addSubview:tf];

    }
    else if(indexPath.row == 2){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"row2"];
        cell.textLabel.text = @"正文：";
        cell.textLabel.font = [UIFont boldSystemFontOfSize:15];
        cell.textLabel.textColor = UIColorFromRGB(0x000000);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
//        
//    UITextField  *tf = [[PSTextField alloc] initWithFrame:CGRectMake(80, 4.5, 220,120)
//                                                  cornerRadio:5
//                                                  borderColor:RGB(166.0, 166.0, 166.0)
//                                                  borderWidth:0
//                                                   lightColor:RGB(55.0, 154.0, 255.0)
//                                                    lightSize:8
//                                             lightBorderColor:RGB(235.0, 235.0, 235.0)
//                                              backgroundColor:UIColorFromRGB(0xdff0ff)
//                            ];
//        tf.placeholder = @"请输入您的留言内容";
//        tf.delegate = self;
//        tf.clearButtonMode = UITextFieldViewModeWhileEditing;
//        tf.
//        
//        tf.font = [UIFont systemFontOfSize:15];
//        tf.textAlignment = NSTextAlignmentLeft;
//        tf.keyboardType = UIKeyboardTypeDefault;
//        tf.returnKeyType = UIReturnKeyDone;
//        [cell.contentView addSubview:tf];
        
        UITextView *utv = [[UITextView alloc]initWithFrame:CGRectMake(80,4.5,220,120)];
        utv.layer.borderColor = RGB(166.0, 166.0, 166.0).CGColor;
        utv.layer.borderWidth =0;
        
        utv.layer.cornerRadius =5.0;
        utv.font = [UIFont systemFontOfSize:15];
        utv.backgroundColor = UIColorFromRGB(0xdff0ff);
        [cell.contentView addSubview:utv];
        self.utv=utv;
        
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 2){
        return 130;
    }else{
        return  44;
    }
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




- (UIView *) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView *result = nil;
    UIButton *button =  [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle: @"确定" forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(commit) forControlEvents:UIControlEventTouchUpInside];
    
    
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
    
    /*
    //在弹出的键盘上面加一个view来放置退出键盘的Done按钮
    UIToolbar * topView = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    [topView setBarStyle:UIBarStyleDefault];
    UIBarButtonItem * btnSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem * doneButton = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(dismissKeyBoard)];
    NSArray * buttonsArray = [NSArray arrayWithObjects:btnSpace, doneButton, nil];
  
    [topView setItems:buttonsArray];
    [self.utv setInputAccessoryView:topView];*/
    
    return result;
}

-(void) commit{
   /* NSMutableArray *result = [[NSMutableArray alloc] init];
    XWMessageListItem *item = [[XWMessageListItem alloc] init];
    
    item.messageTitle = @"关于“三年贷”产品的咨询";
    item.postDate = @"2014/4/15";
    item.status = @"已读取";
    
    [result addObject:item];
    
    XWMyMessageController *controller = [[ XWMyMessageController alloc] initWithNibName:@"XWMyMessageController" bundle:nil];
    controller.results = result;
    controller.title = @"我的留言";
    
    [self.navigationController pushViewController:controller  animated:YES];*/
    
    
    
    UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"你的留言已提交"    //标题
                                                   message:Nil   //显示内容
                                                  delegate:self          //委托，可以点击事件进行处理
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"确定"
                         //,@"其他",    //添加其他按钮
                         　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　,　 nil];
    [view show];

  //  [self.navigationController popViewControllerAnimated:true];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self.navigationController popViewControllerAnimated:true];

}

#pragma mark - UITextField Delegate Methods

//关闭键盘
-(void) dismissKeyBoard{
    [self.utv resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    //  if (theTextField == self.textField) {
    [theTextField resignFirstResponder];
    //}
    return YES;
}


- (BOOL)textFieldDidEndEditing:(UITextField *)theTextField {
    //  if (theTextField == self.textField) {
    [theTextField resignFirstResponder];
    //}
    return YES;
}

@end
