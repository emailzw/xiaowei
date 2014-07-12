//
//  XWRegisterTabViewController.h
//  XiaoWei
//
//  Created by 张玮 on 14-7-8.
//  Copyright (c) 2014年 Tonknet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XWRegisterPersonController.h"
#import "XWComanyResiterController.h"

@interface XWRegisterTabViewController : UIViewController 
@property (nonatomic, strong) XWRegisterPersonController *person;
@property (nonatomic, strong) XWComanyResiterController *company;
@property (nonatomic, strong) UISegmentedControl *segment;
@property (nonatomic, strong) UITableView *tableview;

@end
