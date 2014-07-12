//
//  XWSingleSelectionTableViewController.m
//  XiaoWei
//
//  Created by 张玮 on 14-5-27.
//  Copyright (c) 2014年 Tonknet. All rights reserved.
//

#import "XWSingleSelectionTableViewController.h"
#import "XWSearchProductConditonViewController.h"

@interface XWSingleSelectionTableViewController ()

@end

@implementation XWSingleSelectionTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //self.navigationItem.title = @"贷款主体";
    
    
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
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.menuItems.count ;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell;//= [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    @try{
        NSDictionary *s = [self.menuItems objectAtIndex:indexPath.row];
        cell.textLabel.text = [s objectForKey:@"Value"];
        cell.restorationIdentifier = [s objectForKey:@"Value"];
        cell.textLabel.textColor =UIColorFromRGB(0x686868);
        cell.textLabel.font = [UIFont systemFontOfSize:15];
    }@catch (NSException *exception) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"对不起，服务故障，请稍后再试"
                                                        message:nil
                                                       delegate:self
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil, nil];
        
        [alert show];
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        return cell;
    }
    @finally {
        
    }
    
    return cell;
}






- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    for( int  i=0;i< [tableView numberOfRowsInSection:0];i++){
        if( indexPath.row != i ){
            NSIndexPath *trow = [NSIndexPath indexPathForRow:i inSection:0];
            UITableViewCell *scell = [tableView cellForRowAtIndexPath:trow];
            scell.accessoryType = UITableViewCellAccessoryNone;
        }
    }
    UITableViewCell *scell = [tableView cellForRowAtIndexPath:indexPath];
    scell.accessoryType = UITableViewCellAccessoryCheckmark;
}


- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    UITableViewCell *scell = [tableView cellForRowAtIndexPath:indexPath];
    scell.accessoryType = UITableViewCellAccessoryNone;
    
    
}


- (void)confirm
{
    NSMutableArray *options = [[NSMutableArray alloc] init];

        NSInteger rows = [self.tableView numberOfRowsInSection:0];
        for(int j=0;j<rows;j++){
            NSIndexPath *path = [NSIndexPath indexPathForRow:j inSection:0];
            UITableViewCell *cell =  [self.tableView cellForRowAtIndexPath:path];
            if(cell.accessoryType == UITableViewCellAccessoryCheckmark){
                NSMutableDictionary *op = [NSMutableDictionary dictionaryWithObject:cell.textLabel.text forKey:@"Value"];
                [op setObject:cell.restorationIdentifier forKey:@"Key"];
                [options addObject:op];
            }
            
        
        
    }
//    XWSearchProductConditonViewController *searchctl  = [self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count-2];
//    //searchctl.mainbodyOptions = options;
    [self.target removeAllObjects];
    [self.target  addObjectsFromArray:options];
    [self.navigationController popViewControllerAnimated:YES];
    //UITableViewCell *scell = [tableView cellForRowAtIndexPath:indexPath];
    
    
    //    UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"Title" message:@"123" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //    [alter show];
}



@end
