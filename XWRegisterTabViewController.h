//
//  XWRegisterTabViewController.h
//  XiaoWei
//
//  Created by 张玮 on 14-7-8.
//  Copyright (c) 2014年 Tonknet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XWComanyResiterController.h"
#import "XWPersonResiterController.h"

@interface XWRegisterTabViewController : UITableViewController 
@property (nonatomic, strong) XWPersonResiterController *person;
@property (nonatomic, strong) XWComanyResiterController *company;
@property (nonatomic, strong) UISegmentedControl *segment;
@property (nonatomic, strong) UITableView *tableview;

@end
