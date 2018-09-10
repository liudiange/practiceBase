//
//  DGSpecifyProxy.m
//  内存管理相关
//
//  Created by apple on 2018/8/31.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "DGSpecifyProxy.h"

@interface DGSpecifyProxy ()

@property (weak, nonatomic) id target;

@end

@implementation DGSpecifyProxy

+ (instancetype)initWithTarget:(id)target{
    
    DGSpecifyProxy *proxy = [DGSpecifyProxy alloc];
    proxy.target = target;
    return proxy;
    
}
//-(NSMethodSignature *)methodSignatureForSelector:(SEL)sel{
//
//    return [self.target methodSignatureForSelector:sel];
//}
//-(void)forwardInvocation:(NSInvocation *)invocation{
//
//    [invocation invokeWithTarget:self.target];
//
//}
@end
