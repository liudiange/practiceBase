//
//  DGCardViewLayout.h
//  卡片collectionview实现
//
//  Created by apple on 2018/7/9.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DGCardViewLayout : UICollectionViewLayout
/**
 卡片的数量
 */
@property (assign, nonatomic) int cardCount;
/**
 横向之间的间距
 */
@property (assign, nonatomic) CGFloat horizontalMargon;
/**
 竖向之间的间距
 */
@property (assign, nonatomic) CGFloat verticalMargon;
/**
 开始显示的下标
 */
@property (assign, nonatomic) NSInteger beginIndex;



@end
