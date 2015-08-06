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

#pragma mark - private method

-(void)query:(NSString *)sql {
    self.stmt = [self prepare:sql];
}

#pragma mark - private methods

-(sqlite3_stmt *)prepare:(NSString *)sql {
    sqlite3_stmt *stmt=nil;
    
    if (sqlite3_prepare_v2(self.database, [sql UTF8String], -1, &stmt, NULL) != SQLITE_OK) {
        NSAssert1(0, @"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(self.database));
    }
    return stmt;
}

@end
