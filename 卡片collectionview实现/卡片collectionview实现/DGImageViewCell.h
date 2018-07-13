//
//  DGImageViewCell.h
//  卡片collectionview实现
//
//  Created by apple on 2018/7/9.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DGCardCommonModel.h"
#import "DGCardCell.h"

@interface DGImageViewCell : DGCardCell

/**
 数字lable
 */
@property (weak, nonatomic) IBOutlet UILabel *numberLable;
@property (strong, nonatomic) DGCardCommonModel *commonModel;



@end
