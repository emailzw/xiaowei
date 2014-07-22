//
//  XWChangePasswordViewController.h
//  XiaoWei
//
//  Created by 张玮 on 14-5-28.
//  Copyright (c) 2014年 Tonknet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSTextField.h"


@interface XWChangePasswordViewController : UITableViewController
@property (strong, nonatomic) PSTextField *oldpassoword;
@property (strong, nonatomic) PSTextField *password;
@property (strong, nonatomic) PSTextField *password2;

@end
