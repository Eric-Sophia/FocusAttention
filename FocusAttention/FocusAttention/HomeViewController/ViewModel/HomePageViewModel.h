//
//  HomePageViewModel.h
//  FocusAttention
//
//  Created by 庄志豪 on 16/8/3.
//  Copyright © 2016年 EricAndPhliny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StoryViewModel.h"

@interface HomePageViewModel : NSObject

@property (strong,nonatomic)NSMutableArray *storyArray;  //正文的数据源
@property (strong,nonatomic)NSMutableArray *topStoryArray;  //广告栏的数据源

/**装着每组sectionViewModel的数组*/
@property (strong,nonatomic)NSMutableArray *sectionVMArray;//表示结合视图有多少组，在内部装着有n个sectionViewModel。

@property (copy,nonatomic)NSString *dateStr;


/**返回有多少组*/
- (NSUInteger)numberOfSections;

/**返回每组有多少个*/
- (NSUInteger)numberOfRowsInSection:(NSUInteger)section;

/**返回每组的组视图*/
- (NSAttributedString *)titleForSection:(NSInteger)section;
/***/
- (StoryViewModel *)cellViewModelAtIndexPath:(NSIndexPath *)indexPath;

/**获取今天的数据*/
-(void)getTodayData;

/**获取今天之前的数据*/
-(void)getBeforeData;
@end
