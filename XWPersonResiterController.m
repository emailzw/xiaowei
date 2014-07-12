//
//  XWComanyResiterController.m
//  XiaoWei
//
//  Created by 张玮 on 14-5-21.
//  Copyright (c) 2014年 Tonknet. All rights reserved.
//

#import "XWPersonResiterController.h"
#import "PSTextField.h"
#import "XWSearchProductConditonViewController.h"

@interface XWPersonResiterController ()

@end

@implementation XWPersonResiterController






- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 6;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    if(indexPath.row == 0){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"row0"];
        cell.textLabel.text = @"*通过网站填写完整信息将有助于您获得更多银行的关注";
        cell.textLabel.font = [UIFont systemFontOfSize:11];
        cell.textLabel.textColor =[UIColor redColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }else if(indexPath.row == 1){
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
    else if(indexPath.row == 2){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"row2"];
        cell.textLabel.text = @"密码：";
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textLabel.textColor = UIColorFromRGB(0x000000);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UITextField  *tf  = self.Password;
        if(self.Password == nil){
            
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
            tf  = self.Password;
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
    
    /*else if(indexPath.row == 3){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"row3"];
        cell.textLabel.text = @"确认密码：";
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textLabel.textColor = UIColorFromRGB(0x000000);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        self.Password2
        = [[PSTextField alloc] initWithFrame:CGRectMake(90, 4.5, 210,35)
                                 cornerRadio:5
                                 borderColor:RGB(166.0, 166.0, 166.0)
                                 borderWidth:0
                                  lightColor:RGB(55.0, 154.0, 255.0)
                                   lightSize:8
                            lightBorderColor:RGB(235.0, 235.0, 235.0)
                             backgroundColor:UIColorFromRGB(0xdff0ff)
           ];
        UITextField  *tf  = self.Password2;
        tf.placeholder = @"";
        tf.delegate = self;
        tf.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        tf.font = [UIFont systemFontOfSize:15];
        tf.textAlignment = NSTextAlignmentLeft;
        tf.keyboardType = UIKeyboardTypeDefault;
        tf.returnKeyType = UIReturnKeyDone;
        [cell.contentView addSubview:tf];
        
    }
     */
     else if(indexPath.row == 3){
        
        //   cell = //[tableView dequeueReusableCellWithIdentifier:@"row1"];
        // if (cell == nil || true) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"row11"];
        // }else{
        //     return cell;
        // }
        cell.textLabel.text = @"姓名：";
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textLabel.textColor = UIColorFromRGB(0x000000);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UITextField  *tf =self.customerName ;
        
        if(self.customerName == nil){
            self.customerName = [[PSTextField alloc] initWithFrame:CGRectMake(90, 4.5, 210,35)
                                                   cornerRadio:5
                                                   borderColor:RGB(166.0, 166.0, 166.0)
                                                   borderWidth:0
                                                    lightColor:RGB(55.0, 154.0, 255.0)
                                                     lightSize:8
                                              lightBorderColor:RGB(235.0, 235.0, 235.0)
                                               backgroundColor:UIColorFromRGB(0xdff0ff)
                             ];
            tf = self.customerName;
            
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
    
    
    else if(indexPath.row == 4){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"row4"];
        cell.tag = 4;
        cell.textLabel.text = @"出生年月：";
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textLabel.textColor = UIColorFromRGB(0x000000);
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(230.0, 0.0, 100.0, 44.0)];
        lbl.text = @"请选择";
        lbl.font = [UIFont boldSystemFontOfSize:15];;
        lbl.textColor =UIColorFromRGB(0x9e9e9e);
        [cell.contentView addSubview:lbl];
        
    } else if(indexPath.row == 5){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"row7"];
        cell.textLabel.text = @"所属公司：";
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textLabel.textColor = UIColorFromRGB(0x000000);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.company = [[PSTextField alloc] initWithFrame:CGRectMake(90, 4.5, 210,35)
                                                    cornerRadio:5
                                                    borderColor:RGB(166.0, 166.0, 166.0)
                                                    borderWidth:0
                                                     lightColor:RGB(55.0, 154.0, 255.0)
                                                      lightSize:8
                                               lightBorderColor:RGB(235.0, 235.0, 235.0)
                                                backgroundColor:UIColorFromRGB(0xdff0ff)
                              ];
        
        UITextField  *tf = self.company;
        tf.placeholder = @"";
        tf.delegate = self;
        tf.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        tf.font = [UIFont systemFontOfSize:15];
        tf.textAlignment = NSTextAlignmentLeft;
        tf.keyboardType = UIKeyboardTypeDefault;
        tf.returnKeyType = UIReturnKeyDone;
        [cell.contentView addSubview:tf];
        
    }else if(indexPath.row == 6){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"row8"];
        cell.textLabel.text = @"联系电话：";
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textLabel.textColor = UIColorFromRGB(0x000000);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.contactPhone
        
        = [[PSTextField alloc] initWithFrame:CGRectMake(90, 4.5, 210,35)
                                 cornerRadio:5
                                 borderColor:RGB(166.0, 166.0, 166.0)
                                 borderWidth:0
                                  lightColor:RGB(55.0, 154.0, 255.0)
                                   lightSize:8
                            lightBorderColor:RGB(235.0, 235.0, 235.0)
                             backgroundColor:UIColorFromRGB(0xdff0ff)
           ];
        UITextField  *tf  = self.contactPhone;
        tf.placeholder = @"";
        tf.delegate = self;
        tf.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        tf.font = [UIFont systemFontOfSize:15];
        tf.textAlignment = NSTextAlignmentLeft;
        tf.keyboardType = UIKeyboardTypeDefault;
        tf.returnKeyType = UIReturnKeyDone;
        [cell.contentView addSubview:tf];
    }else if(indexPath.row == 7){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"footer"];
        UIButton *button =  [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button setTitle: @"注册" forState:UIControlStateNormal];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [button addTarget:self action:@selector(commit) forControlEvents:UIControlEventTouchUpInside];
        
        
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
    
    
    NSString* trimedCompany = [self.customerName.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if([trimedCompany length]==0){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"请输入姓名"
                                                        message:nil
                                                       delegate:self
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil, nil];
        [alert show];
        return;
    }

    
    
    NSString* trimedPassword = [self.Password.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if([trimedPassword length]==0){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"请输入用户密码"
                                                        message:nil
                                                       delegate:self
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    
    
    NSString* trimedPassword2 = [self.Password.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if([trimedPassword2 length]==0){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"请再次输入用户密码"
                                                        message:nil
                                                       delegate:self
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    
    if(![trimedPassword isEqualToString:trimedPassword2]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"两次输入的密码不一致"
                                                        message:nil
                                                       delegate:self
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil, nil];
        [alert show];
        return;
        
    }
    
    
    
    NSString* trimedcontactPerson = [self.company.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if([trimedcontactPerson length]==0){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"请输公司名"
                                                        message:nil
                                                       delegate:self
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    
    NSString* trimedcontactTel = [self.contactPhone.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if([trimedcontactTel length]==0){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"请输入联系人电话"
                                                        message:nil
                                                       delegate:self
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    
    
    
    
    NSMutableString  *urlstring =  [[NSMutableString alloc] initWithString:SERVER_URL];
    [urlstring appendString:@"register/individual"];
    NSURL *url = [NSURL URLWithString:urlstring];
   
    
    
    NSString *postString =[NSString stringWithFormat:
                           @"customerType=企业&customerLoginNo=%@&customerPwd=%@&customerPwd2=%@&registerAddrType=%@&ageLimit=%@&industry2=%@&contactPerson=%@&contactPhone=%@&customerName=%@",trimedUsercode,trimedPassword,trimedPassword2,strRegisterPlace,strEstablish,strTrade,trimedcontactPerson,trimedcontactTel,trimedCompany];
    
    
    UIActivityIndicatorView *activityIndicator;
    activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)];
    CGPoint center  = CGPointMake(self.tableView.center.x, self.tableView.center.y-50);
    [activityIndicator setCenter:center];
    [activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [self.tableView addSubview:activityIndicator];
    
    [activityIndicator startAnimating];
    NSLog(postString);
    
    //将NSSrring格式的参数转换格式为NSData，POST提交必须用NSData数据。
    NSData *postData = [postString  dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    
    NSError *error;
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
                                           NSString *code = [rawresult objectForKey:@"code"];
                                           NSLog(@"提交 %@", rawresult );
                                           [activityIndicator stopAnimating];
                                           
                                           if(![code isEqualToString:@"101"]){
                                               UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"用户注册失败"
                                                                                               message:[NSString stringWithFormat:@"错误:%@,代码：%@",message,code]
                                                                                              delegate:self
                                                                                     cancelButtonTitle:@"确定"
                                                                                     otherButtonTitles:nil, nil];
                                               [alert show];
                                               return;
                                               
                                           }else{
                                               
                                               UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"注册成功！"    //标题
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
    

    
    
    
    //  [self.navigationController popViewControllerAnimated:true];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 9){
        return 60;
    }else{
        return  44;
    }
}



#pragma mark -  Textfield delegate

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    //  if (theTextField == self.textField) {
    [theTextField resignFirstResponder];
    //}
    
    [self.tableView setContentOffset:CGPointMake(0, 0) animated:YES];
    
    return YES;
}


- (BOOL)textFieldDidEndEditing:(UITextField *)theTextField {
    //  if (theTextField == self.textField) {
    [theTextField resignFirstResponder];
    //}
    return YES;
}


- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (textField == self.company) {
        
        [self.tableView setContentOffset:CGPointMake(0, 112) animated:YES];
    }else if (textField == self.contactPhone) {
        
        [self.tableView setContentOffset:CGPointMake(0, 155) animated:YES];
    }
}



#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}

-(void) loadSelction {
 /*   //取消选中状态
    for(int i=0;i<[self.tableView numberOfRowsInSection:0];i++){
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        if (cell.selected) {
            
            [UIView beginAnimations:nil context:NULL];//此处添加动画，使之变化平滑一点
            [UIView setAnimationDuration:10.3];
            cell.selected =false;
            [UIView commitAnimations];
            
        }
    }
    
    
    //成立年限
    if(self.establishYearOptions.count>0){
        NSString *abrr = [[NSString alloc] init];
        for(int i=0;i<self.establishYearOptions.count;i++){
            NSDictionary *dict =  [self.establishYearOptions objectAtIndex:i];
            NSString *s = [dict objectForKey:@"Value"];
            abrr =  [NSString stringWithFormat:@"%@,%@",abrr,s];
            //(NSString)[dict objectForKey:@"Value"];
        }
        UITableViewCell *cell = [self.tableView viewWithTag:5];
        UILabel *lbl = [[[cell contentView] subviews] objectAtIndex:1];
        lbl.text = [abrr substringFromIndex:1];
        CGRect fm = lbl.frame;
        [lbl setFrame:CGRectMake(100, fm.origin.y, 170, fm.size.height)];
        //   UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(230.0, 0.0, 100.0, 44.0)];
        //  lbl.text = @"请选择";
        
    }else{
        UITableViewCell *cell = [self.tableView viewWithTag:5];
        UILabel *lbl = [[[cell contentView] subviews] objectAtIndex:1];
        CGRect fm = lbl.frame;
        [lbl setFrame:CGRectMake(230, fm.origin.y, 100, fm.size.height)];
        lbl.text = @"请选择";
    }
    
    
    //所属行业
    if(self.tradeOptions.count>0){
        NSString *abrr = [[NSString alloc] init];
        for(int i=0;i<self.tradeOptions.count;i++){
            NSDictionary *dict =  [self.tradeOptions objectAtIndex:i];
            NSString *s = [dict objectForKey:@"Value"];
            abrr =  [NSString stringWithFormat:@"%@,%@",abrr,s];
            //(NSString)[dict objectForKey:@"Value"];
        }
        UITableViewCell *cell = [self.tableView viewWithTag:6];
        UILabel *lbl = [[[cell contentView] subviews] objectAtIndex:1];
        lbl.text = [abrr substringFromIndex:1];
        CGRect fm = lbl.frame;
        [lbl setFrame:CGRectMake(100, fm.origin.y, 170, fm.size.height)];
        //   UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(230.0, 0.0, 100.0, 44.0)];
        //  lbl.text = @"请选择";
        
    }else{
        UITableViewCell *cell = [self.tableView viewWithTag:6];
        UILabel *lbl = [[[cell contentView] subviews] objectAtIndex:1];
        CGRect fm = lbl.frame;
        [lbl setFrame:CGRectMake(230, fm.origin.y, 100, fm.size.height)];
        lbl.text = @"请选择";
    }
    
    
    
    
    //注册地
    if(self.registerPlaceOptions.count>0){
        NSString *abrr = [[NSString alloc] init];
        for(int i=0;i<self.registerPlaceOptions.count;i++){
            NSDictionary *dict =  [self.registerPlaceOptions objectAtIndex:i];
            NSString *s = [dict objectForKey:@"Value"];
            abrr =  [NSString stringWithFormat:@"%@,%@",abrr,s];
            //(NSString)[dict objectForKey:@"Value"];
        }
        UITableViewCell *cell = [self.tableView viewWithTag:4];
        UILabel *lbl = [[[cell contentView] subviews] objectAtIndex:1];
        lbl.text = [abrr substringFromIndex:1];
        CGRect fm = lbl.frame;
        [lbl setFrame:CGRectMake(100, fm.origin.y, 170, fm.size.height)];
        //   UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(230.0, 0.0, 100.0, 44.0)];
        //  lbl.text = @"请选择";
        
    }else{
        UITableViewCell *cell = [self.tableView viewWithTag:4];
        UILabel *lbl = [[[cell contentView] subviews] objectAtIndex:1];
        CGRect fm = lbl.frame;
        [lbl setFrame:CGRectMake(230, fm.origin.y, 100, fm.size.height)];
        lbl.text = @"请选择";
    }

}*/

