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
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingString:@"/asd.db"];
    FMDatabase *database = [FMDatabase databaseWithPath:path];
    [database open];
    
    BOOL create = [database executeUpdate:@"CREATE TABLE IF NOT EXISTS KILL(ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, NAME TEXT NOT NULL, CAR TEXT NOT NULL)"];
    NSLog(@"创建表 %@",create == YES ? @"成功" : @"失败");
    
    BOOL insert = [database executeUpdate:@"INSERT INTO KILL(ID, NAME, CAR) VALUES(0, 'sd', 'beach')"];
    NSLog(@"插入数据 %@",insert == YES ? @"成功" : @"失败");
    
    BOOL select = [database executeQuery:@"SELECT NAME FROM KILL WHERE ID = 0 or CAR "];
    NSLog(@"查询数据 %@",select == YES ? @"成功" : @"失败");

    BOOL update = [database executeUpdate:@"UPDATE KILL SET NAME = 'showmaker' WHERE ID = 0"];
    NSLog(@"更新数据 %@",update == YES ? @"成功" : @"失败");

    BOOL delete = [database executeUpdate:@"DELETE FROM KILL WHERE ID = 0"];
    NSLog(@"更新数据 %@",delete == YES ? @"成功" : @"失败");

    [database close];
}





@end
