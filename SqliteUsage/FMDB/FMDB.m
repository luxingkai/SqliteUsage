//
//  FMDB.m
//  SqliteUsage
//
//  Created by tigerfly on 2020/11/11.
//  Copyright © 2020 tiger fly. All rights reserved.
//

/**
 1.数据库文件存在在哪        项目沙盒目录 (NSDocumentDirectory() /my.db)
 2.何时创建数据库文件        项目初始化时
 3.如何设计表
 4.获取的网络数据如何存在到数据库
 5.存放在数据库中的数据如何获取到内存中并展示
 */

#import "FMDB.h"
#import "FMModel.h"
#import "AppDelegate.h"

@interface FMDB ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>

@end

@implementation FMDB {
    
    FMDatabase *_database;
    NSMutableArray *_listArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _listArray = [NSMutableArray array];
    
    self.tableView.delegate = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
    searchBar.delegate = self;
    self.navigationItem.titleView = searchBar;
    
    [self fetchData];
}

- (void)fetchData {

    
}


#pragma mark -- UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    return cell;
}

#pragma mark -- UISearchBarDelegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"%@",searchBar.text);
    
    
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
