//
//  DGSpecifyProxy.h
//  内存管理相关
//
//  Created by apple on 2018/8/31.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DGSpecifyProxy : NSProxy

+ (instancetype)initWithTarget:(id)target;

@end
