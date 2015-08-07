//
//  YJMSQLiteNamedParameter.m
//  Demo
//
//  Created by yajamon on 2015/08/07.
//  Copyright (c) 2015年 yajamon. All rights reserved.
//

#import "YJMSQLiteNamedParameter.h"

@implementation YJMSQLiteNamedParameter

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.value = nil;
        self.target = @"";
        self.dataType = YJMSQLiteDataTypeNull;
    }
    return self;
}



@end
