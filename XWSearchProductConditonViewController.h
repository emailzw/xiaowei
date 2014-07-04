//
//  XWSearchProductConditonViewController.h
//  XiaoWei
//
//  Created by 张玮 on 14-4-28.
//  Copyright (c) 2014年 Tonknet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XWGuarantSelectViewController.h"
#import "XWSingleSelectionTableViewController.h"

@interface XWSearchProductConditonViewController : UITableViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *_btSearch;
@property (strong, nonatomic)  UIView *footer;
@property (strong, nonatomic) NSArray *guarantOptions;
@property (strong, nonatomic) NSArray *mainbodyOptions;
@property (strong, nonatomic) NSArray *tradeOptions;
@property (strong, nonatomic) NSArray *establishYearOptions;
@property (strong, nonatomic) NSArray *registerPlaceOptions	;




@property (strong, nonatomic) XWGuarantSelectViewController *guarantSelectViewController;
@property (strong, nonatomic) XWSingleSelectionTableViewController *mainBody;
@property (strong, nonatomic) XWSingleSelectionTableViewController *trade;
@property (strong, nonatomic) XWSingleSelectionTableViewController *establishYear;
@property (strong, nonatomic) XWSingleSelectionTableViewController *registerPlace;


@end
