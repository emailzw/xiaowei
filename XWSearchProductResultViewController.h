//
//  XWSearchProductResultViewController.h
//  XiaoWei
//
//  Created by 张玮 on 14-5-4.
//  Copyright (c) 2014年 Tonknet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XWSearchProductResultViewController : UITableViewController
@property (nonatomic, retain) NSArray *results;
- (UIImage*)imageWithImage:(UIImage*)image
              scaledToSize:(CGSize)newSize;

@end


/*
struct XWProductDetail {
    NSString *bankName;
    NSString *ProdcutName;
    NSString *bizDesc; //业务实质
    NSString *loanBody; //贷款主体
    float establishYear; //成立年限
    NSString *registerAddress; //注册地
    float income; //营业收入
    float asset; //总资产

    NSString *ProdcutName;
    NSString *ProdcutName;

    
};
typedef struct XWProductDetail XWProductDetail;
*/