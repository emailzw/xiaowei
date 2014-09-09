//
//  XWLoginController.h
//  XiaoWei
//
//  Created by 张玮 on 14-7-13.
//  Copyright (c) 2014年 Tonknet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSTextField.h"
@interface XWLoginController : UIViewController <UITableViewDelegate, UITableViewDataSource,UITextFieldDelegate>
@property (strong, nonatomic) PSTextField *userCode;
@property (strong, nonatomic) PSTextField *password;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@end
    