//
//  XWRegisterController.h
//  XiaoWei
//
//  Created by 张玮 on 14-5-21.
//  Copyright (c) 2014年 Tonknet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSTextField.h"
#import "XWSingleSelectionTableViewController.h"
@interface XWRegisterController : UIViewController  <UITableViewDelegate, UITableViewDataSource,UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) UITextField *userCode;
@property (strong, nonatomic) PSTextField *Password;
@property (strong, nonatomic) PSTextField *Password2;
@property (strong, nonatomic) PSTextField *registerAddrType;
@property (strong, nonatomic) PSTextField *ageLimit;
@property (strong, nonatomic) PSTextField *industry2;
@property (strong, nonatomic) PSTextField *contactPerson;
@property (strong, nonatomic) PSTextField *contactPhone;
@property  NSInteger tab;




@property (strong, nonatomic) NSArray *tradeOptions;
@property (strong, nonatomic) NSArray *establishYearOptions;
@property (strong, nonatomic) NSArray *registerPlaceOptions	;

@property (strong, nonatomic) XWSingleSelectionTableViewController *trade;
@property (strong, nonatomic) XWSingleSelectionTableViewController *establishYear;
@property (strong, nonatomic) XWSingleSelectionTableViewController *registerPlace;

@end
