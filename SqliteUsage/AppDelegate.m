//
//  AppDelegate.m
//  SqliteUsage
//
//  Created by tiger fly on 2020/3/19.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "AppDelegate.h"
#import "Sqlite3.h"
#import "FMDB.h"
#import "Realm.h"
#import "CoreData.h"
#import <FMDB/FMDB.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    FMDB *vc = [FMDB new];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
    
    //项目初始化过程创建数据库
    [self createDB];
    
    return YES;
}

- (void)createDB {
    
//    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *path = NSTemporaryDirectory();
    NSLog(@"%@",path);
        
    FMDatabase *database = [FMDatabase databaseWithPath:[path stringByAppendingString:@"/my.sqlite"]];
    if (database) {
        NSLog(@"创建数据库文件成功");
    }else {
        NSLog(@"创建数据库文件失败");
    }
    
    //创建表
    if (![database isOpen]) {
        [database open];
    }
    BOOL createTable = [database executeUpdate:@"CREATE TABLE IF NOT EXISTS PEOPLE(id Integer primary key autoincrement, name text, age Integer)"];
    if (createTable == NO) {
        NSLog(@"创建表失败");
    }
    [database close];
    
    //查询表
    [database open];
    FMResultSet *resultSet = [database executeQuery:@"SELECT * FROM PEOPLE"];
    while ([resultSet next]) {
        int ids = [resultSet intForColumn:@"id"];
        NSString *name = [resultSet stringForColumn:@"name"];
        NSLog(@"%d %@",ids,name);
    }
    [database close];
    
    //插入数据
    [database open];
    BOOL insertResult = [database executeUpdate:@"insert into PEOPLE(id, name, age) values(1,'jone', 15)"];
    if (insertResult == NO) {
        NSLog(@"插入失败");
    }
    [database close];
    
    //修改数据
    [database open];
    BOOL updateResult = [database executeUpdate:@"update PEOPLE set name = 'kenel' where id = 1"];
    if (updateResult == NO) {
        NSLog(@"修改失败");
    }
    [database close];
    
    //删除数据
    [database open];
    BOOL deleteResult = [database executeUpdate:@"delete FROM PEOPLE where id = 1"];
    if (deleteResult == NO) {
        NSLog(@"删除数据");
    }
    [database close];
    
}





@end
