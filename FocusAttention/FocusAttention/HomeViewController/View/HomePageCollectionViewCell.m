//
//  HomePageCollectionViewCell.m
//  FocusAttention
//
//  Created by 庄志豪 on 16/8/3.
//  Copyright © 2016年 EricAndPhliny. All rights reserved.
//

#import "HomePageCollectionViewCell.h"

//主页集合视图自定义的cell；

@implementation HomePageCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    
    
}

-(void)setStory:(StoryModel *)story{
    
    _story = story;
    
//    self.imageView =
    self.label.text = story.title;
}

@end
