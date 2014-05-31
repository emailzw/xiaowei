//
//  XWRegisterController.h
//  XiaoWei
//
//  Created by 张玮 on 14-5-21.
//  Copyright (c) 2014年 Tonknet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XWRegisterController : UIViewController  <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
@property (weak, nonatomic) IBOutlet UITableView *test;

@end
