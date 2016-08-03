//
//  NetOperation.h
//  FocusAttention
//
//  Created by 庄志豪 on 16/8/3.
//  Copyright © 2016年 EricAndPhliny. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetOperation : NSObject

typedef void (^success)(id responseObject);
typedef void (^failure)(NSError *error);

+ (void)getRequestWithUrl:(NSString *)URLString parameters:(id)parameters success:(success)success failure:(failure)failure;

@end
