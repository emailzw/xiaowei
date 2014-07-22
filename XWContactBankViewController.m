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

NSString *code;
UIView *foot;

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
        lbl.text = [self.info objectForKey:@"reciever"];
        lbl.font = [UIFont boldSystemFontOfSize:15];;
        lbl.textColor =UIColorFromRGB(0x9e9e9e);
        [cell.contentView addSubview:lbl];
    }else if(indexPath.row == 1){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"row1"];
        cell.textLabel.text = @"标题：";
        cell.textLabel.font = [UIFont boldSystemFontOfSize:15];
        cell.textLabel.textColor = UIColorFromRGB(0x000000);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        
        self.mtitle = [[PSTextField alloc] initWithFrame:CGRectMake(80, 4.5, 230,35)
                                                  cornerRadio:5
                                                  borderColor:RGB(166.0, 166.0, 166.0)
                                                  borderWidth:0
                                                   lightColor:RGB(55.0, 154.0, 255.0)
                                                    lightSize:8
                                             lightBorderColor:RGB(235.0, 235.0, 235.0)
                                              backgroundColor:UIColorFromRGB(0xdff0ff)
                            ];
        self.mtitle.delegate = self;
        self.mtitle.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        self.mtitle.font = [UIFont systemFontOfSize:15];
        self.mtitle.textAlignment = NSTextAlignmentLeft;
        self.mtitle.keyboardType = UIKeyboardTypeDefault;
        self.mtitle.returnKeyType = UIReturnKeyDone;
        //在弹出的键盘上面加一个view来放置退出键盘的Done按钮
        UIToolbar * topView = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
        [topView setBarStyle:UIBarStyleDefault];
        UIBarButtonItem * btnSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
        UIBarButtonItem * doneButton = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(dismissKeyBoard)];
        NSArray * buttonsArray = [NSArray arrayWithObjects:btnSpace, doneButton, nil];
        
        [topView setItems:buttonsArray];
        [self.mtitle setInputAccessoryView:topView];

        
//        self.title = [[PSTextField alloc] initWithFrame:CGRectMake(80, 4.5, 220,35)
//                                                  cornerRadio:5
//                                                  borderColor:RGB(166.0, 166.0, 166.0)
//                                                  borderWidth:0
//                                                   lightColor:RGB(55.0, 154.0, 255.0)
//                                                    lightSize:8
//                                             lightBorderColor:RGB(235.0, 235.0, 235.0)
//                                              backgroundColor:UIColorFromRGB(0xdff0ff)
//                            ];
//        self.title.placeholder = @"请输入您的留言标题";
//        self.title.delegate = self;
//        self.title.clearButtonMode = UITextFieldViewModeWhileEditing;
//        
//        self.title.font = [UIFont systemFontOfSize:15];
//        self.title.textAlignment = NSTextAlignmentLeft;
//        self.title.keyboardType = UIKeyboardTypeDefault;
//        self.title.returnKeyType = UIReturnKeyDone;
        [cell.contentView addSubview:self.mtitle];

    }
    else if(indexPath.row == 2){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"row2"];
        cell.textLabel.text = @"正文：";
        cell.textLabel.font = [UIFont boldSystemFontOfSize:15];
        cell.textLabel.textColor = UIColorFromRGB(0x000000);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
 
        self.utv = [[UITextView alloc]initWithFrame:CGRectMake(80,4.5,230,120)];
        self.utv.layer.borderColor = RGB(166.0, 166.0, 166.0).CGColor;
        self.utv.layer.borderWidth =0;
        self.utv.delegate = self;

        
        self.utv.layer.cornerRadius =5.0;
        self.utv.font = [UIFont systemFontOfSize:15];
        self.utv.backgroundColor = UIColorFromRGB(0xdff0ff);
        //在弹出的键盘上面加一个view来放置退出键盘的Done按钮
        UIToolbar * topView = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
        [topView setBarStyle:UIBarStyleDefault];
        UIBarButtonItem * btnSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
        UIBarButtonItem * doneButton = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(dismissKeyBoard)];
        NSArray * buttonsArray = [NSArray arrayWithObjects:btnSpace, doneButton, nil];
        
        [topView setItems:buttonsArray];
        [self.utv setInputAccessoryView:topView];
        [cell.contentView addSubview:self.utv];
        
    }else if(indexPath.row==3){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"row3"];

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
        [cell.contentView addSubview:button];

        
        
       
    }
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 2){
        return 130;
    }else {
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
    
    foot;
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
    
    foot = [[UIView alloc] initWithFrame:button.frame ];
    [foot addSubview:button];
    
    return foot;
}

-(void) commit{
    
    NSString *uid =  [[NSUserDefaults standardUserDefaults] objectForKey:LOGIN];

    
    NSString* trimedtitle = [self.mtitle.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if([trimedtitle length]==0){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"请留言标题"
                                                        message:nil
                                                       delegate:self
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    
    
    
    
    NSString* trimedMessage = [self.utv.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if([trimedMessage length]==0){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"请输入留言正文"
                                                        message:nil
                                                       delegate:self
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    
    NSMutableString  *urlstring =  [[NSMutableString alloc] initWithString:SERVER_URL];
    [urlstring appendString:@"message/leave"];
    NSURL *url = [NSURL URLWithString:urlstring];
    
    
    NSString *postString =[NSString stringWithFormat:
                           @"customerID=%@&productID=%@&LeaveMessageTitle=%@&LeaveMessageType=咨询&LeaveMessageContent=%@",uid,[self.info objectForKey:@"productID"],trimedtitle,trimedMessage  ];
    
    
    UIActivityIndicatorView *activityIndicator;
    activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)];
    CGPoint center  = CGPointMake(self.view.center.x, self.view.center.y-50);
    [activityIndicator setCenter:center];
    [activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [self.view addSubview:activityIndicator];
    
    [activityIndicator startAnimating];
    NSLog(postString);
    
    //将NSSrring格式的参数转换格式为NSData，POST提交必须用NSData数据。
    NSData *postData = [postString  dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    NSString *msgLength = [NSString stringWithFormat:@"%lu",(unsigned long)[postData length]];
    
    
    //这里设置为 application/x-www-form-urlencoded ，如果设置为其它的，比如text/html;charset=utf-8，或者 text/html 等，都会出错。不知道什么原因。
    [request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msgLength forHTTPHeaderField:@"Content-Length"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
    [request setTimeoutInterval:5.0];
    
    
    @try {
        
        
        //NSOperationQueue  *queue = [[NSOperationQueue alloc] init];
        [NSURLConnection sendAsynchronousRequest:request
                                           queue:[NSOperationQueue mainQueue]
                               completionHandler:^(NSURLResponse *response,  NSData *data, NSError *error) {
                                   if (error != nil) {
                                       NSLog(@"Error on load = %@", [error localizedDescription]);
                                       UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"对不起，服务故障，请稍后再试"
                                                                                       message:nil
                                                                                      delegate:self
                                                                             cancelButtonTitle:@"确定"
                                                                             otherButtonTitles:nil, nil];
                                       [activityIndicator stopAnimating];
                                       
                                       [alert show];
                                       
                                   }else {
                                       // check the HTTP status
                                       if ([response isKindOfClass:[NSHTTPURLResponse class]]) {                    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                                           if (httpResponse.statusCode != 200) {
                                               UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"对不起，服务故障，请稍后再试"
                                                                                               message:nil
                                                                                              delegate:self
                                                                                     cancelButtonTitle:@"确定"
                                                                                     otherButtonTitles:nil, nil];
                                               [activityIndicator stopAnimating];
                                               
                                               [alert show];
                                               return;
                                           }
                                           NSLog(@"Headers: %@", [httpResponse allHeaderFields]);
                                           NSDictionary  *rawresult = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves  error:&error];
                                           
                                           NSString *message = [rawresult objectForKey:@"message"];
                                           code = [rawresult objectForKey:@"code"];
                                           //  NSString *uid = [rawresult objectForKey:@"id"];
                                           
                                           NSLog(@"提交 %@", rawresult );
                                           [activityIndicator stopAnimating];
                                           
                                           if(![code isEqualToString:@"101"]){
                                               UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"留言提交失败"
                                                                                               message:[NSString stringWithFormat:@"错误:%@,代码：%@",message,code]
                                                                                              delegate:self
                                                                                     cancelButtonTitle:@"确定"
                                                                                     otherButtonTitles:nil, nil];
                                               [alert show];
                                               return;
                                               
                                           }else{
                                            UIAlertView *view = [[UIAlertView alloc] initWithTitle:
                                                                    [NSString stringWithFormat:@"留言提交成功，请等待银行工作人员的反馈"]//标题
                                                                                              message:Nil   //显示内容
                                                                                             delegate:self          //委托，可以点击事件进行处理
                                                                                    cancelButtonTitle:nil
                                                                                    otherButtonTitles:@"确定",　nil];
                                               [view show];
                                               
                                           }
                                       }
                                   }
                               }
         ];
    }@catch (NSException *exception) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"对不起，服务故障，请稍后再试"
                                                        message:nil
                                                       delegate:self
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil, nil];
        [activityIndicator stopAnimating];
        
        [alert show];
        return;
    }
    @finally {
        
    }

}


#pragma mark - UITextField Delegate Methods

//关闭键盘
-(void) dismissKeyBoard{
    [self.utv resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    //  if (theTextField == self.textField) {
    [theTextField resignFirstResponder];
    foot.hidden =false;

    //}
    return YES;
}


- (BOOL)textFieldDidEndEditing:(UITextField *)theTextField {
    [theTextField resignFirstResponder];
    foot.hidden =false;
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    foot.hidden =true;
    
}


- (BOOL)textViewDidEndEditing:(UITextField *)theTextField {
    [theTextField resignFirstResponder];
    foot.hidden =false;
    return YES;
}

- (void)textViewDidBeginEditing:(UITextField *)textField{
    
    foot.hidden =true;
    
}



- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if([code isEqualToString:@"101"]){
        [self.navigationController popViewControllerAnimated:true];
    }
    
}


@end
