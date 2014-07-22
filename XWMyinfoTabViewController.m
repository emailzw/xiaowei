//
//  XWRegisterTabViewController.m
//  XiaoWei
//
//  Created by 张玮 on 14-7-8.
//  Copyright (c) 2014年 Tonknet. All rights reserved.
//

#import "XWMyinfoTabViewController.H"
#import "XWComanyResiterController.h"
#import "XWPersonResiterController.h"
#import "XWSearchProductConditonViewController.H"
#import "MainPage.h"

@interface XWMyinfoTabViewController ()

@end

@implementation XWMyinfoTabViewController

bool editFlag = false;
UIAlertView *alertView ;
UIDatePicker *datePicker;
UIView *foot ;
/*
 -(void) loadView
 {
 
 
 UIView *parentView = [[UIView alloc] initWithFrame:[ UIScreen mainScreen ].applicationFrame];
 parentView.backgroundColor = [UIColor whiteColor];
 parentView.tag = 1000;
 self.view = parentView;
 
 self.tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
 //  self.person = [[XWRegisterPersonController alloc] init];
 self.tableview.dataSource = self;
 self.tableview.delegate =  self;
 self.tableview.scrollEnabled =false;
 self.tableview.bounces =false;
 [self.view addSubview: self.tableview];
 
 }
 */




- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
   
    
    //成立年限
    if(self.establishYearOptions.count>0){
        NSString *abrr = [[NSString alloc] init];
        for(int i=0;i<self.establishYearOptions.count;i++){
            NSDictionary *dict =  [self.establishYearOptions objectAtIndex:i];
            NSString *s = [dict objectForKey:@"Value"];
            abrr =  [NSString stringWithFormat:@"%@,%@",abrr,s];
        }
        UITableViewCell *cell = [self.tableView viewWithTag:5];
        UILabel *lbl = [[[cell contentView] subviews] objectAtIndex:1];
        lbl.text = [abrr substringFromIndex:1];
        CGRect fm = lbl.frame;
        [lbl setFrame:CGRectMake(140, fm.origin.y, 170, fm.size.height)];
        //   UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(230.0, 0.0, 100.0, 44.0)];
        //  lbl.text = @"请选择";
        
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
        [lbl setFrame:CGRectMake(140, fm.origin.y, 170, fm.size.height)];
        //   UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(230.0, 0.0, 100.0, 44.0)];
        //  lbl.text = @"请选择";
        
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
        [lbl setFrame:CGRectMake(140, fm.origin.y, 170, fm.size.height)];
        //   UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(230.0, 0.0, 100.0, 44.0)];
        //  lbl.text = @"请选择";
        
    }
}




- (void)viewDidLoad
{
    [super viewDidLoad];
    
    editFlag = false;
    
    self.tableView.dataSource = self;
    self.tableView.delegate =  self;
    self.tableView.scrollEnabled =false;
    self.tableView.bounces =false;
    
    
    self.navigationItem.title = @"用户信息";
    UIButton *homeButton = [UIButton buttonWithType:101];
    
    [homeButton addTarget:self action:@selector(edit) forControlEvents:UIControlEventTouchUpInside];
    [homeButton setTitle:@"编辑" forState:UIControlStateNormal];
    
    UIBarButtonItem *homeItem = [[UIBarButtonItem alloc] initWithCustomView:homeButton];
    
    
    homeItem.tintColor = [UIColor whiteColor];
    [homeItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                      [UIColor whiteColor],NSForegroundColorAttributeName,
                                      [UIFont boldSystemFontOfSize:19], NSFontAttributeName, nil] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem =  homeItem;
    
    
    
    
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
    NSString *type = [self getKeyValue:@"customerType"];
    if([type isEqualToString:@"个人信息"]){
        return 6;
    }else{
        return 8;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 80;
}



/*
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
  
    if (indexPath.row == 5){
        
        
        NSString *type = [self getKeyValue:@"customerType"];
        if([type isEqualToString:@"个人信息"]){
        return 60;
        }else{
            return 44;
        }
        
    }else if (indexPath.row == 8){
        
        return 60;
    }else{
        return 44;
    }
}
*/


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
        cell.textLabel.text = @"用户名：";
        cell.textLabel.font = [UIFont systemFontOfSize:13];
        cell.textLabel.textColor = UIColorFromRGB(0x000000);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(100.0, 0.0, 200, 44.0)];
        lbl.font = [UIFont systemFontOfSize:13];
        lbl.text = [self getKeyValue:@"customerLoginNo"];
        [cell.contentView addSubview:lbl];
        
    }
    else if(indexPath.row == 2){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"row1"];
        
        NSString *type = [self getKeyValue:@"customerType"];
        if([type isEqualToString:@"个人信息"]){
        
            if(!editFlag){
                
            
                cell.textLabel.text = @"姓名：";
                cell.textLabel.font = [UIFont systemFontOfSize:13];
                cell.textLabel.textColor = UIColorFromRGB(0x000000);
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                
                UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(100.0, 0.0, 200, 44.0)];
                lbl.text = [self getKeyValue:@"customerName"];
                lbl.font = [UIFont systemFontOfSize:13];
                [cell.contentView addSubview:lbl];
            }else{
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"row11"];
                cell.textLabel.text = @"姓名：";
                cell.textLabel.font = [UIFont systemFontOfSize:13];
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
                    tf.text = [self getKeyValue:@"customerName"];
                    
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
            
        }else{
            
            if(!editFlag){
                cell.textLabel.text = @"公司名：";
                cell.textLabel.font = [UIFont systemFontOfSize:13];
                cell.textLabel.textColor = UIColorFromRGB(0x000000);
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                
                UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(100.0, 0.0, 210, 44.0)];
                lbl.text = [self getKeyValue:@"companyName"];
                lbl.font = [UIFont systemFontOfSize:13];
                [cell.contentView addSubview:lbl];
            }else{
                
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"row11"];
                cell.textLabel.text = @"公司名：";
                cell.textLabel.font = [UIFont systemFontOfSize:13];
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
                    tf.text = [self getKeyValue:@"companyName"];

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
        }
        
    }
    
    else if(indexPath.row == 3){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"row1"];
        
        NSString *type = [self getKeyValue:@"customerType"];
        if([type isEqualToString:@"个人信息"]){
            
            
            if(!editFlag){
                
                cell.textLabel.text = @"出生年月：";
                cell.textLabel.font = [UIFont systemFontOfSize:13];
                cell.textLabel.textColor = UIColorFromRGB(0x000000);
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                
                UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(100.0, 0.0, 200, 44.0)];
                lbl.text = [self getKeyValue:@"birthday"];
                lbl.font = [UIFont systemFontOfSize:13];
                [cell.contentView addSubview:lbl];
            }else{
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"row11"];
                cell.textLabel.text = @"出生年月：";
                cell.textLabel.font = [UIFont systemFontOfSize:13];
                cell.textLabel.textColor = UIColorFromRGB(0x000000);
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                
                UITextField  *tf =self.birthday ;
                
                if(self.birthday == nil){
                    self.birthday = [[PSTextField alloc] initWithFrame:CGRectMake(90, 4.5, 210,35)
                                                               cornerRadio:5
                                                               borderColor:RGB(166.0, 166.0, 166.0)
                                                               borderWidth:0
                                                                lightColor:RGB(55.0, 154.0, 255.0)
                                                                 lightSize:8
                                                          lightBorderColor:RGB(235.0, 235.0, 235.0)
                                                           backgroundColor:UIColorFromRGB(0xdff0ff)
                                         ];
                    tf = self.birthday;
                    tf.text = [self getKeyValue:@"birthday"];
                    
                    tf.placeholder = @"";
                    tf.delegate = self;
                    tf.clearButtonMode = UITextFieldViewModeWhileEditing;
                    
                    tf.font = [UIFont systemFontOfSize:15];
                    tf.textAlignment = NSTextAlignmentLeft;
                    tf.keyboardType = UIKeyboardTypeDefault;
                    tf.returnKeyType = UIReturnKeyDone;
                    
                    // 建立 UIDatePicker
                    datePicker = [[UIDatePicker alloc] init];
                    
                    datePicker.datePickerMode = UIDatePickerModeDate;
                    
                    self.birthday .inputView = datePicker;
                    
                    // 建立 UIToolbar
                    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
                    // 選取日期完成鈕 並給他一個 selector
                    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self
                                                                                          action:@selector(cancelPicker)];
                    // 把按鈕加進 UIToolbar
                    toolBar.items = [NSArray arrayWithObject:right];
                    // 以下這行也是重點 (螢光筆畫兩行) 
                    // 原本應該是鍵盤上方附帶內容的區塊 改成一個 UIToolbar 並加上完成鈕
                    self.birthday.inputAccessoryView = toolBar;
                    

                    
                    
                }
                [cell.contentView addSubview:tf];
                
                
            }
        }else{
            
            if(!editFlag){
                
                cell.textLabel.text = @"企业注册地：";
                cell.textLabel.font = [UIFont systemFontOfSize:13];
                cell.textLabel.textColor = UIColorFromRGB(0x000000);
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                
                UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(100.0, 0.0, 200, 44.0)];
                lbl.text = [self getKeyValue:@"registerAddrType"];
                lbl.font = [UIFont systemFontOfSize:13];
                [cell.contentView addSubview:lbl];
                
            }else{
                
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"row4"];
                cell.tag = 4;
                cell.textLabel.text = @"企业注册地：";
                cell.textLabel.font = [UIFont systemFontOfSize:13];
                cell.textLabel.textColor = UIColorFromRGB(0x000000);
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                cell.selectionStyle = UITableViewCellSelectionStyleDefault;
                UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(100, 0.0, 200, 44.0)];
                lbl.text = [self getKeyValue:@"registerAddrType"];
                lbl.font = [UIFont boldSystemFontOfSize:15];;
                lbl.textColor =UIColorFromRGB(0x9e9e9e);
                [cell.contentView addSubview:lbl];
            }
            
        }
        
    } else if(indexPath.row == 4){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"row1"];
        
        NSString *type = [self getKeyValue:@"customerType"];
        if([type isEqualToString:@"个人信息"]){
            
            
            if(!editFlag){
                
                cell.textLabel.text = @"所属公司：";
                cell.textLabel.font = [UIFont systemFontOfSize:13];
                cell.textLabel.textColor = UIColorFromRGB(0x000000);
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                
                UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(100.0, 0.0, 200, 44.0)];
                lbl.text = [self getKeyValue:@"companyName"];
                lbl.font = [UIFont systemFontOfSize:13];
                [cell.contentView addSubview:lbl];
            }else{
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"row11"];
                cell.textLabel.text = @"所属公司：";
                cell.textLabel.font = [UIFont systemFontOfSize:13];
                cell.textLabel.textColor = UIColorFromRGB(0x000000);
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                
                UITextField  *tf =self.company ;
                
                if(self.company == nil){
                    self.company = [[PSTextField alloc] initWithFrame:CGRectMake(90, 4.5, 210,35)
                                                           cornerRadio:5
                                                           borderColor:RGB(166.0, 166.0, 166.0)
                                                           borderWidth:0
                                                            lightColor:RGB(55.0, 154.0, 255.0)
                                                             lightSize:8
                                                      lightBorderColor:RGB(235.0, 235.0, 235.0)
                                                       backgroundColor:UIColorFromRGB(0xdff0ff)
                                     ];
                    tf = self.company;
                    tf.text = [self getKeyValue:@"companyName"];
                    
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
            
        }else{
            if(!editFlag){
                cell.textLabel.text = @"成立年限：";
                cell.textLabel.font = [UIFont systemFontOfSize:13];
                cell.textLabel.textColor = UIColorFromRGB(0x000000);
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                
                UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(100.0, 0.0, 200, 44.0)];
                lbl.text = [self getKeyValue:@"ageLimit"];
                lbl.font = [UIFont systemFontOfSize:13];
                [cell.contentView addSubview:lbl];
                
                
            }else{
                
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"row5"];
                cell.tag = 5;
                cell.textLabel.text = @"成立年限：";
                cell.textLabel.font = [UIFont systemFontOfSize:13];
                cell.textLabel.textColor = UIColorFromRGB(0x000000);
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                cell.selectionStyle = UITableViewCellSelectionStyleDefault;
                UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(100, 0.0, 200, 44.0)];
                lbl.text = [self getKeyValue:@"ageLimit"];
                lbl.font = [UIFont boldSystemFontOfSize:13];;
                lbl.textColor =UIColorFromRGB(0x9e9e9e);
                [cell.contentView addSubview:lbl];
            }
        }
        
    } else if(indexPath.row == 5){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"row6"];
        
        NSString *type = [self getKeyValue:@"customerType"];
        if([type isEqualToString:@"个人信息"]){
           
            if(!editFlag){

                cell.textLabel.text = @"联系电话：";
                cell.textLabel.font = [UIFont systemFontOfSize:13];
                cell.textLabel.textColor = UIColorFromRGB(0x000000);
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                
                UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(100.0, 0.0, 200, 44.0)];
                lbl.text = [self getKeyValue:@"contactPhone"];
                lbl.font = [UIFont systemFontOfSize:13];
                [cell.contentView addSubview:lbl];
            }else{
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"row11"];
                cell.textLabel.text = @"联系电话：";
                cell.textLabel.font = [UIFont systemFontOfSize:13];
                cell.textLabel.textColor = UIColorFromRGB(0x000000);
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                
                UITextField  *tf =self.contactPhone ;
                
                if(self.contactPhone == nil){
                    self.contactPhone = [[PSTextField alloc] initWithFrame:CGRectMake(90, 4.5, 210,35)
                                                           cornerRadio:5
                                                           borderColor:RGB(166.0, 166.0, 166.0)
                                                           borderWidth:0
                                                            lightColor:RGB(55.0, 154.0, 255.0)
                                                             lightSize:8
                                                      lightBorderColor:RGB(235.0, 235.0, 235.0)
                                                       backgroundColor:UIColorFromRGB(0xdff0ff)
                                     ];
                    tf = self.contactPhone;
                    tf.text = [self getKeyValue:@"contactPhone"];
                    
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
            
        }else{
            
            if(!editFlag){
                cell.textLabel.text = @"所属行业：";
                cell.textLabel.font = [UIFont systemFontOfSize:13];
                cell.textLabel.textColor = UIColorFromRGB(0x000000);
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                
                UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(100.0, 0.0, 200, 44.0)];
                lbl.text = [self getKeyValue:@"industry2"];
                lbl.font = [UIFont systemFontOfSize:13];
                [cell.contentView addSubview:lbl];
            }else{
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"row6"];
                cell.tag = 6;
                
                cell.textLabel.text = @"所属行业：";
                cell.textLabel.font = [UIFont systemFontOfSize:13];
                cell.textLabel.textColor = UIColorFromRGB(0x000000);
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                cell.selectionStyle = UITableViewCellSelectionStyleDefault;
                UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(100, 0.0, 200.0, 44.0)];
                lbl.text = [self getKeyValue:@"industry2"];
                lbl.font = [UIFont boldSystemFontOfSize:13];;
                lbl.textColor =UIColorFromRGB(0x9e9e9e);
                [cell.contentView addSubview:lbl];
            }
        }
        
    }
    else if(indexPath.row == 6){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"row1"];
        
        NSString *type = [self getKeyValue:@"customerType"];
        if([type isEqualToString:@"个人信息"]){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"footer"];
            UIButton *button =  [UIButton buttonWithType:UIButtonTypeRoundedRect];
            [button setTitle: @"注销" forState:UIControlStateNormal];
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            [button addTarget:self action:@selector(logoff) forControlEvents:UIControlEventTouchUpInside];
            
            
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont boldSystemFontOfSize:19];
            [button setBackgroundImage:[UIImage imageNamed:@"btn.png"] forState:UIControlStateNormal];
            //button.backgroundColor = [UIColor clearColor];
            
            [button sizeToFit];
            button.frame = CGRectMake(20,10.0f,280,38);
            
            [cell addSubview:button];

        }else{
            
            if(!editFlag){
                cell.textLabel.text = @"联系人：";
                cell.textLabel.font = [UIFont systemFontOfSize:13];
                cell.textLabel.textColor = UIColorFromRGB(0x000000);
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                
                UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(100.0, 0.0, 200, 44.0)];
                lbl.text = [self getKeyValue:@"contactPerson"];
                lbl.font = [UIFont systemFontOfSize:13];
                [cell.contentView addSubview:lbl];
            }else{
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"row7"];
                cell.textLabel.text = @"联系人：";
                cell.textLabel.font = [UIFont systemFontOfSize:15];
                cell.textLabel.textColor = UIColorFromRGB(0x000000);
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                
                self.contactPerson = [[PSTextField alloc] initWithFrame:CGRectMake(90, 4.5, 210,35)
                                                            cornerRadio:5
                                                            borderColor:RGB(166.0, 166.0, 166.0)
                                                            borderWidth:0
                                                             lightColor:RGB(55.0, 154.0, 255.0)
                                                              lightSize:8
                                                       lightBorderColor:RGB(235.0, 235.0, 235.0)
                                                        backgroundColor:UIColorFromRGB(0xdff0ff)
                                      ];
                
                UITextField  *tf = self.contactPerson;
                tf.placeholder = @"";
                tf.delegate = self;
                tf.clearButtonMode = UITextFieldViewModeWhileEditing;
                tf.text=[self getKeyValue:@"contactPerson"];
                tf.font = [UIFont systemFontOfSize:15];
                tf.textAlignment = NSTextAlignmentLeft;
                tf.keyboardType = UIKeyboardTypeDefault;
                tf.returnKeyType = UIReturnKeyDone;
                [cell.contentView addSubview:tf];
                
            }
        }
        
    }
    else if(indexPath.row == 7){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"row1"];
        
        NSString *type = [self getKeyValue:@"customerType"];
        if([type isEqualToString:@"个人信息"]){
            
        }else{
            if(!editFlag){
                cell.textLabel.text = @"联系电话：";
                cell.textLabel.font = [UIFont systemFontOfSize:13];
                cell.textLabel.textColor = UIColorFromRGB(0x000000);
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                
                UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(100.0, 0.0, 200, 44.0)];
                lbl.text = [self getKeyValue:@"contactPhone"];
                lbl.font = [UIFont systemFontOfSize:13];
                [cell.contentView addSubview:lbl];
            }else{
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
                tf.text=[self getKeyValue:@"contactPhone"];
                tf.font = [UIFont systemFontOfSize:15];
                tf.textAlignment = NSTextAlignmentLeft;
                tf.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
                tf.returnKeyType = UIReturnKeyDone;
                [cell.contentView addSubview:tf];
            }
        }
        
    }
    
    else if(indexPath.row == 8){
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"footer"];
        UIButton *button =  [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button setTitle: @"注销" forState:UIControlStateNormal];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [button addTarget:self action:@selector(logoff) forControlEvents:UIControlEventTouchUpInside];
        
        
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont boldSystemFontOfSize:19];
        [button setBackgroundImage:[UIImage imageNamed:@"btn.png"] forState:UIControlStateNormal];
        //button.backgroundColor = [UIColor clearColor];
        
        [button sizeToFit];
        button.frame = CGRectMake(20,10.0f,280,38);
        
        [cell addSubview:button];
        
    }
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    
    if(!editFlag){
        foot = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 60)];
        UIButton *button =  [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button setTitle: @"注销当前登录" forState:UIControlStateNormal];
        
        [button addTarget:self action:@selector(logoff) forControlEvents:UIControlEventTouchUpInside];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont boldSystemFontOfSize:19];
        [button setBackgroundImage:[UIImage imageNamed:@"btn.png"] forState:UIControlStateNormal];
        
        [button sizeToFit];
        button.frame = CGRectMake(20,10.0f,280,38);
        //container的宽度比UILabel多出是个像素这些像素用于缩进
        CGRect resultFrame = CGRectMake(0.0f, 0.0f,320,52);
        UIView *background = [[UIView alloc] initWithFrame:resultFrame];
        background.opaque = NO;
        
        background.backgroundColor = [UIColor redColor];
        [background addSubview:button];
        [foot addSubview:button];
        return foot;
    }else{
        foot = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 60)];
        UIButton *button =  [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button setTitle: @"保存修改" forState:UIControlStateNormal];
        
        NSString *type = [self getKeyValue:@"customerType"];
        if([type isEqualToString:@"个人信息"]){
            [button addTarget:self action:@selector(commitPerson) forControlEvents:UIControlEventTouchUpInside];

        }else{
            [button addTarget:self action:@selector(commitCompany) forControlEvents:UIControlEventTouchUpInside];
        }
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont boldSystemFontOfSize:19];
        [button setBackgroundImage:[UIImage imageNamed:@"btn.png"] forState:UIControlStateNormal];
        
        [button sizeToFit];
        button.frame = CGRectMake(20,10.0f,280,38);
        //container的宽度比UILabel多出是个像素这些像素用于缩进
        CGRect resultFrame = CGRectMake(0.0f, 0.0f,320,52);
        UIView *background = [[UIView alloc] initWithFrame:resultFrame];
        background.opaque = NO;
        
        background.backgroundColor = [UIColor redColor];
        [background addSubview:button];
        [foot addSubview:button];
        return foot;

    }
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(!editFlag){
        return;
    }
    
    NSString *type = [self getKeyValue:@"customerType"];
    if([type isEqualToString:@"个人信息"]){
        return;
    }
    
    
    //企业注册地
    if (indexPath.row == 3){
        if(!self.registerPlace){
            self.registerPlace = [[ XWSingleSelectionTableViewController alloc] initWithNibName:@"XWSingleSelectionTableViewController" bundle:nil];
            
            NSArray *items =  [XWSearchProductConditonViewController getOptionsFromServer:@"registerAddrType"  View:self.tableView];
            
            
            
            
            self.registerPlace.menuItems = items;
            self.registerPlaceOptions =  [[NSMutableArray alloc] init];
            self.registerPlace.target = self.registerPlaceOptions;
            self.registerPlace.title =@"企业注册地";
            
            
        }
        
        [self.navigationController pushViewController:self.registerPlace  animated:YES];
        
        
    }
    //成立年限
    else if (indexPath.row == 4){
        if(!self.establishYear){
            self.establishYear = [[ XWSingleSelectionTableViewController alloc] initWithNibName:@"XWSingleSelectionTableViewController" bundle:nil];
            
            NSArray *items =  [XWSearchProductConditonViewController getOptionsFromServer:@"ageLimit"  View:self.tableView];
            
            
            
            self.establishYear.menuItems = items;
            self.establishYearOptions =  [[NSMutableArray alloc] init];
            self.establishYear.target = self.establishYearOptions;
            self.establishYear.title =@"成立年限";
            
            
        }
        
        [self.navigationController pushViewController:self.establishYear  animated:YES];
        
        
    }
    
    //所属行业
    else if (indexPath.row == 5){
        if(!self.trade){
            self.trade = [[ XWSingleSelectionTableViewController alloc] initWithNibName:@"XWSingleSelectionTableViewController" bundle:nil];
            
            NSArray *items =  [XWSearchProductConditonViewController getOptionsFromServer:@"industry"  View:self.tableView];
            
            
            
            self.trade.menuItems = items;
            self.tradeOptions =  [[NSMutableArray alloc] init];
            self.trade.target = self.tradeOptions;
            self.trade.title =@"所属行业";
            
            
        }
        
        [self.navigationController pushViewController:self.trade  animated:YES];
        
        
    }}





-  (NSString*) getKeyValue : (NSString*) key{
    if(self.info == nil){
        return @"";
    }
    
    NSString *value = [self.info objectForKey:key];
    //判断集合/数组字典对象是否为空
    if ((NSNull *)value == [NSNull null]) {
        
        return @"";
    }else{
        return value;
    }
}

- (void) logoff{
    
    
    alertView =    [[UIAlertView alloc]
                    initWithTitle:@"操作确认"
                    message: [[NSString alloc] initWithFormat:@"确定要退出当前登录吗？"]
                    delegate:self
                    cancelButtonTitle:@"取消"
                    otherButtonTitles:@"确定", nil];
    alertView.tag = 1000;
    [alertView show];
    
    
}

- (void) edit{
    
    editFlag = true;
    //退回首页
    UIButton *homeButton = [UIButton buttonWithType:101];
    
    [homeButton addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    [homeButton setTitle:@"取消" forState:UIControlStateNormal];
    
    UIBarButtonItem *homeItem = [[UIBarButtonItem alloc] initWithCustomView:homeButton];
    
    
    homeItem.tintColor = [UIColor whiteColor];
    [homeItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                      [UIColor whiteColor],NSForegroundColorAttributeName,
                                      [UIFont boldSystemFontOfSize:19], NSFontAttributeName, nil] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem =  homeItem;
    [self.tableView reloadData];
    
}

- (void) cancel{
    UIAlertView * alert =
    [[UIAlertView alloc]
     initWithTitle:@"操作确认"
     message: [[NSString alloc] initWithFormat:@"确定要退出编辑吗？"]
     delegate:self
     cancelButtonTitle:@"取消"
     otherButtonTitles:@"确定", nil];
    alert.tag = 1001;
    [alert show];
    
    
}





-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if(alertView.tag==1000){
        if( buttonIndex == 1 ){
            
            NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
            
            
            [defaults removeObjectForKey:LOGIN];
            [defaults removeObjectForKey:LOGIN_NAME];
            
            [defaults synchronize];
            
            [self.navigationController popToRootViewControllerAnimated:true];
            
            
        }
    }else if(alertView.tag==1001){
        
        if( buttonIndex == 1 ){
            editFlag = false;
            UIButton *homeButton = [UIButton buttonWithType:101];
            
            [homeButton addTarget:self action:@selector(edit) forControlEvents:UIControlEventTouchUpInside];
            [homeButton setTitle:@"编辑" forState:UIControlStateNormal];
            
            UIBarButtonItem *homeItem = [[UIBarButtonItem alloc] initWithCustomView:homeButton];
            
            
            homeItem.tintColor = [UIColor whiteColor];
            [homeItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                              [UIColor whiteColor],NSForegroundColorAttributeName,
                                              [UIFont boldSystemFontOfSize:19], NSFontAttributeName, nil] forState:UIControlStateNormal];
            self.navigationItem.rightBarButtonItem =  homeItem;
            [self.tableView reloadData];

        }

    }
}







-(void) commitCompany{
    
    
    NSString *uid =  [[NSUserDefaults standardUserDefaults] objectForKey:LOGIN];
    

    
    NSString* trimedCompany = [self.customerName.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if([trimedCompany length]==0){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"请输入公司名称"
                                                        message:nil
                                                       delegate:nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    
//    
//       if([self.establishYearOptions count]==0){
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"请选择企业成立年限"
//                                                        message:nil
//                                                       delegate:nil
//                                              cancelButtonTitle:@"确定"
//                                              otherButtonTitles:nil, nil];
//        [alert show];
//        return;
//    }
    
//    if([self.registerPlaceOptions count]==0){
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"请选择企业注册地"
//                                                        message:nil
//                                                       delegate:nil
//                                              cancelButtonTitle:@"确定"
//                                              otherButtonTitles:nil, nil];
//        [alert show];
//        return;
//    }
//    
    
//    if([self.tradeOptions count]==0){
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"请选择所属行业或类型"
//                                                        message:nil
//                                                       delegate:nil
//                                              cancelButtonTitle:@"确定"
//                                              otherButtonTitles:nil, nil];
//        [alert show];
//        return;
//    }
    
    NSString* trimedcontactPerson = [self.contactPerson.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if([trimedcontactPerson length]==0){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"请输入联系人"
                                                        message:nil
                                                       delegate:nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    
    NSString* trimedcontactTel = [self.contactPhone.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if([trimedcontactTel length]==0){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"请输入联系人电话"
                                                        message:nil
                                                       delegate:nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    
    
    
    
    NSMutableString  *urlstring =  [[NSMutableString alloc] initWithString:SERVER_URL];
    [urlstring appendString:[NSString stringWithFormat:@"savecompanyinfo"]];
    NSURL *url = [NSURL URLWithString:urlstring];
    
    //所属行业或类型
    NSString *strTrade =[[self.tradeOptions objectAtIndex:0] objectForKey:@"Key"];
    if (strTrade == nil){
        strTrade =   [self getKeyValue:@"industry2"];
    }
    
    //成立年限
    NSString *strEstablish =[[self.establishYearOptions objectAtIndex:0] objectForKey:@"Key"];
    if (strEstablish == nil){
        strEstablish =  [self getKeyValue:@"ageLimit"];
    }
    //注册地
    NSString *strRegisterPlace =[[self.registerPlaceOptions objectAtIndex:0] objectForKey:@"Key"];
    if (strRegisterPlace == nil){
        strRegisterPlace =  [self getKeyValue:@"registerAddrType"];
    }
    
    
    NSString *postString =[NSString stringWithFormat:
                           @"customerID=%@&registerAddrType=%@&ageLimit=%@&industry2=%@&contactPerson=%@&contactPhone=%@&companyName=%@",uid,strRegisterPlace,strEstablish,strTrade,trimedcontactPerson,trimedcontactTel,trimedCompany];
    
    
    UIActivityIndicatorView *activityIndicator;
    activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)];
    CGPoint center  = CGPointMake(self.tableView.center.x, self.tableView.center.y-50);
    [activityIndicator setCenter:center];
    [activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [self.tableView addSubview:activityIndicator];
    
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
                                                                                      delegate:nil
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
                                                                                              delegate:nil
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
                                               UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"用户信息修改失败"
                                                                                               message:[NSString stringWithFormat:@"错误:%@,代码：%@",message,code]
                                                                                              delegate:nil
                                                                                     cancelButtonTitle:@"确定"
                                                                                     otherButtonTitles:nil, nil];
                                               [alert show];
                                               return;
                                               
                                           }else{
                                               
                                               UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"信息修改成功！"    //标题
                                                                                              message:nil   //显示内容
                                                                                             delegate:nil          //委托，可以点击事件进行处理
                                                                                    cancelButtonTitle:nil
                                                                                    otherButtonTitles:@"确定",nil];
                                               [view show];
                                               editFlag = false;
                                               [self.info setValue:trimedCompany forKey:@"companyName"];
                                               [self.info setValue:strRegisterPlace forKey:@"registerAddrType"];
                                               [self.info setValue:strEstablish forKey:@"ageLimit"];
                                               [self.info setValue:strTrade forKey:@"industry2"];
                                               [self.info setValue:trimedcontactTel forKey:@"contactPhone"];
                                               [self.info setValue:trimedcontactPerson forKey:@"contactPerson"];


                                               UIButton *homeButton = [UIButton buttonWithType:101];
                                               
                                               [homeButton addTarget:self action:@selector(edit) forControlEvents:UIControlEventTouchUpInside];
                                               [homeButton setTitle:@"编辑" forState:UIControlStateNormal];
                                               
                                               UIBarButtonItem *homeItem = [[UIBarButtonItem alloc] initWithCustomView:homeButton];
                                               
                                               
                                               homeItem.tintColor = [UIColor whiteColor];
                                               [homeItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                                 [UIColor whiteColor],NSForegroundColorAttributeName,
                                                                                 [UIFont boldSystemFontOfSize:19], NSFontAttributeName, nil] forState:UIControlStateNormal];
                                               self.navigationItem.rightBarButtonItem =  homeItem;
                                               [self.tableView reloadData];
                                               
                                           }
                                       }
                                   }
                               }
         ];
    }@catch (NSException *exception) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"对不起，服务故障，请稍后再试"
                                                        message:nil
                                                       delegate:nil
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












-(void) commitPerson{
    
    
    NSString *uid =  [[NSUserDefaults standardUserDefaults] objectForKey:LOGIN];
    
    
    
    NSString* trimdUsername = [self.customerName.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if([trimdUsername length]==0){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"请输入姓名"
                                                        message:nil
                                                       delegate:nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    
       NSString* trimedbirthday = [self.birthday.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if([trimedbirthday length]==0){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"出生年月"
                                                        message:nil
                                                       delegate:nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    
    NSString* trimedcontactTel = [self.contactPhone.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if([trimedcontactTel length]==0){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"请输入联系电话"
                                                        message:nil
                                                       delegate:nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil,nil];
        [alert show];
        return;
    }
    
    
    NSString* trimedCompany = [self.company.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if([trimedCompany length]==0){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"请输入所属公司"
                                                        message:nil
                                                       delegate:nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    

    
    
    NSMutableString  *urlstring =  [[NSMutableString alloc] initWithString:SERVER_URL];
    [urlstring appendString:[NSString stringWithFormat:@"savecompanyinfo"]];
    NSURL *url = [NSURL URLWithString:urlstring];
    
    
    NSString *postString =[NSString stringWithFormat:
                           @"customerID=%@&customerName=%@&birthday=%@&companyName=%@&contactPhone=%@",uid,trimdUsername,trimedbirthday,trimedCompany,trimedcontactTel];
    
    
    UIActivityIndicatorView *activityIndicator;
    activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)];
    CGPoint center  = CGPointMake(self.tableView.center.x, self.tableView.center.y-50);
    [activityIndicator setCenter:center];
    [activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [self.tableView addSubview:activityIndicator];
    
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
                                                                                      delegate:nil
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
                                                                                              delegate:nil
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
                                               UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"用户信息修改失败"
                                                                                               message:[NSString stringWithFormat:@"错误:%@,代码：%@",message,code]
                                                                                              delegate:nil
                                                                                     cancelButtonTitle:@"确定"
                                                                                     otherButtonTitles:nil, nil];
                                               [alert show];
                                               return;
                                               
                                           }else{
                                               
                                               UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"信息修改成功！"    //标题
                                                                                              message:nil   //显示内容
                                                                                             delegate:nil          //委托，可以点击事件进行处理
                                                                                    cancelButtonTitle:nil
                                                                                    otherButtonTitles:@"确定",nil];
                                               [view show];
                                               editFlag = false;
                                               [self.info setValue:trimedCompany forKey:@"companyName"];
                                               [self.info setValue:trimdUsername forKey:@"customerName"];
                                               [self.info setValue:trimedbirthday forKey:@"birthday"];
                                               [self.info setValue:trimedcontactTel forKey:@"contactPhone"];
                                               
                                               
                                               UIButton *homeButton = [UIButton buttonWithType:101];
                                               
                                               [homeButton addTarget:self action:@selector(edit) forControlEvents:UIControlEventTouchUpInside];
                                               [homeButton setTitle:@"编辑" forState:UIControlStateNormal];
                                               
                                               UIBarButtonItem *homeItem = [[UIBarButtonItem alloc] initWithCustomView:homeButton];
                                               
                                               
                                               homeItem.tintColor = [UIColor whiteColor];
                                               [homeItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                                 [UIColor whiteColor],NSForegroundColorAttributeName,
                                                                                 [UIFont boldSystemFontOfSize:19], NSFontAttributeName, nil] forState:UIControlStateNormal];
                                               self.navigationItem.rightBarButtonItem =  homeItem;
                                               [self.tableView reloadData];
                                               
                                           }
                                       }
                                   }
                               }
         ];
    }@catch (NSException *exception) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"对不起，服务故障，请稍后再试"
                                                        message:nil
                                                       delegate:nil
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




#pragma mark -  Textfield delegate

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    [theTextField resignFirstResponder];
    foot.hidden =false;

    return YES;
}


- (BOOL)textFieldDidEndEditing:(UITextField *)theTextField {
    [theTextField resignFirstResponder];
    foot.hidden =false;

    return YES;
}




- (void)textFieldDidBeginEditing:(UITextField *)textField {
    foot.hidden =true;
}



// 按下完成鈕後的 method
-(void) cancelPicker {
    // endEditing: 是結束編輯狀態的 method
    // 以下幾行是測試用 可以依照自己的需求增減屬性
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSString *dateFormat = [NSDateFormatter dateFormatFromTemplate:@"yyyy-MM-dd" options:0 locale:nil];
    [formatter setDateFormat:dateFormat];
    // 將選取後的日期 填入 UITextField
    self.birthday.text = [NSString stringWithFormat:@"%@",[formatter stringFromDate:datePicker.date]];
    [self.birthday resignFirstResponder];
    foot.hidden =false;

}


@end
