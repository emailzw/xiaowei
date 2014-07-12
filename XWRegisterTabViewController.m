//
//  XWRegisterTabViewController.m
//  XiaoWei
//
//  Created by 张玮 on 14-7-8.
//  Copyright (c) 2014年 Tonknet. All rights reserved.
//

#import "XWRegisterTabViewController.h"
#import "XWRegisterController.h"
#import "XWRegisterPersonController.h"
#import "XWComanyResiterController.h"

@interface XWRegisterTabViewController ()

@end

@implementation XWRegisterTabViewController




-(void) loadView
{
    
    
    UIView *parentView = [[UIView alloc] initWithFrame:[ UIScreen mainScreen ].applicationFrame];
    parentView.backgroundColor = [UIColor whiteColor];
    parentView.tag = 1000;
    self.view = parentView;
    CGRect frame = CGRectMake(35, 70,250, 29);
    
    self.segment = [[UISegmentedControl alloc] initWithFrame:frame];
    
    [self.segment setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
    
  //  UISegmentedControl *segment = UISegmentedControl
    NSArray *contents = [[NSArray alloc] initWithObjects:@"企业注册",@"个人注册",nil];
    [self.segment initWithItems:contents];
    [self.segment setFrame:frame];
    [self.segment setSelectedSegmentIndex:0];
    [self.view addSubview:self.segment];
    
    
    self.tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, 320, 468)];
   //  self.person = [[XWRegisterPersonController alloc] init];

    self.company = [[XWComanyResiterController alloc] init];
    
    self.tableview.dataSource = self.company;
    self.tableview.delegate =  self.company;
    self.company.tableView = self.tableview;
    self.company.navigationController = self.navigationController;

    
//    XWRegisterPersonController  *cmp = [[XWRegisterPersonController alloc] initWithNibName:@"XWRegisterPersonController" bundle:nil];
   
    
    [self.view addSubview: self.tableview];
    
    
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (self.segment.numberOfSegments  ==1){
        return;
    }else{
        [self.company loadSelction];
    }
     
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/





@end