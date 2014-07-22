//
//  XWSearchResultItem.h
//  XiaoWei
//
//  Created by 张玮 on 14-5-4.
//  Copyright (c) 2014年 Tonknet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XWMessageListItem : NSObject
@property (nonatomic, retain) NSString *messageTitle;
@property (nonatomic, retain) NSString *status;//已读取，未读取
@property (nonatomic) NSInteger newCount;
@property (nonatomic, retain) NSString *postDate;
@property (nonatomic, retain) NSString *mid;
@property (nonatomic, retain) NSString *productID;

@end
