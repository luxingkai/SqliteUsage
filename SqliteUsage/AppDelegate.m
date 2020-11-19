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
    
    /**/
//    FMDatabase
//    FMResultSet
//    FMDatabaseQueue
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingString:@"/color.db"];
    FMDatabase *database = [FMDatabase databaseWithPath:path];
    NSLog(@"数据库对象创建 %@", database ? @"成功" : @"失败");
    
    [database open];
    BOOL create =  [database executeUpdate:@"CREATE TABLE IF NOT EXISTS CAR(ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, NAME TEXT, COLOR TEXT NOT NULL)"];
    NSLog(@"创建表 %@",create ? @"成功" : @"失败");
    
    BOOL insert = [database executeUpdate:@"INSERT INTO CAR(ID, NAME, COLOR) VALUES(0, 'sdfa', 'yellow')"];
    NSLog(@"数据插入 %@",insert ? @"成功" : @"失败");
    
    FMResultSet *result = [database executeQuery:@"SELECT NAME FROM CAR WHERE ID = 0"];
    NSLog(@"数据查询 %@",result ? @"成功" : @"失败");
    
    BOOL update = [database executeUpdate:@"UPDATE CAR SET NAME = 'ollll' WHERE ID = 0"];
    NSLog(@"数据修改 %@",update ? @"成功" : @"失败");

    BOOL delete = [database executeStatements:@"DELETE FROM CAR WHERE ID = 0"];
    NSLog(@"数据删除 %@",delete ? @"成功" : @"失败");

    [database close];
    
    
}





@end
