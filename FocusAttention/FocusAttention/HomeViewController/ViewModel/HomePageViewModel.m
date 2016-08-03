//
//  HomePageViewModel.m
//  FocusAttention
//
//  Created by 庄志豪 on 16/8/3.
//  Copyright © 2016年 EricAndPhliny. All rights reserved.
//

#import "HomePageViewModel.h"
@interface SectionViewModel : NSObject

@property(strong,readonly,nonatomic)NSString *titleText;
@property(strong,readonly,nonatomic)NSArray *sectionArray;//.count代表有一天有多少个新闻。


- (instancetype)initWithDictionary:(NSDictionary *)dic;

@end

@implementation SectionViewModel

- (instancetype)initWithDictionary:(NSDictionary *)dic {
    self = [super init];
    if (self) {
//        _titleText = [self stringConvertToSectionTitleText:dic[@"date"]];//这个是主页上面的每组的组头，显示日期的。
        NSArray *stories = dic[@"stories"];  //存储数据里面的数组
        
        NSMutableArray *arr = [NSMutableArray new];
        for (NSDictionary *storyDic in stories) {
            
//            遍历数组里面的每个数据，也就是集合视图里面的每组的每条新闻。
            StoryViewModel *storyViewModel = [[StoryViewModel alloc] initWithDictionary:storyDic];
            [arr addObject:storyViewModel];
        }
        _sectionArray = arr;
    }
    return self;
}

//- (NSString*)stringConvertToSectionTitleText:(NSString*)str { // 这个方法是返回表格视图分组的显示日期的字符串
//    
//    NSDateFormatter *formatter = [NSDateFormatter sharedInstance];
//    [formatter setDateFormat:@"yyyyMMdd"];
//    NSDate *date = [formatter dateFromString:str];
//    formatter.locale = [NSLocale localeWithLocaleIdentifier:@"zh-CH"];
//    [formatter setDateFormat:@"MM月dd日 EEEE"];
//    NSString *sectionTitleText = [formatter stringFromDate:date];
//    
//    return sectionTitleText;
//}

@end

@implementation HomePageViewModel


- (instancetype)init
{
    self = [super init];
    if (self) {
        _storyArray = [[NSMutableArray alloc]init];
        _topStoryArray = [[NSMutableArray alloc]init];
        
        _sectionVMArray = [NSMutableArray array];
    }
    return self;
}

/**返回有多少组*/
- (NSUInteger)numberOfSections{
    return self.sectionVMArray.count;
    
}

/**返回每组有多少个*/
- (NSUInteger)numberOfRowsInSection:(NSUInteger)section{
    SectionViewModel *sectionViewModel = self.sectionVMArray[section];
    return sectionViewModel.sectionArray.count;
}

/**返回每组的组视图*/
//- (NSAttributedString *)titleForSection:(NSInteger)section;

- (StoryViewModel *)cellViewModelAtIndexPath:(NSIndexPath *)indexPath{
    SectionViewModel *sectionViewModel = _sectionVMArray[indexPath.section];
    StoryViewModel *storyViewModel = sectionViewModel.sectionArray[indexPath.row];
    return storyViewModel;
}


#pragma mark - 获取今天的数据；
-(void)getTodayData{
    
    [NetOperation getRequestWithUrl:@"stories/latest" parameters:nil success:^(id responseObject) {
        //
        NSDictionary *jsonDic = (NSDictionary*)responseObject;
        
        _dateStr = [jsonDic objectForKey:@"date"];//获取每天的这个值，在获取上一天的数据时需要用到。
        
//        sectionViewModel 里面有一个数组，数组里面装着每天新闻的内容，sectionViewModel.sectionArray.count代表有一天有多少个新闻。
        SectionViewModel *sectionViewModel = [[SectionViewModel  alloc]initWithDictionary:jsonDic];
        
//        if(_sectionVMArray.count == 0){ //表示这是第一次请求
//            NSMutableArray *arr = [NSMutableArray arrayWithObject:sectionViewModel];//把“今天”的数据加进来
//            [self setValue:arr forKey:@"sectionVMArray"];//使用系统的方法，把新获取的装有数据模型的数组赋给sectionVMArray
//        }
        
        NSMutableArray *arr = [NSMutableArray arrayWithObject:sectionViewModel];//把“今天”的数据加进来
        [self setValue:arr forKey:@"sectionVMArray"];
        
        NSLog(@"%@",_sectionVMArray);
        
        
        
        
        
        NSArray *topArray = jsonDic[@"top_stories"];
        [topArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSDictionary *topDict = obj;
            TopStoryModel *topStoryModel = [TopStoryModel yy_modelWithDictionary:topDict];
            [_topStoryArray addObject:topStoryModel];
        }];
        
        
        
    } failure:nil];
    
}

#pragma mark - 获取今天之前的数据
-(void)getBeforeData{
    
    [NetOperation getRequestWithUrl:[NSString stringWithFormat:@"stories/before/%@",self.dateStr] parameters:nil success:^(id responseObject) {
        
        NSDictionary *jsonDic = (NSDictionary*)responseObject;
        self.dateStr = responseObject[@"date"];
        
        //一个sectionViewModel 代表一天，也就是一组。
        SectionViewModel *sectionViewModel = [[SectionViewModel alloc]initWithDictionary:jsonDic];
        
        [_sectionVMArray addObject:sectionViewModel];
        
        
    } failure:^(NSError *error) {

    }];
    
    
}
@end
