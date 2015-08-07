//
//  YJMSQLiteNamedParameter.h
//  Demo
//
//  Created by yajamon on 2015/08/07.
//  Copyright (c) 2015年 yajamon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

typedef NS_ENUM(NSInteger, YJMSQLiteDataType){
    YJMSQLiteDataTypeInteger = SQLITE_INTEGER,
    YJMSQLiteDataTypeFloat   = SQLITE_FLOAT,
    YJMSQLiteDataTypeText    = SQLITE_TEXT,
    YJMSQLiteDataTypeBlob    = SQLITE_BLOB,
    YJMSQLiteDataTypeNull    = SQLITE_NULL
};

@interface YJMSQLiteNamedParameter : NSObject

@property (nonatomic) id value;
@property (nonatomic) NSString *target;
@property (nonatomic) YJMSQLiteDataType dataType;

@end
