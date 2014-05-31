//
//  XWSingleSelectionTableViewController.h
//  XiaoWei
//
//  Created by 张玮 on 14-5-27.
//  Copyright (c) 2014年 Tonknet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XWSingleSelectionTableViewController : UITableViewController

@property (nonatomic, retain) NSArray *menuItems;
@property (nonatomic, retain) NSDictionary *selection;
@property (nonatomic, retain) id target;

@end
