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
    
    if (![self.database isOpen]) {
        BOOL result = [self.database open];
        NSLog(@"数据库打开 %@",result == YES ? @"成功" : @"失败");
    }
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingString:@"/sm.db"];
    self.database = [FMDatabase databaseWithPath:path];
    
    [self.database open];
    BOOL create = [self.database executeUpdate:@"CREATE TABLE IF NOT EXISTS CARS(ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT, COLOR TEXT)"];
    if (create == YES) {
        NSLog(@"创建数据库成功！");
    }else {
        NSLog(@"创建数据库失败");
    }
    [self.database close];
    
    [self.database open];
    BOOL insert = [self.database executeUpdate:@"INSERT INTO CARS(ID, NAME, COLOR) VALUES(2, 'ROBO', 'colorful')"];
    NSLog(@"数据库插入 %@", insert == YES ? @"成功" : @"失败");
    [self.database close];
    
    [self.database open];
    FMResultSet *resultSet = [self.database executeQuery:@"SELECT * FROM CARS where ID = 1"];
    while ([resultSet next]) {
        NSLog(@"%@",[resultSet stringForColumn:@"NAME"]);
    }

    [self.database close];
    
    [self.database open];
    BOOL update = [self.database executeUpdate:@"UPDATE CARS SET NAME = 'Bee' WHERE ID = 0"];
    NSLog(@"数据库更新 %@", update == YES ? @"成功" : @"失败");
    [self.database close];
    
//    [self.database open];
//    BOOL delete = [self.database executeUpdate:@"DELETE FROM CARS WHERE ID = 0"];
//    NSLog(@"数据库删除 %@", delete == YES ? @"成功" : @"失败");
//    [self.database close];
    
    
}





@end
