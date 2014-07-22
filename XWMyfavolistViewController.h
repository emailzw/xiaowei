//
//  XWMyfavolistViewController.h
//  XiaoWei
//
//  Created by 张玮 on 14-5-28.
//  Copyright (c) 2014年 Tonknet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XWMyfavolistViewController : UITableViewController 
@property (nonatomic, retain) NSArray *results;
- (UIImage*)imageWithImage:(UIImage*)image
              scaledToSize:(CGSize)newSize;
@end
