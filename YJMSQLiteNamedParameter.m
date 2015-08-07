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
    return [self initWithValue:nil target:@"" dataType:YJMSQLiteDataTypeNull];
}

- (instancetype)initWithValue:(id)value target:(NSString *)target dataType:(YJMSQLiteDataType)dataType
{
    self = [super init];
    if (self) {
        self.value = value;
        self.target = target;
        self.dataType = dataType;

    }
    return self;
}



@end
