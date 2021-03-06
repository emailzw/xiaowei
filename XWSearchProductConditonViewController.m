//
//  XWSearchProductConditonViewController.m
//  XiaoWei
//
//  Created by 张玮 on 14-4-28.
//  Copyright (c) 2014年 Tonknet. All rights reserved.
//

#import "XWSearchProductConditonViewController.h"
#import "XWGuarantSelectViewController.h"
#import "XWSearchProductResultViewController.h"
#import "XWSearchResultItem.h"
#import "PSTextField.h"
#import "XWSearchProductConditonViewController.h"
#


@interface XWSearchProductConditonViewController ()

@end

@implementation XWSearchProductConditonViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //注册键盘事件用于隐藏提交按钮
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidHide:)
                                                 name:UIKeyboardDidHideNotification object:nil];
    
    
    
    
    /*   UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
     tapGr.cancelsTouchesInView = NO;
     [self.view addGestureRecognizer:tapGr];*/
    
    //  [self._btSearch setFrame:CGRectMake(self._btSearch.frame.origin.x+50, self._btSearch.frame.origin.y, 50,50)];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
	self.navigationItem.title = @"产品查询";
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil] ;
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    //    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    //    backItem.title = @"返回";
    //    backItem.tintColor = [UIColor whiteColor];
    //    [backItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
    //                                      [UIColor whiteColor],NSForegroundColorAttributeName,
    //                                      [UIFont boldSystemFontOfSize:19], NSFontAttributeName, nil] forState:UIControlStateNormal];
    //    self.navigationItem.leftBarButtonItem =  backItem;
    //
    
    
    //    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:77.0f/255.0f green:173.0f/255.0f blue:255.0f/255.0f alpha:1]];
    //    [[UINavigationBar appearance] setBarTintColor:UIColorFromRGB(0x4dadff)];
    
    
    
}
//设置担保方式等下拉菜单显示

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if(self.guarantOptions.count>0){
        NSString *abrr = [[NSString alloc] init];
        for(int i=0;i<self.guarantOptions.count;i++){
            NSDictionary *dict =  [self.guarantOptions objectAtIndex:i];
            NSString *s = [dict objectForKey:@"Value"];
            abrr =  [NSString stringWithFormat:@"%@,%@",abrr,s];
            //(NSString)[dict objectForKey:@"Value"];
        }
        UITableViewCell *cell = [self.tableView viewWithTag:8];
        UILabel *lbl = [[[cell contentView] subviews] objectAtIndex:1];
        lbl.text = [abrr substringFromIndex:1];
        CGRect fm = lbl.frame;
        [lbl setFrame:CGRectMake(100, fm.origin.y, 170, fm.size.height)];
        //   UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(230.0, 0.0, 100.0, 44.0)];
        //  lbl.text = @"请选择";
        
    }else{
        UITableViewCell *cell = [self.tableView viewWithTag:8];
        UILabel *lbl = [[[cell contentView] subviews] objectAtIndex:1];
        CGRect fm = lbl.frame;
        [lbl setFrame:CGRectMake(230, fm.origin.y, 100, fm.size.height)];
        lbl.text = @"请选择";
    }
    
    //贷款主体
    if(self.mainbodyOptions.count>0){
        NSString *abrr = [[NSString alloc] init];
        for(int i=0;i<self.mainbodyOptions.count;i++){
            NSDictionary *dict =  [self.mainbodyOptions objectAtIndex:i];
            NSString *s = [dict objectForKey:@"Value"];
            abrr =  [NSString stringWithFormat:@"%@,%@",abrr,s];
            //(NSString)[dict objectForKey:@"Value"];
        }
        UITableViewCell *cell = [self.tableView viewWithTag:11];
        UILabel *lbl = [[[cell contentView] subviews] objectAtIndex:1];
        lbl.text = [abrr substringFromIndex:1];
        CGRect fm = lbl.frame;
        [lbl setFrame:CGRectMake(100, fm.origin.y, 170, fm.size.height)];
        //   UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(230.0, 0.0, 100.0, 44.0)];
        //  lbl.text = @"请选择";
        
    }else{
        UITableViewCell *cell = [self.tableView viewWithTag:11];
        UILabel *lbl = [[[cell contentView] subviews] objectAtIndex:1];
        CGRect fm = lbl.frame;
        [lbl setFrame:CGRectMake(230, fm.origin.y, 100, fm.size.height)];
        lbl.text = @"请选择";
    }
    
    
    //成立年限
    if(self.establishYearOptions.count>0){
        NSString *abrr = [[NSString alloc] init];
        for(int i=0;i<self.establishYearOptions.count;i++){
            NSDictionary *dict =  [self.establishYearOptions objectAtIndex:i];
            NSString *s = [dict objectForKey:@"Value"];
            abrr =  [NSString stringWithFormat:@"%@,%@",abrr,s];
            //(NSString)[dict objectForKey:@"Value"];
        }
        UITableViewCell *cell = [self.tableView viewWithTag:14];
        UILabel *lbl = [[[cell contentView] subviews] objectAtIndex:1];
        lbl.text = [abrr substringFromIndex:1];
        CGRect fm = lbl.frame;
        [lbl setFrame:CGRectMake(140, fm.origin.y, 170, fm.size.height)];
        //   UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(230.0, 0.0, 100.0, 44.0)];
        //  lbl.text = @"请选择";
        
    }else{
        UITableViewCell *cell = [self.tableView viewWithTag:14];
        UILabel *lbl = [[[cell contentView] subviews] objectAtIndex:1];
        CGRect fm = lbl.frame;
        [lbl setFrame:CGRectMake(230, fm.origin.y, 100, fm.size.height)];
        lbl.text = @"请选择";
    }
    
    
    //所属行业
    if(self.tradeOptions.count>0){
        NSString *abrr = [[NSString alloc] init];
        for(int i=0;i<self.tradeOptions.count;i++){
            NSDictionary *dict =  [self.tradeOptions objectAtIndex:i];
            NSString *s = [dict objectForKey:@"Value"];
            abrr =  [NSString stringWithFormat:@"%@,%@",abrr,s];
            //(NSString)[dict objectForKey:@"Value"];
        }
        UITableViewCell *cell = [self.tableView viewWithTag:12];
        UILabel *lbl = [[[cell contentView] subviews] objectAtIndex:1];
        lbl.text = [abrr substringFromIndex:1];
        CGRect fm = lbl.frame;
        [lbl setFrame:CGRectMake(140, fm.origin.y, 170, fm.size.height)];
        //   UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(230.0, 0.0, 100.0, 44.0)];
        //  lbl.text = @"请选择";
        
    }else{
        UITableViewCell *cell = [self.tableView viewWithTag:12];
        UILabel *lbl = [[[cell contentView] subviews] objectAtIndex:1];
        CGRect fm = lbl.frame;
        [lbl setFrame:CGRectMake(230, fm.origin.y, 100, fm.size.height)];
        lbl.text = @"请选择";
    }
    

    
    
    //注册地
    if(self.registerPlaceOptions.count>0){
        NSString *abrr = [[NSString alloc] init];
        for(int i=0;i<self.registerPlaceOptions.count;i++){
            NSDictionary *dict =  [self.registerPlaceOptions objectAtIndex:i];
            NSString *s = [dict objectForKey:@"Value"];
            abrr =  [NSString stringWithFormat:@"%@,%@",abrr,s];
            //(NSString)[dict objectForKey:@"Value"];
        }
        UITableViewCell *cell = [self.tableView viewWithTag:18];
        UILabel *lbl = [[[cell contentView] subviews] objectAtIndex:1];
        lbl.text = [abrr substringFromIndex:1];
        CGRect fm = lbl.frame;
        [lbl setFrame:CGRectMake(140, fm.origin.y, 170, fm.size.height)];
        //   UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(230.0, 0.0, 100.0, 44.0)];
        //  lbl.text = @"请选择";
        
    }else{
        UITableViewCell *cell = [self.tableView viewWithTag:18];
        UILabel *lbl = [[[cell contentView] subviews] objectAtIndex:1];
        CGRect fm = lbl.frame;
        [lbl setFrame:CGRectMake(230, fm.origin.y, 100, fm.size.height)];
        lbl.text = @"请选择";
    }
    

    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 11;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if( indexPath.row == 10){
        return 58;
    }else{
        return 44;
    }
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    if(indexPath.row == 0){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"row0"];
        cell.tag = 11;

        cell.textLabel.text = @"贷款主体：";
        cell.textLabel.font = [UIFont boldSystemFontOfSize:15];
        //下面这句相同效果
        // [cell.textLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:15]];
        cell.textLabel.textColor = UIColorFromRGB(0x000000);
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(230.0, 0.0, 100.0, 44.0)];
        lbl.text = @"请选择";
        lbl.font = [UIFont boldSystemFontOfSize:15];;
        lbl.textColor =UIColorFromRGB(0x9e9e9e);
        [cell.contentView addSubview:lbl];
        
        
    }else if(indexPath.row == 1){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"row1"];
        cell.textLabel.text = @"所属行业或类型：";
        cell.textLabel.font = [UIFont boldSystemFontOfSize:15];
        cell.tag = 12;

        //下面这句相同效果
        // [cell.textLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:15]];
        cell.textLabel.textColor = UIColorFromRGB(0x000000);
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(230.0, 0.0, 100.0, 44.0)];
        lbl.text = @"请选择";
        lbl.font = [UIFont boldSystemFontOfSize:15];;
        lbl.textColor =UIColorFromRGB(0x9e9e9e);
        [cell.contentView addSubview:lbl];
    } else if(indexPath.row == 2){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"row2"];
        cell.textLabel.text = @"资金需求：";
        cell.textLabel.font = [UIFont boldSystemFontOfSize:15];
        //下面这句相同效果
        // [cell.textLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:15]];
        cell.textLabel.textColor = UIColorFromRGB(0x000000);
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        
        UITextField  *tf = [[PSTextField alloc] initWithFrame:CGRectMake(100, 4.5, 170,35)
                                                  cornerRadio:5
                                                  borderColor:RGB(166.0, 166.0, 166.0)
                                                  borderWidth:0
                                                   lightColor:RGB(55.0, 154.0, 255.0)
                                                    lightSize:8
                                             lightBorderColor:RGB(235.0, 235.0, 235.0)
                                              backgroundColor:UIColorFromRGB(0xdff0ff)
                            ];
       // tf.placeholder = @"（万元）";
        tf.delegate = self;
        tf.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        tf.font = [UIFont systemFontOfSize:15];
        tf.textAlignment = NSTextAlignmentRight;
        tf.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
        tf.returnKeyType = UIReturnKeyDone;
        
        [cell.contentView addSubview:tf];
        
        UILabel *unit = [[UILabel alloc] initWithFrame:CGRectMake(275, 0.0, 35, cell.frame.size.height)];
        unit.font = [UIFont systemFontOfSize:15];
        unit.text = @"万元";
        unit.textColor =UIColorFromRGB(0x9e9e9e);

        [cell.contentView addSubview:unit];

        
        /*  UITextField  *tf = [[UITextField alloc] initWithFrame:CGRectMake(100.0, 4.5, 210.0, 35.0)];
         tf.placeholder = @"（万元）";
         tf.borderStyle = UITextBorderStyleRoundedRect;
         tf.delegate = self;
         tf.font = [UIFont boldSystemFontOfSize:15];;
         tf.textColor =UIColorFromRGB(0x000000);*/
        
        
    }
    else if(indexPath.row == 3){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"row3"];
        cell.textLabel.text = @"贷款期限：";
        cell.textLabel.font = [UIFont boldSystemFontOfSize:15];
        //下面这句相同效果
        // [cell.textLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:15]];
        cell.textLabel.textColor = UIColorFromRGB(0x000000);
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        
        UITextField  *tf = [[PSTextField alloc] initWithFrame:CGRectMake(100, 4.5, 170,35)
                                                  cornerRadio:5
                                                  borderColor:RGB(166.0, 166.0, 166.0)
                                                  borderWidth:0
                                                   lightColor:RGB(55.0, 154.0, 255.0)
                                                    lightSize:8
                                             lightBorderColor:RGB(235.0, 235.0, 235.0)
                                              backgroundColor:UIColorFromRGB(0xdff0ff)
                            ];
      //  tf.placeholder = @"（月）";
        tf.delegate = self;
        tf.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        tf.font = [UIFont systemFontOfSize:15];
        [cell.contentView addSubview:tf];
        tf.textAlignment = NSTextAlignmentRight;
        tf.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
        tf.returnKeyType = UIReturnKeyDone;
        
        
        UILabel *unit = [[UILabel alloc] initWithFrame:CGRectMake(275, 0.0, 35, cell.frame.size.height)];
        unit.font = [UIFont systemFontOfSize:15];
        unit.text = @"月";
        unit.textColor =UIColorFromRGB(0x9e9e9e);
        
        [cell.contentView addSubview:unit];

        
        /*  UITextField  *tf = [[UITextField alloc] initWithFrame:CGRectMake(100.0, 4.5, 210.0, 35.0)];
         tf.placeholder = @"（万元）";
         tf.borderStyle = UITextBorderStyleRoundedRect;
         tf.delegate = self;
         tf.font = [UIFont boldSystemFontOfSize:15];;
         tf.textColor =UIColorFromRGB(0x000000);*/
        
        
    }
    else if(indexPath.row == 4){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"row4"];
        cell.textLabel.text = @"企业成立年限：";
        cell.textLabel.font = [UIFont boldSystemFontOfSize:15];
        cell.tag = 14;

        //下面这句相同效果
        // [cell.textLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:15]];
        cell.textLabel.textColor = UIColorFromRGB(0x000000);
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(230.0, 0.0, 100.0, 44.0)];
        lbl.text = @"请选择";
        lbl.font = [UIFont boldSystemFontOfSize:15];;
        lbl.textColor =UIColorFromRGB(0x9e9e9e);
        [cell.contentView addSubview:lbl];
    }
    else if(indexPath.row == 5){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"row5"];
        cell.textLabel.text = @"企业注册地：";
        cell.textLabel.font = [UIFont boldSystemFontOfSize:15];
        cell.tag = 18;

        //下面这句相同效果
        // [cell.textLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:15]];
        cell.textLabel.textColor = UIColorFromRGB(0x000000);
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(230.0, 0.0, 100.0, 44.0)];
        lbl.text = @"请选择";
        lbl.font = [UIFont boldSystemFontOfSize:15];;
        lbl.textColor =UIColorFromRGB(0x9e9e9e);
        [cell.contentView addSubview:lbl];
    }
    else if(indexPath.row == 6){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"row6"];
        cell.textLabel.text = @"企业总资产：";
        cell.textLabel.font = [UIFont boldSystemFontOfSize:15];
        //下面这句相同效果
        // [cell.textLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:15]];
        cell.textLabel.textColor = UIColorFromRGB(0x000000);
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        
        UITextField  *tf = [[PSTextField alloc] initWithFrame:CGRectMake(100, 4.5, 170,35)
                                                  cornerRadio:5
                                                  borderColor:RGB(166.0, 166.0, 166.0)
                                                  borderWidth:0
                                                   lightColor:RGB(55.0, 154.0, 255.0)
                                                    lightSize:8
                                             lightBorderColor:RGB(235.0, 235.0, 235.0)
                                              backgroundColor:UIColorFromRGB(0xdff0ff)
                            ];
//        tf.placeholder = @"（万元）";
        tf.delegate = self;
        tf.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        tf.font = [UIFont systemFontOfSize:15];
        [cell.contentView addSubview:tf];
        tf.textAlignment = NSTextAlignmentRight;
        tf.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
        tf.returnKeyType = UIReturnKeyDone;
        
        
        UILabel *unit = [[UILabel alloc] initWithFrame:CGRectMake(275, 0.0, 35, cell.frame.size.height)];
        unit.font = [UIFont systemFontOfSize:15];
        unit.text = @"万元";
        unit.textColor =UIColorFromRGB(0x9e9e9e);
        
        [cell.contentView addSubview:unit];

        
        /*  UITextField  *tf = [[UITextField alloc] initWithFrame:CGRectMake(100.0, 4.5, 210.0, 35.0)];
         tf.placeholder = @"（万元）";
         tf.borderStyle = UITextBorderStyleRoundedRect;
         tf.delegate = self;
         tf.font = [UIFont boldSystemFontOfSize:15];;
         tf.textColor =UIColorFromRGB(0x000000);*/
        
        
    }
    else if(indexPath.row == 7){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@""];
        cell.textLabel.text = @"年营业收：";
        cell.textLabel.font = [UIFont boldSystemFontOfSize:15];
        //下面这句相同效果
        
        cell.textLabel.textColor = UIColorFromRGB(0x000000);
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        
        UITextField  *tf = [[PSTextField alloc] initWithFrame:CGRectMake(100, 4.5, 170,35)
                                                  cornerRadio:5
                                                  borderColor:RGB(166.0, 166.0, 166.0)
                                                  borderWidth:0
                                                   lightColor:RGB(55.0, 154.0, 255.0)
                                                    lightSize:8
                                             lightBorderColor:RGB(235.0, 235.0, 235.0)
                                              backgroundColor:UIColorFromRGB(0xdff0ff)
                            ];
       // tf.placeholder = @"（万元）";
        tf.delegate = self;
        tf.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        tf.font = [UIFont systemFontOfSize:15];
        [cell.contentView addSubview:tf];
        tf.textAlignment = NSTextAlignmentRight;
        tf.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
        tf.returnKeyType = UIReturnKeyDone;
        
        
        UILabel *unit = [[UILabel alloc] initWithFrame:CGRectMake(275, 0.0, 35, cell.frame.size.height)];
        unit.font = [UIFont systemFontOfSize:15];
        unit.text = @"万元";
        unit.textColor =UIColorFromRGB(0x9e9e9e);
        
        [cell.contentView addSubview:unit];

        
        /*  UITextField  *tf = [[UITextField alloc] initWithFrame:CGRectMake(100.0, 4.5, 210.0, 35.0)];
         tf.placeholder = @"（万元）";
         tf.borderStyle = UITextBorderStyleRoundedRect;
         tf.delegate = self;
         tf.font = [UIFont boldSystemFontOfSize:15];;
         tf.textColor =UIColorFromRGB(0x000000);*/
        
        
    }
    else if(indexPath.row == 8){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"row8"];
        cell.textLabel.text = @"担保方式：";
        cell.textLabel.font = [UIFont boldSystemFontOfSize:15];
        cell.tag = 8;
        //下面这句相同效果
        // [cell.textLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:15]];
        cell.textLabel.textColor = UIColorFromRGB(0x000000);
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(230.0, 0.0, 100.0, 44.0)];
        lbl.text = @"请选择";
        lbl.font = [UIFont boldSystemFontOfSize:15];;
        lbl.textColor =UIColorFromRGB(0x9e9e9e);
        [cell.contentView addSubview:lbl];
    }
    else if(indexPath.row == 9){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@""];
        cell.textLabel.text = @"相关银行：";
        cell.textLabel.font = [UIFont boldSystemFontOfSize:15];
        //下面这句相同效果
        // [cell.textLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:15]];
        cell.textLabel.textColor = UIColorFromRGB(0x000000);
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        
        UITextField  *tf = [[PSTextField alloc] initWithFrame:CGRectMake(100, 4.5, 210,35)
                                                  cornerRadio:5
                                                  borderColor:RGB(166.0, 166.0, 166.0)
                                                  borderWidth:0
                                                   lightColor:RGB(55.0, 154.0, 255.0)
                                                    lightSize:8
                                             lightBorderColor:RGB(235.0, 235.0, 235.0)
                                              backgroundColor:UIColorFromRGB(0xdff0ff)
                            ];
        tf.placeholder = @"";
        tf.delegate = self;
        tf.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        tf.font = [UIFont systemFontOfSize:15];
        [cell.contentView addSubview:tf];
        tf.textAlignment = NSTextAlignmentRight;
        tf.returnKeyType = UIReturnKeyDone;
        
        /*  UITextField  *tf = [[UITextField alloc] initWithFrame:CGRectMake(100.0, 4.5, 210.0, 35.0)];
         tf.placeholder = @"（万元）";
         tf.borderStyle = UITextBorderStyleRoundedRect;
         tf.delegate = self;
         tf.font = [UIFont boldSystemFontOfSize:15];;
         tf.textColor =UIColorFromRGB(0x000000);*/
        
        
    }
    else if(indexPath.row == 10){
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"footer"];
        UIButton *button =  [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button setTitle: @"查询" forState:UIControlStateNormal];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [button addTarget:self action:@selector(commit) forControlEvents:UIControlEventTouchUpInside];
        
        
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont boldSystemFontOfSize:19];
        [button setBackgroundImage:[UIImage imageNamed:@"btn.png"] forState:UIControlStateNormal];
        //button.backgroundColor = [UIColor clearColor];
        
        [button sizeToFit];
        button.frame = CGRectMake(20,10.0f,280,38);
        //container的宽度比UILabel多出是个像素这些像素用于缩进
        CGRect resultFrame = CGRectMake(0.0f, 0.0f,320,52);
        UIView *background = [[UIView alloc] initWithFrame:resultFrame];
        background.opaque = NO;
        
        background.backgroundColor = [UIColor redColor];
        [background addSubview:button];
        
        /*
         UIView *tempView = [[UIView alloc] init];
         
         [cell setBackgroundView:tempView];
         [cell setBackgroundColor:[UIColor clearColor]];*/
        
        
        [cell addSubview:button];
        
    }
    else{
        static NSString *CellIdentifier = @"Cell";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
    }
    return cell;
    
    
}



- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    //    if (indexPath.row%2 == 0) {
    //        UIColor *altCellColor = [UIColor colorWithWhite:0.7 alpha:0.1];
    //        cell.backgroundColor = altCellColor;
    //    }
}


- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    //  if (theTextField == self.textField) {
    [theTextField resignFirstResponder];
    //}
    return YES;
}


- (BOOL)textFieldDidEndEditing:(UITextField *)theTextField {
    //  if (theTextField == self.textField) {
    [theTextField resignFirstResponder];
    //}
    return YES;
}


/*
 
 - (UIView *) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
 
 UIView *result = nil;
 UIButton *button =  [UIButton buttonWithType:UIButtonTypeRoundedRect];
 [button setTitle: @"查询" forState:UIControlStateNormal];
 
 [button addTarget:self action:@selector(commit) forControlEvents:UIControlEventTouchUpInside];
 
 
 [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
 button.titleLabel.font = [UIFont boldSystemFontOfSize:19];
 [button setBackgroundImage:[UIImage imageNamed:@"btn.png"] forState:UIControlStateNormal];
 //button.backgroundColor = [UIColor clearColor];
 
 [button sizeToFit];
 button.frame = CGRectMake(20,10.0f,280,38);
 //container的宽度比UILabel多出是个像素这些像素用于缩进
 //  CGRect resultFrame = CGRectMake(0.0f, 0.0f,button.frame.size.height,button.frame.size.width + 10.0f);
 
 result = [[UIView alloc] initWithFrame:button.frame ];
 [result addSubview:button];
 _footer = result;
 return result;
 }
 
 
 - (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
 {
 return 55;
 }
 */
- (void)commit {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    XWSearchResultItem *item = [[XWSearchResultItem alloc] init];
    
    item.bankIcon = @"zheshang";
    item.bankName = @"浙商银行上海分行";
    item.productName =@"三年贷";
    item.productDesc=@"还款方式：分期还款，一次还本";
    item.releaseDate=@"2014/4/15";
    [result addObject:item];
    
    item = [[XWSearchResultItem alloc] init];
    item.bankIcon = @"zheshang";
    item.bankName = @"浙商银行上海分行";
    item.productName =@"一日贷";
    item.productDesc=@"还款方式：分期还款，一次还本";
    item.releaseDate=@"2014/4/15";
    [result addObject:item];

    
    item = [[XWSearchResultItem alloc] init];
    item.bankIcon = @"zheshang";
    item.bankName = @"浙商银行上海分行";
    item.productName =@"全额贷";
    item.productDesc=@"还款方式：分期还款，一次还本";
    item.releaseDate=@"2014/4/15";
    [result addObject:item];
    
    
    item = [[XWSearchResultItem alloc] init];
    item.bankIcon = @"zheshang";
    item.bankName = @"浙商银行上海分行";
    item.productName =@"小企业固定资产贷";
    item.productDesc=@"还款方式：按期还本付息";
    item.releaseDate=@"2014/4/15";
    [result addObject:item];
    
    
    
    item = [[XWSearchResultItem alloc] init];
    item.bankIcon = @"nanjing";
    item.bankName = @"南京银行上海分行";
    item.productName =@"小企业抵（质）押循环贷";
    item.productDesc =@"还款方式：借款人与我行一次性签订合同，由借款人提供抵押品担保";
    item.releaseDate=@"2014/4/14";
    [result addObject:item];
    item = [[XWSearchResultItem alloc] init];
    item.bankIcon = @"huaxia";
    item.bankName = @"华夏银行上海分行	";
    item.productName =@"宽限期还本付息贷";
    item.productDesc =@"";
    item.releaseDate=@"2014/5/11";
    [result addObject:item];
    item = [[XWSearchResultItem alloc] init];
    item.bankIcon = @"huaxia";
    item.bankName = @"华夏银行上海分行";
    item.productName =@"循环贷";
    item.productDesc =@"随借随还";
    item.releaseDate=@"2014/5/11";
    [result addObject:item];
    item = [[XWSearchResultItem alloc] init];
    item.bankIcon = @"jiaotong";
    item.bankName = @"交通银行上海市分行";
    item.productName =@"物业融资";
    item.productDesc =@"按月或按季还本付息";
    item.releaseDate=@"2014/5/14";
    [result addObject:item];
    
    item = [[XWSearchResultItem alloc] init];
    item.bankIcon = @"zhaoshang";
    item.bankName = @"招商银行股份有限公司上海分行";
    item.productName =@"自主贷";
    item.productDesc =@"1年以上须分期还款，1年以内可到期一次性还款";
    item.releaseDate=@"2014/5/14";
    [result addObject:item];
    
    XWSearchProductResultViewController *controller = [[ XWSearchProductResultViewController alloc] initWithNibName:@"XWSearchProductResultViewController" bundle:nil];
    controller.results = result;
    controller.title = @"资金需求为1万、贷款期限为2月、 本地注册资金为100万、担保方式为";
    
    [self.navigationController pushViewController:controller  animated:YES];
}



- (void)keyboardWillShow:(NSNotification*) aNotification {
    if(_footer)
        _footer.hidden = YES;
    
}



- (void)keyboardDidHide:(NSNotification*) aNotification {
    if(_footer)
        _footer.hidden = NO;
    
}


/*
 
 -(void)viewTapped:(UITapGestureRecognizer*)tapGr
 {
 //   [activitySearchBar resignFirstResponder];
 }
 */


/*
 -(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
 {
 
 //
 //        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
 //
 //
 //    [button setImage:[UIImage imageNamed:@"btquery.jpg"] forState:UIControlStateNormal];
 //    CGRect newFrame = button.frame;
 //    newFrame.origin.x = 100;
 //    newFrame.size.width =100;
 //    button.frame = newFrame;
 //
 //        return button;
 
 
 //UITableViewHeaderFooterView *view = [tableView footerViewForSection:0];
 UIView* footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 38.0)];
 
 
 UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
 [button setImage:[UIImage imageNamed:@"btquery.jpg"] forState:UIControlStateNormal];
 [footerView addSubview:button];
 return footerView;
 
 //UIButton* btnNextPage = [[UIButton alloc] initWithFrame:footerView.frame];
 //    btnNextPage.titleLabel.text = @"查询";
 
 //[footerView addSubview:btnNextPage];
 //   [view addSubview:footerView];
 
 //    return btnNextPage;
 
 
 }
 */


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //贷款主体
    if( indexPath.row == 0 ){
        
        if(!self.mainBody){
            self.mainBody = [[ XWSingleSelectionTableViewController alloc] initWithNibName:@"XWSingleSelectionTableViewController" bundle:nil];
            
            
            
            NSError *error;
            NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://192.168.1.201:3000/customertype"]];
            NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
            NSArray *options = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableContainers  error:&error];
 
            NSLog(@"主体类型 options%@", options );
            NSMutableArray *items = [[NSMutableArray alloc] init];
            
            for ( int i=0; i<[options count] ;i++){
                
                NSDictionary *section = [NSDictionary dictionaryWithObjectsAndKeys:options[i],@"Value",options[i],@"Key",nil];
                [items addObject:section];
            }
            
           
            self.mainBody.menuItems = items;
            self.mainbodyOptions =  [[NSMutableArray alloc] init];
            self.mainBody.target = self.mainbodyOptions;
            self.mainBody.title =@"贷款主体";
            
            
            
            
            
        }
        
        [self.navigationController pushViewController:self.mainBody  animated:YES];
        
        
    }
    //所属行业
    else if (indexPath.row == 1){
        if(!self.trade){
            self.trade = [[ XWSingleSelectionTableViewController alloc] initWithNibName:@"XWSingleSelectionTableViewController" bundle:nil];
            
            
            NSMutableArray *items = [[NSMutableArray alloc] init];
            NSDictionary *section = [NSDictionary dictionaryWithObjectsAndKeys:@"制造业",@"Value",@"company",@"Key",nil];
            [items addObject:section];
            section = [NSDictionary dictionaryWithObjectsAndKeys:@"批发、零售业",@"Value",@"person",@"Key",nil];
            [items addObject:section];
            section = [NSDictionary dictionaryWithObjectsAndKeys:@"服务业",@"Value",@"person",@"Key",nil];
            [items addObject:section];
            section = [NSDictionary dictionaryWithObjectsAndKeys:@"科技型",@"Value",@"person",@"Key",nil];
            [items addObject:section];
            section = [NSDictionary dictionaryWithObjectsAndKeys:@"其他",@"Value",@"person",@"Key",nil];
            [items addObject:section];
            
            self.trade.menuItems = items;
            self.tradeOptions =  [[NSMutableArray alloc] init];
            self.trade.target = self.tradeOptions;
            self.trade.title =@"所属行业";

            
        }
        
        [self.navigationController pushViewController:self.trade  animated:YES];

        
    }//成立年限
    else if (indexPath.row == 4){
        if(!self.establishYear){
            self.establishYear = [[ XWSingleSelectionTableViewController alloc] initWithNibName:@"XWSingleSelectionTableViewController" bundle:nil];
            
            
            NSMutableArray *items = [[NSMutableArray alloc] init];
            NSDictionary *section = [NSDictionary dictionaryWithObjectsAndKeys:@"1年",@"Value",@"company",@"Key",nil];
            [items addObject:section];
            section = [NSDictionary dictionaryWithObjectsAndKeys:@"2年",@"Value",@"person",@"Key",nil];
            [items addObject:section];
            section = [NSDictionary dictionaryWithObjectsAndKeys:@"3年",@"Value",@"person",@"Key",nil];
            [items addObject:section];
            section = [NSDictionary dictionaryWithObjectsAndKeys:@"4年",@"Value",@"person",@"Key",nil];
            [items addObject:section];
            section = [NSDictionary dictionaryWithObjectsAndKeys:@"5年",@"Value",@"person",@"Key",nil];
            [items addObject:section];
            section = [NSDictionary dictionaryWithObjectsAndKeys:@"5年以上",@"Value",@"person",@"Key",nil];
            [items addObject:section];
            self.establishYear.menuItems = items;
            self.establishYearOptions =  [[NSMutableArray alloc] init];
            self.establishYear.target = self.establishYearOptions;
            self.establishYear.title =@"成立年限";

            
        }
        
        [self.navigationController pushViewController:self.establishYear  animated:YES];

        
    }//企业注册地
    else if (indexPath.row == 5){
        if(!self.registerPlace){
            self.registerPlace = [[ XWSingleSelectionTableViewController alloc] initWithNibName:@"XWSingleSelectionTableViewController" bundle:nil];
            
            
            NSMutableArray *items = [[NSMutableArray alloc] init];
            NSDictionary *section = [NSDictionary dictionaryWithObjectsAndKeys:@"本地",@"Value",@"company",@"Key",nil];
            [items addObject:section];
            section = [NSDictionary dictionaryWithObjectsAndKeys:@"异地",@"Value",@"person",@"Key",nil];
            [items addObject:section];
            section = [NSDictionary dictionaryWithObjectsAndKeys:@"不限",@"Value",@"person",@"Key",nil];
            [items addObject:section];
                   self.registerPlace.menuItems = items;
            self.registerPlaceOptions =  [[NSMutableArray alloc] init];
            self.registerPlace.target = self.registerPlaceOptions;
            self.registerPlace.title =@"企业注册地";

            
        }
        
        [self.navigationController pushViewController:self.registerPlace  animated:YES];

        
    }//担保方式
    else if (indexPath.row == 8){
        
        if(!self.guarantSelectViewController){
            self.guarantSelectViewController = [[ XWGuarantSelectViewController alloc] initWithNibName:@"XWGuarantSelectViewController" bundle:nil];
        }
        [self.navigationController pushViewController:self.guarantSelectViewController  animated:YES];
        
    }
    
}


@end
