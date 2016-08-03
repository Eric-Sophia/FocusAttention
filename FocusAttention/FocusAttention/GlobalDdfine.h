//
//  GlobalDdfine.h
//  FocusAttention
//
//  Created by 庄志豪 on 16/8/3.
//  Copyright © 2016年 EricAndPhliny. All rights reserved.
//

#ifndef GlobalDdfine_h
#define GlobalDdfine_h

//1.这是每个接口都有的前缀
#define kBaseURL @"http://news-at.zhihu.com/api/4"
//2.屏幕宏
#define kkScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kkScreenHeight [UIScreen mainScreen].bounds.size.height
#define kkScreenBounds [UIScreen mainScreen].bounds
//3.自定义高效率的 NSLog
//#ifdef DEBUG
//#define KKLog(...) NSLog(@"%s 第%d行 \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
//#else
//#define KKLog(...)
//
//#endif
#define KKLog(a) NSLog(@"%@",a)


#endif /* GlobalDdfine_h */
