//
//  NSMutableArray+DGExtension.m
//  runtime的运用
//
//  Created by apple on 2018/8/15.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "NSMutableArray+DGExtension.h"
#import <objc/runtime.h>

@implementation NSMutableArray (DGExtension)

+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class cla = NSClassFromString(@"__NSArrayM"); // 这个要写类簇
        Method method1 = class_getInstanceMethod(cla, @selector(insertObject:atIndex:));
        Method method2 = class_getInstanceMethod(cla, @selector(DG_insertObject:atIndex:));
        method_exchangeImplementations(method1, method2);
        
    });
    
}
-(void)DG_insertObject:(id)anObject atIndex:(NSUInteger)index{
    
    if (!anObject) return;
    [self DG_insertObject:anObject atIndex:index];

}


@end
