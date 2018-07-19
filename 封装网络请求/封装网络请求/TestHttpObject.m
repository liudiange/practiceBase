//
//  TestHttpObject.m
//  封装网络请求
//
//  Created by apple on 2018/7/19.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "TestHttpObject.h"

@implementation TestHttpObject

/**
 获取首页的数据
 */
+(void)obtainHomeMessageComplete:(void (^)(DGBaseHttpModel *))complete{
   
    DGBaseHttpManager *baseHttpManager = [[DGBaseHttpManager alloc] init];
    
    NSMutableDictionary *parmaDic = [NSMutableDictionary dictionary];
    parmaDic[@"type"] = @(1);
    parmaDic[@"index"] = @(0);
    parmaDic[@"size"] = @(48);
   
    [baseHttpManager GETWithRequestUrl:@"http://qf.56.com/home/v4/moreAnchor.ios" param:parmaDic complete:^(DGBaseHttpModel *baseModel) {
        NSLog(@"%@",baseModel);
    }];
    
    
    
}
@end
