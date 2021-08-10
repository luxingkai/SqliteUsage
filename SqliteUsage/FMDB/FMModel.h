//
//  FMModel.h
//  SqliteUsage
//
//  Created by tigerfly on 2020/11/12.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FMModel : NSObject
@property (nonatomic, strong) NSString *p_id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *age;

+ (instancetype)modelWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
