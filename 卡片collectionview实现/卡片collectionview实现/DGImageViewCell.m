//
//  DGImageViewCell.m
//  卡片collectionview实现
//
//  Created by apple on 2018/7/9.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "DGImageViewCell.h"

@interface DGImageViewCell ()
/**
 背景的图片
 */
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@end

@implementation DGImageViewCell

-(void)setCommonModel:(DGCardCommonModel *)commonModel{
    _commonModel = commonModel;
    self.numberLable.text = commonModel.name;
    self.currentIndex = commonModel.currentIndex;
}

@end
