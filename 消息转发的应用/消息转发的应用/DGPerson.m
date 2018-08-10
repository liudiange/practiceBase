//
//  DGPerson.m
//  消息转发的应用
//
//  Created by apple on 2018/8/7.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "DGPerson.h"
#import <objc/runtime.h>
@implementation DGPerson

- (void)test{
    NSLog(@"%s",__func__);
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    if ([self respondsToSelector:aSelector]) {
        
        return [NSMethodSignature methodSignatureForSelector:aSelector];
    }
    return [NSMethodSignature signatureWithObjCTypes:"v@:"];
}
-(void)forwardInvocation:(NSInvocation *)anInvocation{
    NSLog(@"%@ -- 哪个方法 %@ 没有实现",anInvocation.target,NSStringFromSelector(anInvocation.selector));
    
}
@end
