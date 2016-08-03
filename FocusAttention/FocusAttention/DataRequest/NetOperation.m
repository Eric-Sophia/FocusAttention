//
//  NetOperation.m
//  FocusAttention
//
//  Created by 庄志豪 on 16/8/3.
//  Copyright © 2016年 EricAndPhliny. All rights reserved.
//

#import "NetOperation.h"

@implementation NetOperation

+(void)getRequestWithUrl:(NSString *)URLString parameters:(id)parameters success:(success)success failure:(failure)failure{
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kBaseURL]];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    [manager GET:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",manager);
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
