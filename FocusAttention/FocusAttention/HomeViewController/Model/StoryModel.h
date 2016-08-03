//
//  StoryModel.h
//  FocusAttention
//
//  Created by 庄志豪 on 16/8/3.
//  Copyright © 2016年 EricAndPhliny. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StoryModel : NSObject

@property (copy,nonatomic)NSString *type;
@property (copy,nonatomic)NSString *id;
@property (copy,nonatomic)NSString *ga_prefix;
@property (copy,nonatomic)NSString *title;
@property (strong,nonatomic)NSMutableArray *images;



-(instancetype)initWithDictionary:(NSDictionary *)dic;
@end
