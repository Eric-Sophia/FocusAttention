//
//  HomePageViewController.m
//  FocusAttention
//
//  Created by 庄志豪 on 16/8/3.
//  Copyright © 2016年 EricAndPhliny. All rights reserved.
//

#import "HomePageViewController.h"   // 主页的控制器

@interface HomePageViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (strong,nonatomic)UICollectionView *mainCollectionView;//集合视图
@property (strong,nonatomic)HomePageViewModel *homePageViewModel; //主页集合视图的ViewModel;


@end

@implementation HomePageViewController


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.homePageViewModel = [HomePageViewModel new];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initSubViews];
    [self.homePageViewModel getTodayData];
    

}

-(void)initSubViews{
    
    //用于控制collectionView的布局对象
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
    //设置滚动方向为竖直滚动
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    _mainCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kkScreenWidth,kkScreenHeight) collectionViewLayout:flowLayout];
    _mainCollectionView.delegate = self;
    _mainCollectionView.dataSource = self;
    _mainCollectionView.backgroundColor = [UIColor whiteColor];
    
    
    //XIB编写的cell注册
    [_mainCollectionView registerNib:[UINib nibWithNibName:@"HomePageCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"HomePageCollectionViewCell"];
    
    [self.view addSubview:_mainCollectionView];

    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return [self.homePageViewModel numberOfRowsInSection:section];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return [self.homePageViewModel numberOfSections];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *itemID = @"HomePageCollectionViewCell";
    HomePageCollectionViewCell *item = [collectionView dequeueReusableCellWithReuseIdentifier:itemID forIndexPath:indexPath];
    
    StoryViewModel *storyViewModel = [_homePageViewModel cellViewModelAtIndexPath:indexPath];
    
    item.story = storyViewModel.story;
    
    return item;
}

//每一个Cell的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    return CGSizeMake(140, 200);
}

//每组的cell的边界:距离屏幕边框的距离
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(20, 10, 20, 10);
}


@end
