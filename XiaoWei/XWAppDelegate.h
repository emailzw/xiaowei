//
//  XWAppDelegate.h
//  XiaoWei
//
//  Created by 张玮 on 14-4-24.
//  Copyright (c) 2014年 Tonknet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainPage.h"


@class MenuViewController;

@interface XWAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) MainPage *viewController;



@end
