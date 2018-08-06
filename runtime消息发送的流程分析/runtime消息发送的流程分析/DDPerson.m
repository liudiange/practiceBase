//
//  DDPerson.m
//  runtime消息发送的流程分析
//
//  Created by apple on 2018/8/3.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "DDPerson.h"
#import <objc/runtime.h>
#import "DGStudent.h"

@implementation DDPerson

//void otherTest(id self,SEL _cmd){
//
//    NSLog(@"------------");
//
//}
//+(BOOL)resolveClassMethod:(SEL)sel{
//    if (sel == @selector(test)) {
//        class_addMethod(object_getClass(self), sel, (IMP)(otherTest), "v@:");
//    }
//    return [super resolveClassMethod:sel];
//
//}

//void otherTest(id self,SEL _cmd){
//
//    NSLog(@"------------");
//
//}
//
//+(BOOL)resolveInstanceMethod:(SEL)sel{
//    if (sel == @selector(test)) {
//        class_addMethod(self, sel, (IMP)otherTest, "v16@0:8");
//        return YES;
//    }
//    return [super resolveInstanceMethod:sel];
//}
//- (void)otherTest{
//
//    NSLog(@"------------");
//
//}
//+(BOOL)resolveInstanceMethod:(SEL)sel{
//
//
//    if (sel == @selector(test)) {
//        Method method = class_getInstanceMethod(self, @selector(otherTest));
//        class_addMethod(self, sel, method_getImplementation(method), method_getTypeEncoding(method));
//        return YES;
//    }
//   return [super resolveInstanceMethod:sel];
//}
//-(id)forwardingTargetForSelector:(SEL)aSelector{
//    if (aSelector == @selector(test)) {
//        return [[DGStudent alloc] init];
//    }
//    return [super forwardingTargetForSelector:aSelector];
//}

-(void)forwardInvocation:(NSInvocation *)anInvocation{
    [anInvocation invokeWithTarget:[[DGStudent alloc] init]];
}
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    if (aSelector == @selector(test)) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
   return [super methodSignatureForSelector:aSelector];
}


@end
