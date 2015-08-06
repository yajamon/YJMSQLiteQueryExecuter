//
//  YJMSQLiteQueryExecuter.m
//  Demo
//
//  Created by yajamon on 2015/08/06.
//  Copyright (c) 2015年 yajamon. All rights reserved.
//

#import "YJMSQLiteQueryExecuter.h"

@interface YJMSQLiteQueryExecuter ()

@property (nonatomic) sqlite3_stmt *stmt;

@end

@implementation YJMSQLiteQueryExecuter

#pragma mark - public methods

-(void)query:(NSString *)sql {
    self.stmt = [self prepare:sql];
}

+(NSDictionary *)makeNamedParam:(id)value target:(NSString *)target type:(NSInteger)type {
    NSMutableDictionary *param = [@{} mutableCopy];
    param[@"value"] = value;
    param[@"target"] = target;
    param[@"type"] = @(type);
    
    return [param copy];
}

#pragma mark - private methods

-(sqlite3_stmt *)prepare:(NSString *)sql {
    sqlite3_stmt *stmt=nil;
    
    if (sqlite3_prepare_v2(self.database, [sql UTF8String], -1, &stmt, NULL) != SQLITE_OK) {
        NSAssert1(0, @"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(self.database));
    }
    return stmt;
}

-(id)getValueInColumnAtIndex:(NSInteger)index {
    NSInteger type = sqlite3_column_type(self.stmt, (int)index);
    
    if (type == SQLITE_INTEGER){
        NSInteger value = sqlite3_column_int64(self.stmt, (int)index);
        return @(value);
    }
    if (type == SQLITE_FLOAT){
        double value = sqlite3_column_double(self.stmt, (int)index);
        return @(value);
    }
    if (type == SQLITE_TEXT){
        NSString *value = [NSString stringWithUTF8String:(char *)sqlite3_column_text(self.stmt, (int)index)];
        return value;
    }
    if (type == SQLITE_BLOB){
        NSInteger length = sqlite3_column_bytes(self.stmt, (int)index);
        NSData *value = [[NSData alloc] initWithBytes:sqlite3_column_blob(self.stmt, (int)index) length:length];
        return value;
    }
    if (type == SQLITE_NULL){
        return nil;
    }
    return nil;
}

@end
