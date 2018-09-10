//
//  DGProxy.m
//  内存管理相关
//
//  Created by apple on 2018/8/31.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "DGProxy.h"

@interface DGProxy ()

@property (weak, nonatomic) id target;

@end
@implementation DGProxy

+ (instancetype)initWithTarget:(id)target{
   
    DGProxy *proxy = [[DGProxy alloc] init];
    proxy.target = target;
    return proxy;
    
}
-(id)forwardingTargetForSelector:(SEL)aSelector{
    
    return self.target;
}


@end
