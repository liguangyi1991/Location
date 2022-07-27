//
//  FMDBManager.m
//  TestMap
//
//  Created by 段坤明 on 2022/7/27.
//

#import "FMDBManager.h"
#import <FMDB/FMDB.h>
static FMDBManager * _instance;
@interface FMDBManager()
{
    FMDatabase *_db;
}
@end
@implementation FMDBManager

+ (instancetype)shareInstance{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _instance = [[FMDBManager alloc]init];
        
    });
    return _instance;
}

///初始化
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initDataBase];
    }
    return self;
}

///初始化数据库
- (void)initDataBase{
    
    ///library 路径
    NSString *libPath = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0];
    ///数据库路径
    NSString *dbPath = [libPath stringByAppendingString:@"/user.db"];
    
    ///创建数据库
    _db = [FMDatabase databaseWithPath:dbPath];
    
    ///打开数据库
    BOOL isOpen = [_db open];
    
    if (!isOpen) {
        NSLog(@"数据库打开失败");
    } else {
        
        ///创建学生表
        NSString *sql = @"CREATE TABLE IF NOT EXISTS Location (id INTEGER PRIMARY KEY AUTOINCREMENT,lat Text,lng text, time text)";
        BOOL result = [_db executeUpdate:sql];
        if (result) {
            NSLog(@"创建数据库成功 %@",dbPath);
        }
        [_db close];
    }
}




@end
