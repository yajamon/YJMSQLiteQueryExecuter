# YJMSQLiteQueryExecuter
Run the sql to sqlite3

## Description

* supports named parameters

## Requirement

* libsqlite3.dylib

## Usage

### initialize

**important**

```objc
sqlite3 *sqlax;
NSString *filePath = @"your/sqlite/file/path";
sqlite3_open([filePath UTF8String], &sqlax);

YJMSQLiteQueryExecuter *exec = [[YJMSQLiteQueryExecuter alloc]init];
exec.database = sqlax;
```

### run query

```objc
NSString *createSql = @"CREATE TABLE IF NOT EXISTS names (name TEXT)";
[exec query:createSql];
```

### run query with named parameter

```objc
NSString *insertSql = @"INSERT INTO names(name) VALUES(:name)";
NSString *name = [NSString stringWithFormat:@"%@%d",@"name_",arc4random() % 99];

NSMutableArray *params = [@[] mutableCopy];
[params addObject:[YJMSQLiteNamedParameter namedParameterWithValue:name target:@":name" type:YJMSQLiteDataTypeText]];

[exec query:insertSql withNamedParams:[params copy ]];
```

### get results of select query

```objc
NSString *selectSql = @"SELECT * FROM names";
NSArray  *records = [exec query:selectSql];

[records enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    NSDictionary *record = obj;
    NSLog(@"%@",record[@"name"]);
}];
```

## Install

* Manual
    * Copy `YJMSQLiteNamedParameter.h/m` to your project.
    * Copy `YJMSQLiteQueryExecuter.h/m` to your project.

## Contribution

## License

[MIT](https://github.com/yajamon/YJMSQLiteQueryExecuter/blob/master/LICENSE)

## Author

[yajamon](https://github.com/yajamon)