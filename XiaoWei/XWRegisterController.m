//
//  XWRegisterController.m
//  XiaoWei
//
//  Created by 张玮 on 14-5-21.
//  Copyright (c) 2014年 Tonknet. All rights reserved.
//

#import "XWRegisterController.h"
#import "PSTextField.h"

@interface XWRegisterController ()

@end

@implementation XWRegisterController

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
    self.test.dataSource = self;
    self.test.delegate = self;
    self.title =@"账号注册";
    [self.segment  setTitle:@"企业注册" forSegmentAtIndex:0];
    
    [self.segment  setTitle:@"个人注册" forSegmentAtIndex:1];
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
    
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    if(indexPath.row == 0){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"row0"];
        cell.textLabel.text = @"*通过网站填写完事信息将有助于您获得更多银行的关注";
        cell.textLabel.font = [UIFont systemFontOfSize:11];
        cell.textLabel.textColor =[UIColor redColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        /*  UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(80, 0.0, 200, 44.0)];
         lbl.text = @"宁波银行上海分行";
         lbl.font = [UIFont boldSystemFontOfSize:15];;
         lbl.textColor =UIColorFromRGB(0x9e9e9e);
         [cell.contentView addSubview:lbl];*/
    }else if(indexPath.row == 1){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"row1"];
        cell.textLabel.text = @"用户名：";
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textLabel.textColor = UIColorFromRGB(0x000000);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        
        UITextField  *tf = [[PSTextField alloc] initWithFrame:CGRectMake(90, 4.5, 210,35)
                                                  cornerRadio:5
                                                  borderColor:RGB(166.0, 166.0, 166.0)
                                                  borderWidth:0
                                                   lightColor:RGB(55.0, 154.0, 255.0)
                                                    lightSize:8
                                             lightBorderColor:RGB(235.0, 235.0, 235.0)
                                              backgroundColor:UIColorFromRGB(0xdff0ff)
                            ];
        tf.placeholder = @"";
        tf.delegate = self;
        tf.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        tf.font = [UIFont systemFontOfSize:15];
        tf.textAlignment = NSTextAlignmentLeft;
        tf.keyboardType = UIKeyboardTypeDefault;
        tf.returnKeyType = UIReturnKeyDone;
        [cell.contentView addSubview:tf];
        
    }
    else if(indexPath.row == 2){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"row1"];
        cell.textLabel.text = @"密码：";
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textLabel.textColor = UIColorFromRGB(0x000000);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        
        UITextField  *tf = [[PSTextField alloc] initWithFrame:CGRectMake(90, 4.5, 210,35)
                                                  cornerRadio:5
                                                  borderColor:RGB(166.0, 166.0, 166.0)
                                                  borderWidth:0
                                                   lightColor:RGB(55.0, 154.0, 255.0)
                                                    lightSize:8
                                             lightBorderColor:RGB(235.0, 235.0, 235.0)
                                              backgroundColor:UIColorFromRGB(0xdff0ff)
                            ];
        tf.placeholder = @"";
        tf.delegate = self;
        tf.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        
        tf.font = [UIFont systemFontOfSize:15];
        tf.textAlignment = NSTextAlignmentLeft;
        tf.keyboardType = UIKeyboardTypeDefault;
        tf.returnKeyType = UIReturnKeyDone;
        [cell.contentView addSubview:tf];
        
    } else if(indexPath.row == 3){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"row1"];
        cell.textLabel.text = @"确认密码：";
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textLabel.textColor = UIColorFromRGB(0x000000);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        
        UITextField  *tf = [[PSTextField alloc] initWithFrame:CGRectMake(90, 4.5, 210,35)
                                                  cornerRadio:5
                                                  borderColor:RGB(166.0, 166.0, 166.0)
                                                  borderWidth:0
                                                   lightColor:RGB(55.0, 154.0, 255.0)
                                                    lightSize:8
                                             lightBorderColor:RGB(235.0, 235.0, 235.0)
                                              backgroundColor:UIColorFromRGB(0xdff0ff)
                            ];
        tf.placeholder = @"";
        tf.delegate = self;
        tf.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        tf.font = [UIFont systemFontOfSize:15];
        tf.textAlignment = NSTextAlignmentLeft;
        tf.keyboardType = UIKeyboardTypeDefault;
        tf.returnKeyType = UIReturnKeyDone;
        [cell.contentView addSubview:tf];
        
    } else if(indexPath.row == 4){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"row1"];
        cell.textLabel.text = @"公司注册地：";
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
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"row1"];
        cell.textLabel.text = @"成立年限：";
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textLabel.textColor = UIColorFromRGB(0x000000);
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(230.0, 0.0, 100.0, 44.0)];
        lbl.text = @"请选择";
        lbl.font = [UIFont boldSystemFontOfSize:15];;
        lbl.textColor =UIColorFromRGB(0x9e9e9e);
        [cell.contentView addSubview:lbl];
        
    } else if(indexPath.row == 6){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"row1"];
        cell.textLabel.text = @"所属行业：";
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textLabel.textColor = UIColorFromRGB(0x000000);
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(230.0, 0.0, 100.0, 44.0)];
        lbl.text = @"请选择";
        lbl.font = [UIFont boldSystemFontOfSize:15];;
        lbl.textColor =UIColorFromRGB(0x9e9e9e);
        [cell.contentView addSubview:lbl];
        
    }else if(indexPath.row == 7){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"row1"];
        cell.textLabel.text = @"联系人：";
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textLabel.textColor = UIColorFromRGB(0x000000);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        
        UITextField  *tf = [[PSTextField alloc] initWithFrame:CGRectMake(90, 4.5, 210,35)
                                                  cornerRadio:5
                                                  borderColor:RGB(166.0, 166.0, 166.0)
                                                  borderWidth:0
                                                   lightColor:RGB(55.0, 154.0, 255.0)
                                                    lightSize:8
                                             lightBorderColor:RGB(235.0, 235.0, 235.0)
                                              backgroundColor:UIColorFromRGB(0xdff0ff)
                            ];
        tf.placeholder = @"";
        tf.delegate = self;
        tf.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        tf.font = [UIFont systemFontOfSize:15];
        tf.textAlignment = NSTextAlignmentLeft;
        tf.keyboardType = UIKeyboardTypeDefault;
        tf.returnKeyType = UIReturnKeyDone;
        [cell.contentView addSubview:tf];
        
    }else if(indexPath.row == 8){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"row1"];
        cell.textLabel.text = @"联系电话：";
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textLabel.textColor = UIColorFromRGB(0x000000);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        
        UITextField  *tf = [[PSTextField alloc] initWithFrame:CGRectMake(90, 4.5, 210,35)
                                                  cornerRadio:5
                                                  borderColor:RGB(166.0, 166.0, 166.0)
                                                  borderWidth:0
                                                   lightColor:RGB(55.0, 154.0, 255.0)
                                                    lightSize:8
                                             lightBorderColor:RGB(235.0, 235.0, 235.0)
                                              backgroundColor:UIColorFromRGB(0xdff0ff)
                            ];
        tf.placeholder = @"";
        tf.delegate = self;
        tf.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        tf.font = [UIFont systemFontOfSize:15];
        tf.textAlignment = NSTextAlignmentLeft;
        tf.keyboardType = UIKeyboardTypeDefault;
        tf.returnKeyType = UIReturnKeyDone;
        [cell.contentView addSubview:tf];
    }else if(indexPath.row == 9){
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 9){
        return 60;
    }else{
        return  44;
    }
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
    
    
    
    UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"注册成功！"    //标题
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



@end
