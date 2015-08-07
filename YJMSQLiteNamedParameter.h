//
//  YJMSQLiteNamedParameter.h
//  Demo
//
//  Created by yajamon on 2015/08/07.
//  Copyright (c) 2015年 yajamon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface YJMSQLiteNamedParameter : NSObject

@property (nonatomic) id value;
@property (nonatomic) NSString *target;
@property (nonatomic) NSInteger dataType;

@end
