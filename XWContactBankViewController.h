//
//  XWContactBankViewController.h
//  XiaoWei
//
//  Created by 张玮 on 14-5-12.
//  Copyright (c) 2014年 Tonknet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "PSTextField.h"



@interface XWContactBankViewController : UITableViewController <UITextFieldDelegate,UIAlertViewDelegate,UITextViewDelegate>
@property (nonatomic, retain) UITextView *utv ;
@property (strong, nonatomic) PSTextField *mtitle;
@property (strong, nonatomic) PSTextField *message;
@property (strong, nonatomic) NSDictionary *info;

@end
