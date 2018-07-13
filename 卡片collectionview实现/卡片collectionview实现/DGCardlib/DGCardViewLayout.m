//
//  DGCardViewLayout.m
//  卡片collectionview实现
//
//  Created by apple on 2018/7/9.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "DGCardViewLayout.h"

@implementation DGCardViewLayout
/**
 返回UICollectionViewLayoutAttributes的数组

 @param rect 边距
 @return 数组
 */
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    NSMutableArray *dataArray = [NSMutableArray array];
    NSInteger numberCount = [self.collectionView numberOfItemsInSection:0];
    for (NSInteger index = 0; index < numberCount; index ++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
        UICollectionViewLayoutAttributes *layoutAttribute = [self layoutAttributesForItemAtIndexPath:indexPath];
        [dataArray addObject:layoutAttribute];
    }
    return dataArray;
}

/**
 返回每一个元素具体怎样

 @param indexPath indexpath
 @return UICollectionViewLayoutAttributes
 */
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger numberCount = [self.collectionView numberOfItemsInSection:0];
    UICollectionViewLayoutAttributes *layoutAttributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    if ((indexPath.item >= self.beginIndex)  && indexPath.item < (self.cardCount + self.beginIndex)) {
        
        layoutAttributes.hidden = NO;
        layoutAttributes.frame = CGRectMake(self.horizontalMargon*(indexPath.item - self.beginIndex), (self.cardCount + self.beginIndex - 1 - indexPath.item)*self.verticalMargon, self.collectionView.frame.size.width - 2 * self.horizontalMargon * (indexPath.item - self.beginIndex), self.collectionView.frame.size.height -(self.cardCount + self.beginIndex - 1 -indexPath.item)*self.verticalMargon);
        
    }else if(indexPath.item >= (self.cardCount + self.beginIndex)){
        
        layoutAttributes.hidden = NO;
        layoutAttributes.frame = CGRectMake(self.horizontalMargon*(self.cardCount), 0, self.collectionView.frame.size.width - 2 * self.horizontalMargon * self.cardCount, self.collectionView.frame.size.height);
        
    }else{
        layoutAttributes.hidden = YES;
        layoutAttributes.frame = CGRectMake(self.horizontalMargon*(self.cardCount), 0, self.collectionView.frame.size.width - 2 * self.horizontalMargon * self.cardCount, self.collectionView.frame.size.height);
    }
    layoutAttributes.zIndex = numberCount - indexPath.item;
    return layoutAttributes;
}
/**
 每次变化的时候都会返回调用

 @param newBounds 新的边距
 @return 是否应该返回
 */
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}

@end
