//
//  TestHttpObject.h
//  封装网络请求
//
//  Created by apple on 2018/7/19.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DGBaseHttpManager.h"

@interface TestHttpObject : NSObject

/**
 获取首页的数据
 */
+ (void)obtainHomeMessageComplete:(void (^)(DGBaseHttpModel *httpModel))complete;
@end
