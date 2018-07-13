//
//  DGCardCollectionView.m
//  卡片collectionview实现
//
//  Created by apple on 2018/7/12.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "DGCardCollectionView.h"
#import "DGCardCell.h"

@interface DGCardCollectionView ()<DGCardCellDelegate>

@end
@implementation DGCardCollectionView
-(NSMutableArray *)deleteArray {
    if (!_deleteArray) {
        _deleteArray = [[NSMutableArray alloc] init];
    }
    return _deleteArray;
}
#pragma mark - cell 的delegate
/**
 开始往哪个方向添加或者移除
 
 @param direction 方向
 @param index 下标
 @param cell 当前的cell
 */
- (void)swipDirection:(SwipDirection )direction andIndex:(NSInteger )index cell:(DGCardCell *)cell{
    switch (direction) {
        case SwipDirectionLeft:
        {
            [self.deleteArray addObject:cell];
            NSInteger beginIndex = [self checkIndex:index + 1];
            if ([self.cardDelegate respondsToSelector:@selector(reCreateCollectionView:collectionView:deleteArray:)]) {
                [self.cardDelegate reCreateCollectionView:beginIndex collectionView:self deleteArray:self.deleteArray];
            }
            if ([self.cardDelegate respondsToSelector:@selector(cardFinishSwipDirection:index:)]) {
                [self.cardDelegate cardFinishSwipDirection:1 index:beginIndex];
            }
        }
            break;
        case SwipDirectionRight:
        {
            [self.deleteArray removeObject:cell];
            NSInteger beginIndex = [self checkIndex:index];
            if ([self.cardDelegate respondsToSelector:@selector(reCreateCollectionView:collectionView:deleteArray:)]) {
                [self.cardDelegate reCreateCollectionView:beginIndex collectionView:self deleteArray:self.deleteArray];
            }
            if ([self.cardDelegate respondsToSelector:@selector(cardFinishSwipDirection:index:)]) {
                [self.cardDelegate cardFinishSwipDirection:2 index:beginIndex];
            }
        }
            break;
            
        default:
            break;
    }
}

/**
 检查index防止越界

 @param index 传递的index
 @return 经过检查的index
 */
- (NSInteger)checkIndex:(NSInteger )index {
    if (index == [self numberOfItemsInSection:0]) {
        index = 0;
    }else if (index < 0){
        index = [self numberOfItemsInSection:0] - 1;
    }
    return index;
}



@end
