//
//  XWSearchProductConditonViewController.h
//  XiaoWei
//
//  Created by 张玮 on 14-4-28.
//  Copyright (c) 2014年 Tonknet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XWGuarantSelectViewController.h"

@interface XWSearchProductConditonViewController : UITableViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *_btSearch;
@property (strong, nonatomic)  UIView *footer;
@property (strong, nonatomic) NSArray *guarantOptions;
@property (strong, nonatomic) XWGuarantSelectViewController *guarantSelectViewController;


@end
