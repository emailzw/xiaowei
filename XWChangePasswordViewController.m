//
//  XWChangePasswordViewController.m
//  XiaoWei
//
//  Created by 张玮 on 14-5-28.
//  Copyright (c) 2014年 Tonknet. All rights reserved.
//

#import "XWChangePasswordViewController.h"
#import "PSTextField.h"

@interface XWChangePasswordViewController ()

@end

@implementation XWChangePasswordViewController


NSString *code;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.title = @"密码修改";
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
        cell.textLabel.text = @"原密码：";
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textLabel.textColor = UIColorFromRGB(0x000000);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.oldpassoword= [[PSTextField alloc] initWithFrame:CGRectMake(90, 4.5, 210,35)
                                                  cornerRadio:5
                                                  borderColor:RGB(166.0, 166.0, 166.0)
                                                  borderWidth:0
                                                   lightColor:RGB(55.0, 154.0, 255.0)
                                                    lightSize:8
                                             lightBorderColor:RGB(235.0, 235.0, 235.0)
                                              backgroundColor:UIColorFromRGB(0xdff0ff)
                            ];
        self.oldpassoword.delegate = self;
        self.oldpassoword.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        self.oldpassoword.font = [UIFont systemFontOfSize:15];
        self.oldpassoword.textAlignment = NSTextAlignmentLeft;
        self.oldpassoword.keyboardType = UIKeyboardTypeDefault;
        self.oldpassoword.returnKeyType = UIReturnKeyDone;
        self.oldpassoword.secureTextEntry = YES;

        [cell.contentView addSubview:self.oldpassoword];
        
    }else if(indexPath.row == 1){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"row1"];
        cell.textLabel.text = @"新密码：";
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textLabel.textColor = UIColorFromRGB(0x000000);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        
        self.password = [[PSTextField alloc] initWithFrame:CGRectMake(90, 4.5, 210,35)
                                                  cornerRadio:5
                                                  borderColor:RGB(166.0, 166.0, 166.0)
                                                  borderWidth:0
                                                   lightColor:RGB(55.0, 154.0, 255.0)
                                                    lightSize:8
                                             lightBorderColor:RGB(235.0, 235.0, 235.0)
                                              backgroundColor:UIColorFromRGB(0xdff0ff)
                            ];
        self.password.delegate = self;
        self.password.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        self.password.font = [UIFont systemFontOfSize:15];
        self.password.textAlignment = NSTextAlignmentLeft;
        self.password.keyboardType = UIKeyboardTypeDefault;
        self.password.returnKeyType = UIReturnKeyDone;
        self.password.secureTextEntry = YES;

        [cell.contentView addSubview:self.password];
        
    }
    else if(indexPath.row == 2){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"row1"];
        cell.textLabel.text = @"确认密码：";
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textLabel.textColor = UIColorFromRGB(0x000000);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        
        self.password2 = [[PSTextField alloc] initWithFrame:CGRectMake(90, 4.5, 210,35)
                                                  cornerRadio:5
                                                  borderColor:RGB(166.0, 166.0, 166.0)
                                                  borderWidth:0
                                                   lightColor:RGB(55.0, 154.0, 255.0)
                                                    lightSize:8
                                             lightBorderColor:RGB(235.0, 235.0, 235.0)
                                              backgroundColor:UIColorFromRGB(0xdff0ff)
                            ];
        self.password2.delegate = self;
        self.password2.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        self.password2.font = [UIFont systemFontOfSize:15];
        self.password2.textAlignment = NSTextAlignmentLeft;
        self.password2.keyboardType = UIKeyboardTypeDefault;
        self.password2.returnKeyType = UIReturnKeyDone;
        self.password2.secureTextEntry = YES;
        [cell.contentView addSubview:self.password2];
        
        
    }
    return cell;

}




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
    NSString *uid =  [[NSUserDefaults standardUserDefaults] objectForKey:LOGIN];
   
    NSString* trimedoldpassoword = [self.oldpassoword.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if([trimedoldpassoword length]==0){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"请输入原密码"
                                                        message:nil
                                                       delegate:self
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    
    
    
    
    NSString* trimedPassword = [self.password.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if([trimedPassword length]==0){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"请输入新密码"
                                                        message:nil
                                                       delegate:self
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    
    
    NSString* trimedPassword2 = [self.password2.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if([trimedPassword2 length]==0){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"请输入确认密码"
                                                        message:nil
                                                       delegate:self
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil, nil];
        [alert show];
        return;
    }

    
    NSMutableString  *urlstring =  [[NSMutableString alloc] initWithString:SERVER_URL];
    [urlstring appendString:@"changePassword"];
    NSURL *url = [NSURL URLWithString:urlstring];
    
    
    NSString *postString =[NSString stringWithFormat:
                           @"customerID=%@&oldPwd=%@&newPwd=%@&newPwd2=%@",uid,trimedoldpassoword,trimedPassword,trimedPassword2];
    
    
    UIActivityIndicatorView *activityIndicator;
    activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)];
    CGPoint center  = CGPointMake(self.view.center.x, self.view.center.y-50);
    [activityIndicator setCenter:center];
    [activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [self.view addSubview:activityIndicator];
    
    [activityIndicator startAnimating];
    
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
                                               UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"密码修改失败"
                                                                                               message:[NSString stringWithFormat:@"错误:%@,代码：%@",message,code]
                                                                                              delegate:self
                                                                                     cancelButtonTitle:@"确定"
                                                                                     otherButtonTitles:nil, nil];
                                               [alert show];
                                               return;
                                               
                                           }else{
                                               UIAlertView *view = [[UIAlertView alloc] initWithTitle:
                                                                    [NSString stringWithFormat:@"密码修改成功！"]//标题
                                                                                              message:Nil   //显示内容
                                                                                             delegate:self          //委托，可以点击事件进行处理
                                                                                    cancelButtonTitle:nil
                                                                                    otherButtonTitles:@"确定",nil];
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

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if([code isEqualToString:@"101"]){
        [self.navigationController popViewControllerAnimated:true];
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



#pragma mark -  Textfield delegate

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
