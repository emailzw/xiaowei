//
//  XWLoginController.m
//  XiaoWei
//
//  Created by 张玮 on 14-7-13.
//  Copyright (c) 2014年 Tonknet. All rights reserved.
//

#import "XWLoginController.h"
#import "XWRegisterTabViewController.h"
@interface XWLoginController ()

@end

@implementation XWLoginController

NSString *code;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableview.dataSource =self;
    self.tableview.delegate=self;
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"用户登录";

    
    UIButton *button =  [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle: @"登录" forState:UIControlStateNormal];
    
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil] ;
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];

     [button addTarget:self action:@selector(commit) forControlEvents:UIControlEventTouchUpInside];
    
    
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:19];
    [button setBackgroundImage:[UIImage imageNamed:@"btn.png"] forState:UIControlStateNormal];
    
    [button sizeToFit];
    button.frame = CGRectMake(20,165,280,38);
     CGRect resultFrame = CGRectMake(0.0f, 0.0f,320,52);
    UIView *background = [[UIView alloc] initWithFrame:resultFrame];
    background.opaque = NO;
    
    background.backgroundColor = [UIColor redColor];
    [background addSubview:button];

    
    [self.view addSubview:button];
    
    
    
     button =  [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle: @"没有帐号？手机快速注册" forState:UIControlStateNormal];
    
    
    [button addTarget:self action:@selector(register) forControlEvents:UIControlEventTouchUpInside];
    
    
    [button setTitleColor:UIColorFromRGB(0x0000FF) forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:12];

    [button sizeToFit];
    button.frame = CGRectMake(10,215,150,38);


    
    [self.view addSubview:button];

    
    button =  [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle: @"忘记密码" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(forgetPassword) forControlEvents:UIControlEventTouchUpInside];
    
    
    // [button addTarget:self action:@selector(commit) forControlEvents:UIControlEventTouchUpInside];
    
    
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    
    [button sizeToFit];
    button.frame = CGRectMake(220,215,100,38);
    
    
    
    [self.view addSubview:button];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
        return 2;
   
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0){
        return 44;
    }else{
        return  44;
    }
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;

    if(indexPath.row == 0 && indexPath.section==0){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"row1"];
        // }else{
        //     return cell;
        // }
        cell.textLabel.text = @"用户名：";
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textLabel.textColor = UIColorFromRGB(0x000000);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UITextField  *tf = self.userCode;
        
        if(self.userCode == nil){
            self.userCode = [[PSTextField alloc] initWithFrame:CGRectMake(90, 4.5, 210,35)
                                                   cornerRadio:5
                                                   borderColor:RGB(166.0, 166.0, 166.0)
                                                   borderWidth:0
                                                    lightColor:RGB(55.0, 154.0, 255.0)
                                                     lightSize:8
                                              lightBorderColor:RGB(235.0, 235.0, 235.0)
                                               backgroundColor:UIColorFromRGB(0xdff0ff)
                             ];
            tf = self.userCode;
            
            tf.placeholder = @"";
            tf.delegate = self;
            tf.clearButtonMode = UITextFieldViewModeWhileEditing;
            
            tf.font = [UIFont systemFontOfSize:15];
            tf.textAlignment = NSTextAlignmentLeft;
            tf.keyboardType = UIKeyboardTypeDefault;
            tf.returnKeyType = UIReturnKeyDone;
        }
        [cell.contentView addSubview:tf];
        
    }
    else if(indexPath.row == 1 && indexPath.section==0){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"row2"];
        cell.textLabel.text = @"密码：";
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textLabel.textColor = UIColorFromRGB(0x000000);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UITextField  *tf  = self.password;
        if(self.password == nil){
            
            self.Password
            = [[PSTextField alloc] initWithFrame:CGRectMake(90, 4.5, 210,35)
                                     cornerRadio:5
                                     borderColor:RGB(166.0, 166.0, 166.0)
                                     borderWidth:0
                                      lightColor:RGB(55.0, 154.0, 255.0)
                                       lightSize:8
                                lightBorderColor:RGB(235.0, 235.0, 235.0)
                                 backgroundColor:UIColorFromRGB(0xdff0ff)
               ];
            tf  = self.password;
            tf.placeholder = @"";
            tf.delegate = self;
            tf.clearButtonMode = UITextFieldViewModeWhileEditing;
            tf.secureTextEntry = YES;
            
            tf.font = [UIFont systemFontOfSize:15];
            tf.textAlignment = NSTextAlignmentLeft;
            tf.keyboardType = UIKeyboardTypeDefault;
            tf.returnKeyType = UIReturnKeyDone;
        }
        [cell.contentView addSubview:tf];
        
    }
    
    return cell;
}



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

-(void) register{
    XWRegisterTabViewController *tabcontroler = [[XWRegisterTabViewController alloc] init];
    //[self.navigationController presentViewController:tabcontroler animated:true completion:nil];
    [self.navigationController pushViewController:tabcontroler animated:YES];
    
}

-(void) forgetPassword{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"请登录网站\nhttp://loan.sbacn.org\n找回您的密码"
                                                    message:nil
                                                   delegate:self
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil, nil];
    [alert show];
}




-(void) commit{
    
    
    NSString* trimedUsercode = [self.userCode.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if([trimedUsercode length]==0){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"请输入用户名"
                                                        message:nil
                                                       delegate:self
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    
    
     
    
    NSString* trimedPassword = [self.password.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if([trimedPassword length]==0){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"请输入用户密码"
                                                        message:nil
                                                       delegate:self
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    
    NSMutableString  *urlstring =  [[NSMutableString alloc] initWithString:SERVER_URL];
    [urlstring appendString:@"login"];
    NSURL *url = [NSURL URLWithString:urlstring];
    
    
    NSString *postString =[NSString stringWithFormat:
                           @"customerLoginNo=%@&customerPwd=%@",trimedUsercode,trimedPassword];
    
    
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
                                               UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"用户登录失败"
                                                                                               message:[NSString stringWithFormat:@"错误:%@,代码：%@",message,code]
                                                                                              delegate:self
                                                                                     cancelButtonTitle:@"确定"
                                                                                     otherButtonTitles:nil, nil];
                                               [alert show];
                                               return;
                                               
                                           }else{
                                               //注册用户 ID 到系统默认变量中
                                                NSDictionary *msgs = [rawresult objectForKey:@"message"];
                                               NSString *uid =[msgs objectForKey:@"customerID"];
                                               NSString *name =[msgs objectForKey:@"customerName"];

                                               //[[NSUserDefaults standardUserDefaults] registerDefaults:login];
                                              // [[NSUserDefaults standardUserDefaults] registerDefaults:loginName];

                                               [[NSUserDefaults standardUserDefaults] setObject:uid forKey:LOGIN];
                                               
                                               [[NSUserDefaults standardUserDefaults] setObject:name forKey:LOGIN_NAME];
                                               UIAlertView *view = [[UIAlertView alloc] initWithTitle:
                                                                    [NSString stringWithFormat:@"欢迎您,%@！",name]//标题
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


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if([code isEqualToString:@"101"]){
//        [self.navigationController popToRootViewControllerAnimated:true];
        [self.navigationController popViewControllerAnimated:true];
    }
}



@end
