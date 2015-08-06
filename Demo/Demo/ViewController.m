//
//  ViewController.m
//  Demo
//
//  Created by yajamon on 2015/08/06.
//  Copyright (c) 2015年 yajamon. All rights reserved.
//

#import "ViewController.h"
#import <sqlite3.h>
#import "YJMSQLiteQueryExecuter.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 参考:http://otiai10.hatenablog.com/entry/2014/01/10/004015
    
    // とりあえず、使用する物理ファイル名を決めちゃう
    NSString *dataFileName = @"test.sqlite3";
    NSString *dataFileFullPath;
    
    // 1.【物理ファイルを準備します】
    
    dataFileFullPath = [self makeDataFilePath:dataFileName];
    [self setupSqliteFile:dataFileFullPath];
    
    // 2.【sqiteを開く】
    
    // FIXME: この書き方だとメモリリークする？
    sqlite3 *sqlax;
    // 開きます
    BOOL isSuccessfullyOpened = sqlite3_open([dataFileFullPath UTF8String], &sqlax);
    if (isSuccessfullyOpened != SQLITE_OK) {
        NSLog(@"sqlite開けませんでした！=> %s", sqlite3_errmsg(sqlax));
    }
    
#pragma mark 使い方ここから
    // 3. Executer生成
    YJMSQLiteQueryExecuter *exec = [[YJMSQLiteQueryExecuter alloc]init];
    
    // 4. database持たせる
    exec.database = sqlax;
    
    // 5. queryを実行する
    NSString *createSql = @"CREATE TABLE IF NOT EXISTS names (name TEXT)";
    [exec query:createSql];
    
    // 6. 名前付きパラメータありでqueryを実行する
    NSString *insertSql = @"INSERT INTO names(name) VALUES(:name)";
    NSString *name = [NSString stringWithFormat:@"%@%d",@"name_",arc4random() % 99];
    
    NSMutableArray *params = [@[] mutableCopy];
    [params addObject:[YJMSQLiteQueryExecuter makeNamedParam:name target:@":name" type:SQLITE_TEXT]];
    
    [exec query:insertSql withNamedParams:params];
    
    // 7. SELECTの結果は返り値から得る
    NSString *selectSql = @"SELECT * FROM names";
    NSArray  *records = [exec query:selectSql];
    
    [records enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSDictionary *record = obj;
        NSLog(@"%@",record[@"name"]);
    }];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSString *)makeDataFilePath:(NSString *)fileName {
    NSString *dataFileFullPath;
    // 使用可能なファイルパスを全て取得する
    NSArray *availablePats = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    // 最初のものを使用する
    NSString *dir = [availablePats objectAtIndex:0];
    dataFileFullPath = [dir stringByAppendingPathComponent:fileName];
    
    return dataFileFullPath;
}

- (void)setupSqliteFile:(NSString *)filePath {
    
    // ファイルマネージャを召還する
    NSFileManager *myFM = [NSFileManager defaultManager];
    // 物理ファイルって既にありますか？
    BOOL fileExists = [myFM fileExistsAtPath:filePath];
    // 無い場合はつくる
    if (! fileExists) {
        BOOL isSuccessfullyCreated = [myFM createFileAtPath:filePath contents:nil attributes:nil];
        if (! isSuccessfullyCreated) {
            NSLog(@"新規ファイル作成に失敗しました=>%@", filePath);
        }
    }
}

@end
