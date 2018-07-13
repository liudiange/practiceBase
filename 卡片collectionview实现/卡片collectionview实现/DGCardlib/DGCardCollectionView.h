//
//  DGCardCollectionView.h
//  卡片collectionview实现
//
//  Created by apple on 2018/7/12.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DGCardCell;
typedef NS_ENUM(NSUInteger, CardCollectionSwipDirection){
    CardCollectionSwipDirectionLeft  = 1,
    CardCollectionSwipDirectionRight = 2
};


@class DGCardCollectionView;

@protocol DGCardCollectionViewDelegate <UICollectionViewDelegate>

/**
 需要刷新collectionview

 @param index index
 @param cardCollectionView collection
 @param needDeleteArra 需要删除的数组
 */
- (void)reCreateCollectionView:(NSInteger )index collectionView:(DGCardCollectionView *)cardCollectionView deleteArray:(NSMutableArray <DGCardCell *>*)needDeleteArra;
/**
 卡片调用完成

 @param direction 方向
 @param index index
 */
- (void)cardFinishSwipDirection:(CardCollectionSwipDirection )direction index:(NSInteger )index;

@end

@interface DGCardCollectionView : UICollectionView

@property (weak, nonatomic) id<DGCardCollectionViewDelegate> cardDelegate;
/**
 要删除的数组
 */
@property (strong, nonatomic) NSMutableArray *deleteArray;
/**
 刷新的方法

 @param beginIndex layout的下标
 */
- (void)reloadCollection:(NSInteger )beginIndex;

@end
