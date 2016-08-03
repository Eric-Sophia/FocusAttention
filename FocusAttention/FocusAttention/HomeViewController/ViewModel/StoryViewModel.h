//
//  StoryViewModel.h
//  FocusAttention
//
//  Created by 庄志豪 on 16/8/3.
//  Copyright © 2016年 EricAndPhliny. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StoryViewModel : NSObject

@property (strong,nonatomic)StoryModel *story;

-(instancetype)initWithDictionary:(NSDictionary *)dic;

@end
