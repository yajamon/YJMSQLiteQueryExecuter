//
//  YJMSQLiteQueryExecuter.h
//  Demo
//
//  Created by yajamon on 2015/08/06.
//  Copyright (c) 2015年 yajamon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface YJMSQLiteQueryExecuter : NSObject

@property (nonatomic) sqlite3 *database;

-(NSArray *)query:(NSString *)sql;

+(NSDictionary *)makeNamedParam:(id)value target:(NSString *)target type:(NSInteger)type;

@end
