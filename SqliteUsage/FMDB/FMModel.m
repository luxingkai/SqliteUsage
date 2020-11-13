//
//  FMModel.m
//  SqliteUsage
//
//  Created by tigerfly on 2020/11/12.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "FMModel.h"

@implementation FMModel

+ (instancetype)modelWithDictionary:(NSDictionary *)dictionary {
    return [[FMModel alloc] initWithDictionary:dictionary];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        
    }
    return self;
}

@end
