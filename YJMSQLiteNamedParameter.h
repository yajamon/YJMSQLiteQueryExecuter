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

/**
 * valid instancetype NSString|NSNumber|NSData|NSNull
 */
@property (nonatomic) id value;

/**
 * bind target name. example format ":name"
 */
@property (nonatomic) NSString *target;

/**
 * bind data type
 * @see YJMSQLiteDataType
 */
@property (nonatomic) YJMSQLiteDataType dataType;

/**
 * create named paramater class
 * @param value 値
 * @param target bind target
 * @param dataType SQLite datatype_code
 * @return instancetype インスタンスを返却する
 */
+(instancetype)namedParameterWithValue:(id)value target:(NSString *)target dataType:(YJMSQLiteDataType)dataType;

@end
