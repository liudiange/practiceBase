//
//  ViewController.m
//  卡片collectionview实现
//
//  Created by apple on 2018/7/9.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ViewController.h"
#import "DGImageViewCell.h"
#import "DGCardViewLayout.h"
#import "DGCardCommonModel.h"
#import "DGCardCollectionView.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,DGCardCellDelegate,DGCardCollectionViewDelegate>

@property (strong, nonatomic) NSMutableArray *deleteArray;
@property (strong, nonatomic) DGCardCollectionView *collectionView;
@property (strong, nonatomic) DGCardViewLayout *cardLayout;
@property (strong, nonatomic) NSMutableArray *dataArray;

@end
@implementation ViewController

static NSString *const cell_id = @"cellID";

-(NSMutableArray *)deleteArray {
    if (!_deleteArray) {
        _deleteArray = [[NSMutableArray alloc] init];
    }
    return _deleteArray;
}
-(NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    for (NSInteger index = 0; index < 10; index ++) {
        DGCardCommonModel *cardCommonModel = [[DGCardCommonModel alloc] init];
        cardCommonModel.name = [NSString stringWithFormat:@"%zd",index];
        cardCommonModel.currentIndex = index;
        [self.dataArray addObject:cardCommonModel];
    }
    
    DGCardViewLayout *cardLayout = [[DGCardViewLayout alloc] init];
    cardLayout.cardCount = 3;
    cardLayout.verticalMargon = 10;
    cardLayout.horizontalMargon = 20;
    cardLayout.beginIndex = 0;
    
    DGCardCollectionView *collectionView = [[DGCardCollectionView alloc] initWithFrame:CGRectMake(10, 100, [UIScreen mainScreen].bounds.size.width - 20, [UIScreen mainScreen].bounds.size.width - 20) collectionViewLayout: cardLayout];
    collectionView.cardDelegate = self;
    collectionView.dataSource = self;
    collectionView.backgroundColor = [UIColor greenColor];
    [collectionView registerNib:[UINib nibWithNibName:@"DGImageViewCell" bundle:nil] forCellWithReuseIdentifier:cell_id];
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
    self.cardLayout = cardLayout;
    
}
#pragma mark - collectionview的datasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArray.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    DGImageViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell_id forIndexPath:indexPath];
    cell.collectionView = self.collectionView;
    cell.commonModel = self.dataArray[indexPath.item];
    return cell;
}
#pragma mark collectionView 的 delegate
/**
 需要刷新collectionview
 
 @param index index
 @param cardCollectionView collection
 @param needDeleteArray 需要删除的数组
 */
- (void)reCreateCollectionView:(NSInteger )index collectionView:(DGCardCollectionView *)cardCollectionView deleteArray:(NSMutableArray <DGCardCell *>*)needDeleteArray{
    
    [self.collectionView removeFromSuperview];
    self.cardLayout.beginIndex = index;
    DGCardCollectionView *collectionView = [[DGCardCollectionView alloc] initWithFrame:CGRectMake(10, 100, [UIScreen mainScreen].bounds.size.width - 20, [UIScreen mainScreen].bounds.size.width - 20) collectionViewLayout: self.cardLayout];
    collectionView.cardDelegate = self;
    collectionView.dataSource = self;
    collectionView.deleteArray = needDeleteArray;
    collectionView.backgroundColor = [UIColor greenColor];
    [collectionView registerNib:[UINib nibWithNibName:@"DGImageViewCell" bundle:nil] forCellWithReuseIdentifier:cell_id];
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
    [self.collectionView reloadData];
}
/**
 卡片调用完成
 
 @param direction 方向
 @param index index
 */
- (void)cardFinishSwipDirection:(CardCollectionSwipDirection )direction index:(NSInteger )index{
    NSLog(@"is finished index --- %zd",index);
}
@end
