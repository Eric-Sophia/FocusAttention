//
//  StoryViewModel.m
//  FocusAttention
//
//  Created by 庄志豪 on 16/8/3.
//  Copyright © 2016年 EricAndPhliny. All rights reserved.
//

#import "StoryViewModel.h"

@interface StoryViewModel ()



@end

@implementation StoryViewModel

-(instancetype)initWithDictionary:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        _story = [StoryModel yy_modelWithDictionary:dic];
    }
    
    return self;
}

@end
