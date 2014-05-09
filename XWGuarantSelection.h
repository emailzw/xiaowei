//
//  XWGuarantSelection.h
//  XiaoWei
//
//  Created by 张玮 on 14-4-29.
//  Copyright (c) 2014年 Tonknet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XWGuarantSelection : NSObject
@property (nonatomic, retain) NSString *guarantType;
@property (nonatomic, retain) NSMutableArray *options;

- (id)initWithType:(NSString *)guarantType ;
- (void)addOptions:(NSDictionary *)option ;

@end
