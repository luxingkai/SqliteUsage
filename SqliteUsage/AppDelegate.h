//
//  AppDelegate.h
//  SqliteUsage
//
//  Created by tiger fly on 2020/3/19.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Sqlite3.h"
#import "FMDB.h"
#import "Realm.h"
#import "CoreData.h"
#import <FMDB/FMDB.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow *window;
@property (nonnull, strong, nonatomic) FMDatabase *database;

@end

