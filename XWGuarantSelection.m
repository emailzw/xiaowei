//
//  XWGuarantSelection.m
//  XiaoWei
//
//  Created by 张玮 on 14-4-29.
//  Copyright (c) 2014年 Tonknet. All rights reserved.
//

#import "XWGuarantSelection.h"

@implementation XWGuarantSelection


- (id)initWithType:(NSString *)guarantType {
    self.guarantType = guarantType;
    self.options = [[NSMutableArray alloc] init];
    return self;
}


- (void)addOptions:(NSDictionary *)option {
    [self.options  addObject:option];
}

@end
