//
//  AppDelegate.m
//  SqliteUsage
//
//  Created by tiger fly on 2020/3/19.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "AppDelegate.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    FMDB *vc = [FMDB new];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    //项目初始化过程创建数据库
    [self createDB];
    
    return YES;
}

- (void)createDB {
    
//    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *path = NSTemporaryDirectory();
    NSLog(@"%@",path);
        
    self.database = [FMDatabase databaseWithPath:[path stringByAppendingString:@"/my.sqlite"]];
    if (self.database) {
        NSLog(@"创建数据库文件成功");
    }else {
        NSLog(@"创建数据库文件失败");
    }
    
    //创建表
    [self.database open];
    BOOL createTable = [self.database executeUpdate:@"CREATE TABLE IF NOT EXISTS PEOPLE(id Integer primary key autoincrement, name text, age Integer)"];
    if (createTable == NO) {
        NSLog(@"创建表失败");
    }
    [self.database close];
    
//    //查询表
//    [self.database open];
//    FMResultSet *resultSet = [self.database executeQuery:@"SELECT * FROM PEOPLE"];
//    while ([resultSet next]) {
//        int ids = [resultSet intForColumn:@"id"];
//        NSString *name = [resultSet stringForColumn:@"name"];
//        NSLog(@"%d %@",ids,name);
//    }
//    [self.database close];
//

    [self.database open];
    BOOL insertTable = [self.database executeStatements:@"INSERT INTO PEOPLE VALUES(6, 'anne', 88)"];
    if (insertTable == YES) {
        NSLog(@"数据插入成功");
    }else {
        NSLog(@"数据插入失败");
    }
    [self.database close];
    
    
    
//
//    //修改数据
//    [self.database open];
//    BOOL updateResult = [self.database executeUpdate:@"update PEOPLE set name = 'kenel' where id = 1"];
//    if (updateResult == NO) {
//        NSLog(@"修改失败");
//    }
//    [self.database close];
//
//    //删除数据
//    [self.database open];
//    BOOL deleteResult = [self.database executeUpdate:@"delete FROM PEOPLE where id = 1"];
//    if (deleteResult == NO) {
//        NSLog(@"删除数据");
//    }
//    [self.database close];
    
   
    
    
    
}





@end
