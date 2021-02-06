//
//  NetworkHandler.m
//  SqliteUsage
//
//  Created by tigerfly on 2020/11/20.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "NetworkHandler.h"

@implementation NetworkHandler

+ (void)POSTWithURLPath:(NSString *)path param:(NSDictionary *)param success:(Success)success failure:(Failure)failure {
    if (path == nil || [path isEqualToString:@""]) {return;}
    NSString *URL = [NSString stringWithFormat:@"%@/%@",DOMAIN_NAME,path];
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    AFHTTPRequestSerializer *requestSerializer = [AFHTTPRequestSerializer serializer];
    [requestSerializer setValue:@"audio/*; q=0.2, audio/basic" forHTTPHeaderField:@"Accept"];
    AFHTTPResponseSerializer *responseSerializer = [AFHTTPResponseSerializer serializer];
    sessionManager.requestSerializer = requestSerializer;
    sessionManager.responseSerializer = responseSerializer;
    [sessionManager POST:URL parameters:param headers:NULL progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
    
}


@end
