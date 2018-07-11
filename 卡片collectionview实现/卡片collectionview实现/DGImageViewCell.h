//
//  DGImageViewCell.h
//  卡片collectionview实现
//
//  Created by apple on 2018/7/9.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DGImageViewCell;


#define MAX_DISTANCE 140
typedef NS_ENUM(NSUInteger, SwipDirection){
    SwipDirectionLeft  = 1,
    SwipDirectionRight = 2
};

@protocol DGImageViewCellDelegate  <NSObject>

/**
 开始往哪个方向添加或者移除
 
 @param direction 方向
 @param index 下标
 @param cell 当前的cell
 */
- (void)swipDirection:(SwipDirection )direction andIndex:(NSInteger )index cell:(DGImageViewCell *)cell;

@end
@interface DGImageViewCell : UICollectionViewCell
@property (weak, nonatomic) id<DGImageViewCellDelegate> delegate;
/**
 背景的图片
 */
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
/**
 数字lable
 */
@property (weak, nonatomic) IBOutlet UILabel *numberLable;
/**
 当前的下标
 */
@property (assign, nonatomic) NSInteger currentIndex;

@end
