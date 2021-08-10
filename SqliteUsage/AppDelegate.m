//
//  AppDelegate.m
//  SqliteUsage
//
//  Created by tiger fly on 2020/3/19.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "AppDelegate.h"
#import "CollectionViewController.h"

@interface AppDelegate ()
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    CGFloat itemWidth = ([UIScreen mainScreen].bounds.size.width - 60) / 3;
    CGFloat itemHeight = 260;
    
//    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//    layout.itemSize = CGSizeMake(itemWidth, itemHeight);
//    layout.minimumLineSpacing = 15;
//    layout.minimumInteritemSpacing = 15;
//    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
//    CollectionViewController *vc = [[CollectionViewController alloc] initWithCollectionViewLayout:layout];
    
    Sqlite3 *vc = [Sqlite3 new];
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
    
    NSString *path= [NSTemporaryDirectory() stringByAppendingString:@"my.db"];
    FMDatabase *db = [FMDatabase databaseWithPath:path];
    NSLog(@"创建数据库 %@", db ? @"成功" : @"失败");
    
    [db open];
    
    BOOL create = [db executeStatements:@"CREATE TABLE IF NOT EXISTS PEOPLE(ID INTEGER PRIMARY KEY NOT NULL, NAME TEXT NOT NULL)"];
    NSLog(@"创建表 %@", create ? @"成功" : @"失败");

    BOOL insert = [db executeStatements:@"INSERT INTO PEOPLE(ID, NAME) VALUES(0, 'fasd')"];
    NSLog(@"插入表 %@", insert ? @"成功" : @"失败");

    BOOL update = [db executeStatements:@"UPDATE PEOPLE SET NAME = 'bane' WHERE ID = 0"];
    NSLog(@"更新表 %@", update ? @"成功" : @"失败");

    FMResultSet *resultSet = [db executeQuery:@"SELECT NAME FROM PEOPLE WHERE ID > 1 AND NAME LIKE 'Sd_' LIMIT 5"];
    NSLog(@"查询表 %@", resultSet != nil ? @"成功" : @"失败");
    
    BOOL delete = [db executeStatements:@"DELETE FROM PEOPLE WHERE ID = 0"];
    NSLog(@"删除 %@", delete ? @"成功" : @"失败");

    BOOL drop = [db executeStatements:@"DROP TABLE PEOPLE"];
    
    [db close];
    
}





@end
