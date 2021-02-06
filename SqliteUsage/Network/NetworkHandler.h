//
//  NetworkHandler.h
//  SqliteUsage
//
//  Created by tigerfly on 2020/11/20.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

#ifndef DOMAIN_NAME
#define DOMAIN_NAME @"http://app.faxingwu.com"
#endif

NS_ASSUME_NONNULL_BEGIN
typedef void(^Success)(id response);
typedef void(^Failure)(NSError *error);
@interface NetworkHandler : NSObject

+ (void)POSTWithURLPath:(nonnull NSString *)path param:(nullable NSDictionary *)param success:(Success)success failure:(Failure)failure;

@end

NS_ASSUME_NONNULL_END
