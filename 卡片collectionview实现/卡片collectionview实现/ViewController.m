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

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,DGImageViewCellDelegate>

@property (strong, nonatomic) NSMutableArray *deleteArray;
@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) DGCardViewLayout *cardLayout;
@property (strong, nonatomic) NSMutableArray *dataArray;

@end
@implementation ViewController
NSString static *cell_id = @"cellID";
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
        [self.dataArray addObject:@"asdasdasd"];
    }
    
    DGCardViewLayout *cardLayout = [[DGCardViewLayout alloc] init];
    cardLayout.cardCount = 4;
    cardLayout.verticalMargon = 10;
    cardLayout.horizontalMargon = 20;
    cardLayout.beginIndex = 8;
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(10, 100, [UIScreen mainScreen].bounds.size.width - 20, [UIScreen mainScreen].bounds.size.width - 20) collectionViewLayout: cardLayout];
    collectionView.delegate = self;
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
    cell.delegate = self;
    cell.numberLable.text = [NSString stringWithFormat:@"%zd",indexPath.item];
    cell.currentIndex = indexPath.item;
    return cell;
}
#pragma mark - cell 的delegate
/**
 开始往哪个方向添加或者移除
 
 @param direction 方向
 @param index 下标
 @param cell 当前的cell
 */
- (void)swipDirection:(SwipDirection )direction andIndex:(NSInteger )index cell:(DGImageViewCell *)cell{
    switch (direction) {
        case SwipDirectionLeft:
            {
                [self.deleteArray addObject:cell];
                [self reloadCollection:(int)(index + 1)];
            }
            break;
        case SwipDirectionRight:
        {
            
        }
            break;
            
        default:
            break;
    }
}
#pragma mark - 其他方法的响应
- (void)reloadCollection:(int )beginIndex{
    
    [self.collectionView removeFromSuperview];
    self.cardLayout.beginIndex = beginIndex;
    if (beginIndex == self.dataArray.count) {
        self.cardLayout.beginIndex = 0;
    }else if (beginIndex < 0){
        self.cardLayout.beginIndex = (int)(self.dataArray.count - 1);
    }
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(10, 100, [UIScreen mainScreen].bounds.size.width - 20, [UIScreen mainScreen].bounds.size.width - 20) collectionViewLayout: self.cardLayout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.backgroundColor = [UIColor greenColor];
    [collectionView registerNib:[UINib nibWithNibName:@"DGImageViewCell" bundle:nil] forCellWithReuseIdentifier:cell_id];
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
    [self.collectionView reloadData];

}


@end
