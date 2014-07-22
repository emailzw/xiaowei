//
//  XWGuarantSelectViewController.m
//  XiaoWei
//
//  Created by 张玮 on 14-4-29.
//  Copyright (c) 2014年 Tonknet. All rights reserved.
//

#import "XWGuarantSelection.h"
#import "XWGuarantSelectViewController.h"
#import "XWSearchProductConditonViewController.h"
#import "XWSearchResultItem.h"

@interface XWGuarantSelectViewController ()
- (NSArray *)createMenuItems;
@end

@implementation XWGuarantSelectViewController


#pragma mark - Memory Management

- (id)init {
	self = [super init];
	
	if (self) {
		[self setMenuItems:[self createMenuItems]];
	}
	
	return self;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    [self setMenuItems:[self createMenuItems]];
    [self setSelection:[[NSDictionary alloc] init]];
    return self;

}


- (NSArray *)createMenuItems {
	NSMutableArray *items = [[NSMutableArray alloc] init];
	
    
    

    
  //  NSMutableArray *items = [[NSMutableArray alloc] init];
    
    @try{
        
        NSMutableString  *url =  [[NSMutableString alloc] initWithString:SERVER_URL];
        [url appendString:@"wayOfGuaranty"];
        
        NSError *error;
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
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
             otherButtonTitles:@"OK", nil];
            [alert show];
            return nil;
            
        }
        NSArray *options = [raw objectForKey:@"message"];
        NSLog(@"%@: options%@", @"wayOfGuaranty",options );
        
        
        for ( int i=0; i<[options count] ;i++){
            
            NSDictionary *dict = [options objectAtIndex:i];
            XWGuarantSelection *section = [[XWGuarantSelection alloc] initWithType:[dict objectForKey:@"type"]];
            NSArray *list = [dict objectForKey:@"list"];
            for(int j=0;j<[list count];j++){
                NSDictionary *subDict = [list objectAtIndex:j];
                [section addOptions:[NSDictionary  dictionaryWithObjectsAndKeys:[subDict objectForKey:@"value"] ,@"Value",[subDict objectForKey:@"key"],@"Key" ,nil]];

            }
            [items addObject:section];
        }
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
        return  nil;
    }

    
    
    
    /*
    XWGuarantSelection *section = [[XWGuarantSelection alloc] initWithType:@"抵押"];
    [section addOptions:[NSDictionary  dictionaryWithObjectsAndKeys:@"商业房产",@"Value",@"dy-01",@"Key" ,nil]];
    [section addOptions:[NSDictionary  dictionaryWithObjectsAndKeys:@"厂房",@"Value",@"dy-02",@"Key" ,nil]];
    [section addOptions:[NSDictionary  dictionaryWithObjectsAndKeys:@"机器设备",@"Value",@"dy-03",@"Key" ,nil]];
    [section addOptions:[NSDictionary  dictionaryWithObjectsAndKeys:@"其他",@"Value",@"dy-04",@"Key" ,nil]];
    [items addObject:section];
    section = [[XWGuarantSelection alloc] initWithType:@"质押"];
    [section addOptions:[NSDictionary  dictionaryWithObjectsAndKeys:@"存单",@"Value",@"zy-01",@"Key" ,nil]];
    [section addOptions:[NSDictionary  dictionaryWithObjectsAndKeys:@"仓库",@"Value",@"zy-02",@"Key" ,nil]];
    [section addOptions:[NSDictionary  dictionaryWithObjectsAndKeys:@"保单",@"Value",@"zy-03",@"Key" ,nil]];
    [section addOptions:[NSDictionary  dictionaryWithObjectsAndKeys:@"应收账款",@"Value",@"zy-03",@"Key" ,nil]];
    [section addOptions:[NSDictionary  dictionaryWithObjectsAndKeys:@"知识产权",@"Value",@"zy-03",@"Key" ,nil]];
    [section addOptions:[NSDictionary  dictionaryWithObjectsAndKeys:@"其他",@"Value",@"zy-03",@"Key" ,nil]];
    [items addObject:section];
    section = [[XWGuarantSelection alloc] initWithType:@"担保"];
    [section addOptions:[NSDictionary  dictionaryWithObjectsAndKeys:@"个人连带",@"Value",@"zy-01",@"Key" ,nil]];
    [section addOptions:[NSDictionary  dictionaryWithObjectsAndKeys:@"企业担保",@"Value",@"zy-02",@"Key" ,nil]];
    [section addOptions:[NSDictionary  dictionaryWithObjectsAndKeys:@"担保公司担保",@"Value",@"zy-03",@"Key" ,nil]];
    [section addOptions:[NSDictionary  dictionaryWithObjectsAndKeys:@"无需担保",@"Value",@"zy-03",@"Key" ,nil]];
    [section addOptions:[NSDictionary  dictionaryWithObjectsAndKeys:@"其他",@"Value",@"zy-03",@"Key" ,nil]];
    
    
    [items addObject:section];
    */
    
    return items;
}



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
    
    self.navigationItem.title = @"担保方式";


    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
//    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
//      backItem.title = @"确定";
//  
    
    UIButton *backButton = [UIButton buttonWithType:101];
    //    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveDifficulty:)];

    [backButton addTarget:self action:@selector(confirm) forControlEvents:UIControlEventTouchUpInside];
    [backButton setTitle:@"确定" forState:UIControlStateNormal];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];

    
    backItem.tintColor = [UIColor whiteColor];
        [backItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                          [UIColor whiteColor],NSForegroundColorAttributeName,
                                          [UIFont boldSystemFontOfSize:19], NSFontAttributeName, nil] forState:UIControlStateNormal];
        self.navigationItem.leftBarButtonItem =  backItem;
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return self.menuItems.count ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    XWGuarantSelection *s = [self.menuItems objectAtIndex:section];
    return s.options.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

    }
    XWGuarantSelection *xs = [self.menuItems objectAtIndex:indexPath.section];
    cell.textLabel.text = [[xs.options objectAtIndex:indexPath.row] objectForKey:@"Value"];
    cell.restorationIdentifier = [[xs.options objectAtIndex:indexPath.row] objectForKey:@"Key"];
    cell.textLabel.textColor =UIColorFromRGB(0x686868);
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 38;
}
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    return 0;
//}




-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* customView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 38.0)];
    customView.backgroundColor =  UIColorFromRGB(0xf4f4f4);
    UILabel * headerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    headerLabel.backgroundColor = [UIColor clearColor];
    headerLabel.opaque = NO;
    headerLabel.textColor = [UIColor blackColor];
    headerLabel.highlightedTextColor = [UIColor whiteColor];
    headerLabel.font = [UIFont boldSystemFontOfSize:15];
    headerLabel.frame = CGRectMake(10.0, 4.0, 100.0, 30.0);
    XWGuarantSelection *sec =[self.menuItems objectAtIndex:section];
    headerLabel.text =  sec.guarantType;
    [customView addSubview:headerLabel];
    
    
    UILabel * headerLabelright = [[UILabel alloc] initWithFrame:CGRectZero];
    headerLabelright.backgroundColor = [UIColor clearColor];
    headerLabelright.opaque = NO;
    headerLabelright.textColor = UIColorFromRGB(0x50aeff);
    headerLabelright.font = [UIFont systemFontOfSize:15];
    headerLabelright.frame = CGRectMake(220.0, 4.0, 80.0, 30.0);
    headerLabelright.text = @"可多项选择";
     [customView addSubview:headerLabelright];
    
    return customView;
}


- (void)confirm
{
    NSMutableArray *options = [[NSMutableArray alloc] init];
   NSInteger sections =  [self.tableView numberOfSections];
    for (int i=0; i<sections; i++){
        NSInteger rows = [self.tableView numberOfRowsInSection:i];
        for(int j=0;j<rows;j++){
            NSIndexPath *path = [NSIndexPath indexPathForRow:j inSection:i];
            UITableViewCell *cell =  [self.tableView cellForRowAtIndexPath:path];
            if(cell.accessoryType == UITableViewCellAccessoryCheckmark){
                NSMutableDictionary *op = [NSMutableDictionary dictionaryWithObject:cell.textLabel.text forKey:@"Value"];
                [op setObject:cell.restorationIdentifier forKey:@"Key"];
                [options addObject:op];
            }
            
        }
        
    }
     XWSearchProductConditonViewController *searchctl  = [self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count-2];
     searchctl.guarantOptions = options;
    [self.navigationController popViewControllerAnimated:YES];
//UITableViewCell *scell = [tableView cellForRowAtIndexPath:indexPath];

    
//    UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"Title" message:@"123" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
//    
//    [alter show];
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


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *scell = [tableView cellForRowAtIndexPath:indexPath];
    
    scell.accessoryType = UITableViewCellAccessoryCheckmark;
}


- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    UITableViewCell *scell = [tableView cellForRowAtIndexPath:indexPath];
    scell.accessoryType = UITableViewCellAccessoryNone;
    
    
}



@end
