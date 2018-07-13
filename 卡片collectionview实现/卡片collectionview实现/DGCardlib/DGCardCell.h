//
//  DGCardCell.h
//  卡片collectionview实现
//
//  Created by apple on 2018/7/12.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DGCardCollectionView.h"
@class DGCardCollectionView;
@class DGCardCell;

#define MAX_DISTANCE 140
typedef NS_ENUM(NSUInteger, SwipDirection){
    SwipDirectionLeft  = 1,
    SwipDirectionRight = 2
};


@protocol DGCardCellDelegate  <NSObject>
/**
 开始往哪个方向添加或者移除
 
 @param direction 方向
 @param index 下标
 @param cell 当前的cell
 */
- (void)swipDirection:(SwipDirection )direction andIndex:(NSInteger )index cell:(DGCardCell *)cell;

@end

@interface DGCardCell : UICollectionViewCell

/**
 delegate
 */
@property (weak, nonatomic) id<DGCardCellDelegate> delegate;
@property (strong, nonatomic) DGCardCollectionView  *collectionView;
/**
 当前的下标
 */
@property (assign, nonatomic) NSInteger currentIndex;

@end
