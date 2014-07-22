//
//  XWMyMessageController.h
//  XiaoWei
//
//  Created by 张玮 on 14-5-14.
//  Copyright (c) 2014年 Tonknet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XWMessageListItem.h"

@interface XWMyMessageController : UITableViewController
@property (nonatomic, retain) NSArray *results;
//@property (strong,nonatomic,retain)   UINavigationController  *navigationController;

- (UIImage*)imageWithImage:(UIImage*)image
              scaledToSize:(CGSize)newSize;
@end
