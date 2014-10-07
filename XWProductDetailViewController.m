//
//  XWProductDetailViewController.m
//  XiaoWei
//
//  Created by 张玮 on 14-5-5.
//  Copyright (c) 2014年 Tonknet. All rights reserved.
//

#import "XWProductDetailViewController.h"
#import "XWContactBankViewController.h"
#import "XWLoginController.h"
#import "DXAlertView.h"
#import "XWBankListTableViewController.h"

@interface XWProductDetailViewController ()

@end


@interface UIAlertView (extended)
    - (UITextField *) textFieldAtIndex: (int) index;
    - (void) addTextFieldWithValue: (NSString *) value label: (NSString *) label;
    - (void) addSubview:(UIView *)view;

    @end


@implementation XWProductDetailViewController

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
    
    self.navigationItem.title = @"产品详情";
    

    //加载产品数据
    NSDictionary *detail;
    @try{
        
        NSMutableString  *url =  [[NSMutableString alloc] initWithString:SERVER_URL];
        
        
        NSString *uid =  [[NSUserDefaults standardUserDefaults] objectForKey:LOGIN];
        
        if (uid == nil){
            [url appendString: [NSString  stringWithFormat: @"product/detail/%@",self.productID]];
        }else{
            [url appendString: [NSString  stringWithFormat: @"product/detail/%@/%@",uid,self.productID]];
        }
        NSError *error;
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
        NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        NSDictionary *raw = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves  error:&error];
    //    NSLog(raw);
        NSString *code = [raw objectForKey:@"code"];
        if(![code isEqualToString:@"101"]){
            UIAlertView * alert =
            [[UIAlertView alloc]
             initWithTitle:@"错误"
             message: [[NSString alloc] initWithFormat:@"数据加载失败:%@",code]
             delegate:self
             cancelButtonTitle:nil
             otherButtonTitles:@"OK", nil];
            [alert show];
            return;
            
        }
        detail = [raw objectForKey:@"message"];
        NSLog(@"product/detail detail%@", detail );
        
    }@catch (NSException *e){
        NSLog(@"Exception: %@", e);
        UIAlertView * alert =
        [[UIAlertView alloc]
         initWithTitle:@"错误"
         message: [[NSString alloc] initWithFormat:@"数据加载失败"]
         delegate:self
         cancelButtonTitle:nil
         otherButtonTitles:@"OK", nil];
        [alert show];
        return ;
    }
    self.productDetail = detail;
    BOOL favo = [self isFavorit];
    if(!favo){
        UIButton *favoButton = [UIButton buttonWithType:101];
        
        [favoButton addTarget:self action:@selector(favorite) forControlEvents:UIControlEventTouchUpInside];
        [favoButton setTitle:@"收藏" forState:UIControlStateNormal];
        
        UIBarButtonItem *favaItem = [[UIBarButtonItem alloc] initWithCustomView:favoButton];
        
        
        favaItem.tintColor = [UIColor whiteColor];
        [favaItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                          [UIColor whiteColor],NSForegroundColorAttributeName,
                                          [UIFont boldSystemFontOfSize:19], NSFontAttributeName, nil] forState:UIControlStateNormal];
        self.navigationItem.rightBarButtonItem =  favaItem;

        
    }else{
        UIButton *favoButton = [UIButton buttonWithType:101];
        
        [favoButton addTarget:self action:@selector(cancelFavorite) forControlEvents:UIControlEventTouchUpInside];
        [favoButton setTitle:@"取消收藏" forState:UIControlStateNormal];
        
        UIBarButtonItem *favaItem = [[UIBarButtonItem alloc] initWithCustomView:favoButton];
        
        
        favaItem.tintColor = [UIColor whiteColor];
        [favaItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                          [UIColor whiteColor],NSForegroundColorAttributeName,
                                          [UIFont boldSystemFontOfSize:19], NSFontAttributeName, nil] forState:UIControlStateNormal];
        self.navigationItem.rightBarButtonItem =  favaItem;
        

    }

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return 15;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
   /* UITableViewCell  *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    UILabel *lbl = [[[cell contentView] subviews] objectAtIndex:0];
    return lbl.frame.size.height;

    if (indexPath.section == 0 && indexPath.row == 0) {
        return 132;
    } else {
        return 38;
    }
    
    return cell.frame.size.height;*/
    if (indexPath.row == 1){
        
        
        return [self getRowHeightByKey:@"productname" width:220];

        
    }
    
   else if (indexPath.row == 3){
        
       return [self getRowHeightByKey:@"tradeType" width:220];
     
   }else if (indexPath.row == 9){
       
       return [self getRowHeightByKey:@"loanLimitDesc" width:150];
       
   }
   else if (indexPath.row == 10){
       
       return [self getRowHeightByKey:@"loanLimitDesc" width:150];
       
   }
   else if (indexPath.row == 11){
       
       return [self getRowHeightByKey:@"repaymentType" width:220];
       
   }   else if (indexPath.row == 12){
       
       return [self getRowHeightByKey:@"reviewDate" width:220];
       
   }else if (indexPath.row == 13){
       
       return [self getRowHeightByKey:@"productDesc" width:220];
       
   }
   
   else  if (indexPath.row == 14){
        return 55;
        
    }
    
    else{
        return 38;
    }
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    //if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.font = [UIFont systemFontOfSize:13];
        cell.textLabel.textColor = [UIColor blackColor];
        cell.accessoryType = UITableViewCellAccessoryNone;

        
   // }
    
    if(indexPath.row == 0){
        cell.textLabel.text = @"银行名称：";

        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(90, 0.0, 220, 38)];
        lbl.text = [self getKeyValue:@"bankname"];
        lbl.font = [UIFont systemFontOfSize:13];
        lbl.textColor =UIColorFromRGB(0x0000FF);
        lbl.textAlignment = NSTextAlignmentLeft;
        lbl.lineBreakMode = NSLineBreakByWordWrapping;
        lbl.numberOfLines = 0;
        CGSize constrainedSize = CGSizeMake(220, 1000);
        CGSize msgSie = [lbl.text sizeWithFont:lbl.font constrainedToSize:constrainedSize lineBreakMode:NSLineBreakByWordWrapping];
        int height=38;
        if( msgSie.height>height){
            height=msgSie.height+2;
        }
        [lbl setFrame:CGRectMake(90, 0, 220, height)];
        
        lbl.userInteractionEnabled =true;
        
        
        
        UITapGestureRecognizer *tapGestureTel = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(contact)];
        [lbl addGestureRecognizer:tapGestureTel];
        [cell.contentView addSubview:lbl];
        
//        [lbl addTarget:self action:@selector(contact) forControlEvents:UIControlEventTouchUpInside];

        
        /*   UIButton  *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        CGRect frame = CGRectMake(250, 1, 65, 35);
        
        
       [button setFrame:frame];
        [button setTitle: @" 联系银行" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

        
        [button addTarget:self action:@selector(contact) forControlEvents:UIControlEventTouchUpInside];
    
        
        button.titleLabel.font = [UIFont boldSystemFontOfSize:12];
        button.titleLabel.textColor = [UIColor whiteColor];
        button.backgroundColor = UIColorFromRGB(0x2586d4);
        
        [cell.contentView addSubview:button];
        */
         
         
//        lbl = [[UILabel alloc] initWithFrame:CGRectMake(260, 1, 60, 35)];
//        lbl.font = [UIFont systemFontOfSize:11];
//        lbl.text = @"联系银行";
//        lbl.textColor = [UIColor whiteColor];
//        lbl.backgroundColor = [UIColor blueColor];
//        lbl.textAlignment = NSTextAlignmentCenter;
//        [lbl addTarget:self action:@selector(confirm) forControlEvents:UIControlEventTouchUpInside];

     //   [cell.contentView addSubview:lbl];

        
        
    }else if(indexPath.row == 1){
        cell.textLabel.text = @"产品名称：";
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(90, 0.0, 220, 38)];
        lbl.text = [self getKeyValue:@"productname"];

        lbl.font = [UIFont systemFontOfSize:13];
        lbl.textColor =UIColorFromRGB(0x6e6e6e);
        lbl.textAlignment = NSTextAlignmentLeft;
        lbl.lineBreakMode = NSLineBreakByWordWrapping;
        lbl.numberOfLines = 0;
        
        
        CGSize constrainedSize = CGSizeMake(220, 1000);
        CGSize msgSie = [lbl.text sizeWithFont:lbl.font constrainedToSize:constrainedSize lineBreakMode:NSLineBreakByWordWrapping];
        int height =  msgSie.height > 38 ?msgSie.height+15 :38;
        [lbl setFrame:CGRectMake(90, 0, 220, height)];


        [cell.contentView addSubview:lbl];

    }else if(indexPath.row == 2){
        cell.textLabel.text = @"业务实质：";
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(90, 0.0, 150, 38)];
        lbl.text = [self getKeyValue:@"isIndividual"];

        lbl.font = [UIFont systemFontOfSize:13];
        lbl.textColor =UIColorFromRGB(0x6e6e6e);
        lbl.textAlignment = NSTextAlignmentLeft;
        
        [cell.contentView addSubview:lbl];
        
    }else if(indexPath.row == 3){
        cell.textLabel.text = @"所属行业：";
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(90, 0.0, 220, 0)];
        lbl.font = [UIFont systemFontOfSize:13];
        lbl.text = [self getKeyValue:@"tradeType"];

        lbl.lineBreakMode = NSLineBreakByWordWrapping;
        lbl.numberOfLines = 0;
        
        lbl.font = [UIFont systemFontOfSize:13];
        lbl.textColor =UIColorFromRGB(0x6e6e6e);
        lbl.textAlignment = NSTextAlignmentLeft;
        
        
        CGSize constrainedSize = CGSizeMake(180, 1000);
        CGSize msgSie = [lbl.text sizeWithFont:lbl.font constrainedToSize:constrainedSize lineBreakMode:NSLineBreakByWordWrapping];
        
        int height =  msgSie.height > 38 ?msgSie.height+15 :38;

        
        [lbl setFrame:CGRectMake(90, 0, 220, height)];
        [cell.contentView addSubview:lbl];
        
    }else if(indexPath.row == 4){
        cell.textLabel.text = @"企业成立年限：";
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(120, 0.0, 150, 38)];
        lbl.text = [self getKeyValue:@"ageLimit"];

        lbl.font = [UIFont systemFontOfSize:13];
        lbl.textColor =UIColorFromRGB(0x6e6e6e);
        lbl.textAlignment = NSTextAlignmentLeft;
        
        [cell.contentView addSubview:lbl];
        
    }else if(indexPath.row == 5){
        cell.textLabel.text = @"企业注册地：";
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(90, 0.0, 150, 38)];
        lbl.text = [self getKeyValue:@"registerAddrType"];

        lbl.font = [UIFont systemFontOfSize:13];
        lbl.textColor =UIColorFromRGB(0x6e6e6e);
        lbl.textAlignment = NSTextAlignmentLeft;
        
        [cell.contentView addSubview:lbl];
        
    }else if(indexPath.row == 6 ){
        cell.textLabel.text = @"营业收入：";
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(90, 0.0, 255, 38)];
        lbl.text = [self getKeyValue:@"businessIncomeDesc"];

        lbl.font = [UIFont systemFontOfSize:13];
        lbl.textColor =UIColorFromRGB(0x6e6e6e);
        lbl.textAlignment = NSTextAlignmentLeft;
        lbl.lineBreakMode = NSLineBreakByWordWrapping;
        lbl.numberOfLines = 0;
        [cell.contentView addSubview:lbl];

        
        lbl = [[UILabel alloc] initWithFrame:CGRectMake(260, 0.0, 140, 38)];
        lbl.text = @"（万元）";
        lbl.font = [UIFont systemFontOfSize:13];
        lbl.textAlignment = NSTextAlignmentLeft;
        
        [cell.contentView addSubview:lbl];
        
    }else if(indexPath.row == 7 ){
        cell.textLabel.text = @"企业总资产：";
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(90, 0.0, 150, 38)];
        lbl.text = [self getKeyValue:@"totalAssetsDesc"];

        lbl.font = [UIFont systemFontOfSize:13];
        lbl.textColor =UIColorFromRGB(0x6e6e6e);
        lbl.textAlignment = NSTextAlignmentLeft;
        [cell.contentView addSubview:lbl];
        
        
        lbl = [[UILabel alloc] initWithFrame:CGRectMake(260, 0.0, 140, 38)];
        lbl.text = @"（万元）";
        lbl.font = [UIFont systemFontOfSize:13];
        lbl.textAlignment = NSTextAlignmentLeft;
        
        [cell.contentView addSubview:lbl];
        
    }else if(indexPath.row == 8 ){
        cell.textLabel.text = @"担保方式：";
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(90, 0.0, 150, 38)];
        lbl.text = [self getKeyValue:@"guaranteeType"];

        lbl.font = [UIFont systemFontOfSize:13];
        lbl.textColor =UIColorFromRGB(0x6e6e6e);
        lbl.textAlignment = NSTextAlignmentLeft;
        lbl.lineBreakMode = NSLineBreakByWordWrapping;
        lbl.numberOfLines = 0;
        [cell.contentView addSubview:lbl];
        
    }else if(indexPath.row == 9 ){
        cell.textLabel.text = @"额度：";
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(90, 0.0, 150, 38)];
        lbl.text = [self getKeyValue:@"loanAmountDesc"];

        lbl.font = [UIFont systemFontOfSize:13];
        lbl.textColor =UIColorFromRGB(0x6e6e6e);
        lbl.textAlignment = NSTextAlignmentLeft;
        lbl.lineBreakMode = NSLineBreakByWordWrapping;
        lbl.numberOfLines = 0;
        
        CGSize constrainedSize = CGSizeMake(150, 1000);
        CGSize msgSie = [lbl.text sizeWithFont:lbl.font constrainedToSize:constrainedSize lineBreakMode:NSLineBreakByWordWrapping];
        int height =  msgSie.height > 38 ?msgSie.height+15 :38;
        [lbl setFrame:CGRectMake(90, 0, 150, height)];
        
        [cell.contentView addSubview:lbl];
        
        
        lbl = [[UILabel alloc] initWithFrame:CGRectMake(260, 0.0, 140, 38)];
        lbl.text = @"（万元）";
        lbl.font = [UIFont systemFontOfSize:13];
        lbl.textAlignment = NSTextAlignmentLeft;
        
        [cell.contentView addSubview:lbl];
        
    }else if(indexPath.row == 10 ){
        cell.textLabel.text = @"贷款期限：";
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(90, 0.0, 150, 38)];
        lbl.text = [self getKeyValue:@"loanLimitDesc"];

        lbl.font = [UIFont systemFontOfSize:13];
        lbl.textColor =UIColorFromRGB(0x6e6e6e);
        lbl.textAlignment = NSTextAlignmentLeft;
        lbl.lineBreakMode = NSLineBreakByWordWrapping;
        lbl.numberOfLines = 0;
        CGSize constrainedSize = CGSizeMake(150, 1000);
        CGSize msgSie = [lbl.text sizeWithFont:lbl.font constrainedToSize:constrainedSize lineBreakMode:NSLineBreakByWordWrapping];
        int height =  msgSie.height > 38 ?msgSie.height+15 :38;
        [lbl setFrame:CGRectMake(90, 0, 150, height)];
        
        
        [cell.contentView addSubview:lbl];
        
        
        lbl = [[UILabel alloc] initWithFrame:CGRectMake(260, 0.0, 140, 38)];
        lbl.text = @"（月）";
        lbl.font = [UIFont systemFontOfSize:13];
        lbl.textAlignment = NSTextAlignmentLeft;
        
        [cell.contentView addSubview:lbl];
        
    }else if(indexPath.row == 11 ){
        cell.textLabel.text = @"还款方式：";
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(90, 0.0, 220, 38)];
        lbl.text = [self getKeyValue:@"repaymentType"];

        lbl.font = [UIFont systemFontOfSize:13];
        lbl.textColor =UIColorFromRGB(0x6e6e6e);
        lbl.textAlignment = NSTextAlignmentLeft;
        lbl.lineBreakMode = NSLineBreakByWordWrapping;
        lbl.numberOfLines = 0;
        CGSize constrainedSize = CGSizeMake(220, 1000);
        CGSize msgSie = [lbl.text sizeWithFont:lbl.font constrainedToSize:constrainedSize lineBreakMode:NSLineBreakByWordWrapping];
        int height =  msgSie.height > 38 ?msgSie.height+15 :38;
        [lbl setFrame:CGRectMake(90, 0, 220, height)];
        [cell.contentView addSubview:lbl];
        
    }else if(indexPath.row == 12 ){
        cell.textLabel.text = @"审批时间：";
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(90, 0.0, 150, 38)];
        lbl.text = [self getKeyValue:@"reviewDate"];

        lbl.font = [UIFont systemFontOfSize:13];
        lbl.textColor =UIColorFromRGB(0x6e6e6e);
        lbl.textAlignment = NSTextAlignmentLeft;
        
        lbl.lineBreakMode = NSLineBreakByWordWrapping;
        lbl.numberOfLines = 0;
        CGSize constrainedSize = CGSizeMake(220, 1000);
        CGSize msgSie = [lbl.text sizeWithFont:lbl.font constrainedToSize:constrainedSize lineBreakMode:NSLineBreakByWordWrapping];
        int height =  msgSie.height > 38 ?msgSie.height+15 :38;
        [lbl setFrame:CGRectMake(90, 0, 220, height)];
        [cell.contentView addSubview:lbl];
        
        
    }else if(indexPath.row == 13 ){
        cell.textLabel.text = @"产品特点：";
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(90, 0.0, 220, 38)];
        lbl.text = [self getKeyValue:@"productDesc"];

        lbl.font = [UIFont systemFontOfSize:13];
        lbl.textColor =UIColorFromRGB(0x6e6e6e);
        lbl.textAlignment = NSTextAlignmentLeft;
        
        
        lbl.lineBreakMode = NSLineBreakByWordWrapping;
        lbl.numberOfLines = 0;
        CGSize constrainedSize = CGSizeMake(220, 1000);
        CGSize msgSie = [lbl.text sizeWithFont:lbl.font constrainedToSize:constrainedSize lineBreakMode:NSLineBreakByWordWrapping];
        int height =  msgSie.height > 38 ?msgSie.height+15 :38;
        [lbl setFrame:CGRectMake(90, 0, 220, height)];
        [cell.contentView addSubview:lbl];
        
    }else if (indexPath.row ==14){
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"footer"];
        UIButton *button =  [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button setTitle: @"联系银行" forState:UIControlStateNormal];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [button addTarget:self action:@selector(contact) forControlEvents:UIControlEventTouchUpInside];
        
        
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

    
    
    
    return cell;
}



-(void)favorite{
    
    
    
    NSString *uid =  [[NSUserDefaults standardUserDefaults] objectForKey:LOGIN];
    
    if (uid == nil){
        
        UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"登录提示"    //标题
                                                       message:@"该功能需要登录后使用，您目前还没有登录。"   //显示内容
                                                      delegate:self          //委托，可以点击事件进行处理
                                             cancelButtonTitle:@"取消"
                                             otherButtonTitles:@"登录"
                             //,@"其他",    //添加其他按钮
                             ,nil];
        [view show];
        return;
    }
    
    
    //收藏产品
    @try{
        
        NSMutableString  *url =  [[NSMutableString alloc] initWithString:SERVER_URL];
        [url appendString: [NSString  stringWithFormat: @"collect/add/%@/%@",uid,self.productID]];
        
        NSError *error;
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
        NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        NSDictionary *raw = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves  error:&error];
        NSString *code = [raw objectForKey:@"code"];
        if(![code isEqualToString:@"101"]){
            UIAlertView * alert =
            [[UIAlertView alloc]
             initWithTitle:@"错误"
             message: [[NSString alloc] initWithFormat:@"收藏失败:%@",code]
             delegate:self
             cancelButtonTitle:nil
             otherButtonTitles:@"确定", nil];
            [alert show];
            return;
            
        }
        
    }@catch (NSException *e){
        NSLog(@"Exception: %@", e);
        UIAlertView * alert =
        [[UIAlertView alloc]
         initWithTitle:@"错误"
         message: [[NSString alloc] initWithFormat:@"系统错误"]
         delegate:self
         cancelButtonTitle:nil
         otherButtonTitles:@"确定", nil];
        [alert show];
        return ;
    }
    
    UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"收藏成功！"    //标题
                                                  message:Nil   //显示内容
                                                 delegate:nil          //委托，可以点击事件进行处理
                                        cancelButtonTitle:nil
                                        otherButtonTitles:@"确定"
                         //,@"其他",    //添加其他按钮
                         ,nil];
    [view show];
    
    //收藏按钮变为取消收藏
    UIButton *favoButton = [UIButton buttonWithType:101];
    
    [favoButton addTarget:self action:@selector(cancelFavorite) forControlEvents:UIControlEventTouchUpInside];
    [favoButton setTitle:@"取消收藏" forState:UIControlStateNormal];
    
    UIBarButtonItem *favaItem = [[UIBarButtonItem alloc] initWithCustomView:favoButton];
    
    
    favaItem.tintColor = [UIColor whiteColor];
    [favaItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                      [UIColor whiteColor],NSForegroundColorAttributeName,
                                      [UIFont boldSystemFontOfSize:19], NSFontAttributeName, nil] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem =  favaItem;

    
}





-(void)cancelFavorite{
    //取消收藏产品
    @try{
        
        NSString *uid =  [[NSUserDefaults standardUserDefaults] objectForKey:LOGIN];
        if (uid == nil){
            
            UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"登录提示"    //标题
                                                           message:@"该功能需要登录后使用，您目前还没有登录。"   //显示内容
                                                          delegate:self          //委托，可以点击事件进行处理
                                                 cancelButtonTitle:@"取消"
                                                 otherButtonTitles:@"登录"
                                 //,@"其他",    //添加其他按钮
                                 ,nil];
            [view show];
            return;
        }

        NSMutableString  *url =  [[NSMutableString alloc] initWithString:SERVER_URL];
        [url appendString: [NSString  stringWithFormat: @"collect/cancel/%@/%@",uid,self.productID]];
        
        NSError *error;
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
        NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        NSDictionary *raw = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves  error:&error];
        NSString *code = [raw objectForKey:@"code"];
        if(![code isEqualToString:@"101"]){
            UIAlertView * alert =
            [[UIAlertView alloc]
             initWithTitle:@"错误"
             message: [[NSString alloc] initWithFormat:@"操作失败:%@",code]
             delegate:self
             cancelButtonTitle:nil
             otherButtonTitles:@"确定", nil];
            [alert show];
            return;
            
        }
        
    }@catch (NSException *e){
        NSLog(@"Exception: %@", e);
        UIAlertView * alert =
        [[UIAlertView alloc]
         initWithTitle:@"错误"
         message: [[NSString alloc] initWithFormat:@"系统错误"]
         delegate:self
         cancelButtonTitle:nil
         otherButtonTitles:@"确定", nil];
        [alert show];
        return ;
    }
    
    UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"取消成功！"    //标题
                                                   message:Nil   //显示内容
                                                  delegate:nil          //委托，可以点击事件进行处理
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"确定"
                         //,@"其他",    //添加其他按钮
                         ,nil];
    [view show];
    
    //收藏按钮变为取消收藏
    UIButton *favoButton = [UIButton buttonWithType:101];
    
    [favoButton addTarget:self action:@selector(favorite) forControlEvents:UIControlEventTouchUpInside];
    [favoButton setTitle:@"收藏" forState:UIControlStateNormal];
    
    UIBarButtonItem *favaItem = [[UIBarButtonItem alloc] initWithCustomView:favoButton];
    
    
    favaItem.tintColor = [UIColor whiteColor];
    [favaItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                      [UIColor whiteColor],NSForegroundColorAttributeName,
                                      [UIFont boldSystemFontOfSize:19], NSFontAttributeName, nil] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem =  favaItem;
    
    
}

- (void)contact
{
 /*  XWContactBankViewController  *controller = [[ XWContactBankViewController alloc] initWithNibName:@"XWContactBankViewController" bundle:nil];
   // controller.results = result;
    controller.title = @"资金需求为1万、贷款期限为2月、 本地注册资金为100万、担保方式为";
  
    [self.navigationController pushViewController:controller  animated:YES];*/
    
    
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:nil
                                  delegate:self
                                  cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:nil
                                  otherButtonTitles:@"我要留言", @"产品链接或联系人热线",@"网点信息",nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    [actionSheet showInView:self.view];
    
}

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

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];

    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
 
 */


#pragma mark - 自定义函数

-  (NSString*) getKeyValue : (NSString*) key{
    if(self.productDetail == nil){
        return @"";
    }
    
    NSString *value = [self.productDetail objectForKey:key];
  //判断集合/数组字典对象是否为空
    if ((NSNull *)value == [NSNull null]) {

        return @"";
    }else{
        return value;
    }
}


-  (BOOL) isFavorit {
    if(self.productDetail == nil){
        return false;
    }
    BOOL value = [[self.productDetail objectForKey:@"isCollected" ] boolValue];
   
    return value;
}

-  (int) getRowHeightByKey: (NSString*) key width:(NSInteger) width{
    
    
    NSString *str  = [self getKeyValue:key];
    
    CGSize constrainedSize = CGSizeMake(220, 1000);
    
    
    CGSize msgSie = [str sizeWithFont:[UIFont systemFontOfSize:13] constrainedToSize:constrainedSize lineBreakMode:NSLineBreakByWordWrapping];
    int height =  msgSie.height+15;
    return height > 38 ?height :38;
}




-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
  
    if( buttonIndex == 1 ){
        XWLoginController *viewController = [[XWLoginController alloc] init] ;
        [self.navigationController pushViewController:viewController animated:YES];    }
    
}


-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //我要留言
    if (buttonIndex == 0) {
        
        XWContactBankViewController  *controller = [[ XWContactBankViewController alloc] initWithNibName:@"XWContactBankViewController" bundle:nil];
        // controller.results = result;
        
        NSMutableDictionary *info = [[NSMutableDictionary alloc] init];
        
        
        [info setObject:[self getKeyValue:@"bankname"] forKey:@"reciever"];
        [info setObject:self.productID  forKey:@"productID"];
        
        controller.info  = info;
        [self.navigationController pushViewController:controller  animated:YES];
        
    }
    //产品链接或联系人热线
    else if(buttonIndex == 1){
        @try{
            
            NSMutableString  *url =  [[NSMutableString alloc] initWithString:SERVER_URL];
            [url appendString: [NSString stringWithFormat: @"message/hotline/%@",self.productID]];
            
            NSError *error;
            NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLCacheStorageAllowed timeoutInterval:3];
            
            NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
            NSDictionary *raw = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves  error:&error];
            NSString *code = [raw objectForKey:@"code"];
            if(![code isEqualToString:@"101"]){
                UIAlertView * alert =
                [[UIAlertView alloc]
                 initWithTitle:@"错误"
                 message: [[NSString alloc] initWithFormat:@"数据加载失败:%@",code]
                 delegate:self
                 cancelButtonTitle:nil
                 otherButtonTitles:@"确定", nil];
                [alert show];
                return;
                
            }
            NSString *message = [raw objectForKey:@"message"];
//            UIAlertView * alert =
//            [[UIAlertView alloc]
//             initWithTitle:nil
//             message: message
//             delegate:self
//             cancelButtonTitle:nil
//             otherButtonTitles:@"确定", nil];
//           [alert addTextFieldWithValue:@"增加field" label:@"增加value"];
//            UITextView *utl = [[UITextView alloc] initWithFrame:CGRectMake(25, 30, 100, 200)];
//            utl.text = message;
//            [alert addSubview:utl];
        
            
         
            
            
            DXAlertView *alert = [[DXAlertView alloc] initWithTitle:nil contentText:nil leftButtonTitle:nil rightButtonTitle:@"确定"];
            [alert setRootViewController:self];
            //网址
            UITextView *utl = [[UITextView alloc] initWithFrame:CGRectMake(20, 20, 180, 80)];
            utl.text = message;
//            utl.text = @"联系电话：95599";
            utl.backgroundColor = [UIColor clearColor];
            utl.editable = NO;
            utl.dataDetectorTypes = UIDataDetectorTypeAll;
            utl.font = [UIFont systemFontOfSize:14];
            utl.textAlignment = NSTextAlignmentCenter;
            
            
            [alert addSubview:utl];
            [alert show];
            
            alert.rightBlock = ^() {
                NSLog(@"left button clicked");
            };
            
            alert.dismissBlock = ^() {
            };

           
            
            return;
            
            
        }@catch (NSException *e){
            NSLog(@"Exception: %@", e);
            UIAlertView * alert =
            [[UIAlertView alloc]
             initWithTitle:@"错误"
             message: [[NSString alloc] initWithFormat:@"数据加载失败"]
             delegate:self
             cancelButtonTitle:nil
             otherButtonTitles:@"确定", nil];
            [alert show];
            return  ;
        }
    }
    
    //网点信息
    else if(buttonIndex == 2){

        NSMutableString  *url =  [[NSMutableString alloc] initWithString:SERVER_URL];
        [url appendString: [NSString  stringWithFormat: @"message/branchnetwork/%@",self.productID]];
      //  [url appendString: [NSString  stringWithFormat: @"/message/branchnetwork/%@",@"6"]];
        
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
        
        
        UIActivityIndicatorView *activityIndicator;
        activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)];
        CGPoint center  = CGPointMake(self.view.center.x, self.view.center.y-50);
        [activityIndicator setCenter:center];
        [activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
        [self.view addSubview:activityIndicator];
        
        [activityIndicator startAnimating];
        
        
        @try {
            [NSURLConnection sendAsynchronousRequest:request
                                               queue:[NSOperationQueue mainQueue]
                                   completionHandler:^(NSURLResponse *response,  NSData *data, NSError *error) {
                                       if (error != nil) {
                                           NSLog(@"Error on load = %@", [error localizedDescription]);
                                           UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"通讯错误"
                                                                                           message:nil
                                                                                          delegate:nil
                                                                                 cancelButtonTitle:@"确定"
                                                                                 otherButtonTitles:nil, nil];
                                           [alert show];
                                           return;
                                       }else {
                                           [activityIndicator stopAnimating];
                                           // check the HTTP status
                                           if ([response isKindOfClass:[NSHTTPURLResponse class]]) {                    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                                               if (httpResponse.statusCode != 200) {
                                                   return;                    }
                                               NSLog(@"Headers: %@", [httpResponse allHeaderFields]);
                                               NSDictionary  *rawresult = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves  error:&error];
                                               
                                               NSArray *queryproducts = [rawresult objectForKey:@"message"];
                                               NSString *code = [rawresult objectForKey:@"code"];
                                               NSLog(@"查询结果 %@", rawresult );
                                               
                                               
                                               if(![code isEqualToString:@"101"]){
                                                   UIAlertView * alert =
                                                   [[UIAlertView alloc]
                                                    initWithTitle:@"错误"
                                                    message: [[NSString alloc] initWithFormat:@"查询失败:%@",code]
                                                    delegate:nil
                                                    cancelButtonTitle:nil
                                                    otherButtonTitles:@"确定", nil];
                                                   [alert show];
                                                   return;
                                                   
                                               }else if([code isEqualToString:@"101"]){
                                                   NSMutableArray *result = [[NSMutableArray alloc] init];
                                                   
                                                   NSMutableDictionary *item ;
                                                   
                                                   for(int i=0;i<[queryproducts count];i++){
                                                       item = [[NSMutableDictionary alloc] initWithDictionary:queryproducts[i]];
                                                       
                                                       [result addObject:item];
                                                       
                                                   }
                                                   XWBankListTableViewController *viewController = [[XWBankListTableViewController alloc] init] ;
                                                   viewController.results = result;
                                                   [self.navigationController pushViewController:viewController animated:YES];
                                               }//end 101
                                           }
                                       }
                                   }
             ];
            
            
            
            
        }@catch (NSException *exception) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"对不起，服务故障，请稍后再试"
                                                            message:nil
                                                           delegate:self
                                                  cancelButtonTitle:@"确定"
                                                  otherButtonTitles:nil, nil];
            [activityIndicator stopAnimating];
            
            [alert show];
            return;
        }
        @finally {
            
        }

    
    
    
    }
    
}
- (void)actionSheetCancel:(UIActionSheet *)actionSheet{
    
}
-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex{
    
}
-(void)actionSheet:(UIActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex{
    
}  


@end
