//
//  HomePageCollectionViewCell.h
//  FocusAttention
//
//  Created by 庄志豪 on 16/8/3.
//  Copyright © 2016年 EricAndPhliny. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StoryModel.h"

@interface HomePageCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *label;



@property (strong,nonatomic)StoryModel *story;

@end
