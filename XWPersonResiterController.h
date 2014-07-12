//
//  XWComanyResiterController.h
//  XiaoWei
//
//  Created by 张玮 on 14-5-21.
//  Copyright (c) 2014年 Tonknet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSTextField.h"
#import "XWSingleSelectionTableViewController.h"

@interface XWPersonResiterController : NSObject <UITableViewDelegate, UITableViewDataSource,UITextFieldDelegate>


@property (strong, nonatomic) UITextField *userCode;
@property (strong, nonatomic) UITextField *customerName;
@property (strong, nonatomic) PSTextField *Password;
@property (strong, nonatomic) PSTextField *Password2;
@property (strong, nonatomic) PSTextField *birthday;
@property (strong, nonatomic) PSTextField *company;
@property (strong, nonatomic) PSTextField *contactPhone;
@property (strong,nonatomic)   UINavigationController  *navigationController;
@property (strong, nonatomic) UITableView *tableView;






-(void) loadSelction ;


@end
