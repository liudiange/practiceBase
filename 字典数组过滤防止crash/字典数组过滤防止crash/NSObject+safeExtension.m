//
//  NSObject+safeExtension.m
//  字典为nil和数组为nil的处理
//
//  Created by apple on 2018/8/17.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <objc/runtime.h>
#import <UIKit/UIKit.h>


@implementation NSObject (safeExtension)
+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
#pragma mark 数组相关的方法
        [NSObject exchangeMethod:@"__NSArrayM" withMySelector: @selector(safe_insertObject:atIndex:) andSystemSelector:@selector(insertObject:atIndex:)];
        [NSObject exchangeMethod:@"__NSArrayM" withMySelector: @selector(safe_removeObject:) andSystemSelector:@selector(removeObject:)];
        [NSObject exchangeMethod:@"__NSArrayM" withMySelector: @selector(safe_MobjectAtIndex:) andSystemSelector:@selector(objectAtIndex:)];
        [NSObject exchangeMethod:@"__NSArrayM" withMySelector: @selector(safe_MobjectAtIndexedSubscript:) andSystemSelector:@selector(objectAtIndexedSubscript:)];
        [NSObject exchangeMethod:@"__NSArrayI" withMySelector: @selector(safe_objectAtIndexedSubscript:) andSystemSelector:@selector(objectAtIndexedSubscript:)];
        [NSObject exchangeMethod:@"__NSArray0" withMySelector: @selector(safe_objectAtIndex:) andSystemSelector:@selector(objectAtIndex:)];
#pragma mark 字典的方法
        [NSObject exchangeMethod:@"__NSDictionaryM" withMySelector: @selector(safe_MsetObject:forKeyedSubscript:) andSystemSelector:@selector(setObject:forKeyedSubscript:)];
        
    });
    
    
}
#pragma mark - 方法替换
+ (void)exchangeMethod:(NSString *)className withMySelector:(SEL)mySelector andSystemSelector:(SEL)systemSelector{
    
    Class cls = NSClassFromString(className);
    Method method1 = class_getInstanceMethod(cls, systemSelector);
    Method method2 = class_getInstanceMethod(self, mySelector);
    method_exchangeImplementations(method1,method2);

}
#pragma mark -字典相关安全方法的实现
/**
 可变的空字典设置值

 @param obj 值
 @param key key
 */
- (void)safe_MsetObject:(id)obj forKeyedSubscript:(id)key{
    if (!obj || !key ) {
        NSLog(@"可变字典设置值 key为nil 或者 obj为nil %s",__func__);
        return;
    }
    [self safe_MsetObject:obj forKeyedSubscript:key];
}

#pragma mark 数组中相关安全方法的实现
/**
 获取数组中的值
 
 @param index 下标
 @return 要获取的对象
 */
-(id)safe_objectAtIndex:(NSUInteger)index{
    NSArray *array = (NSArray *)self;
    if (index >= array.count) {
        NSLog(@"数组越界了老哥 === %s",__func__);
        return nil;
    }
    return [self safe_objectAtIndex:index];
}
/**
 获取数组中的值
 
 @param index 下标
 @return 要获取的对象
 */
-(id)safe_MobjectAtIndexedSubscript:(NSUInteger)index{
    NSMutableArray *array = (NSMutableArray *)self;
    if (index >= array.count) {
        NSLog(@"数组越界了老哥 === %s",__func__);
        return nil;
    }
    return [self safe_MobjectAtIndexedSubscript:index];
}
/**
 获取数组中的值
 
 @param index 下标
 @return 要获取的对象
 */
-(id)safe_objectAtIndexedSubscript:(NSUInteger)index{
    NSArray *array = (NSArray *)self;
    if (index >= array.count) {
        NSLog(@"数组越界了老哥 === %s",__func__);
        return nil;
    }
    return [self safe_objectAtIndexedSubscript:index];
}
/**
 获取数组中的值

 @param index 下标
 @return 要获取的对象
 */
-(id)safe_MobjectAtIndex:(NSUInteger)index{
    NSMutableArray *array = (NSMutableArray *)self;
    if (index >= array.count) {
        NSLog(@"数组越界了老哥 === %s",__func__);
        return nil;
    }
    return [self safe_MobjectAtIndex:index];
}
/**
 删除数据安全

 @param anObject 要删除的数据
 */
- (void)safe_removeObject:(id)anObject{
    if (!anObject) {
        NSLog(@"删除的数据为nil ==== %s",__func__);
        return;
    }
    [self safe_removeObject:anObject];
}
/**
 插入数据

 @param anObject 数据
 @param index 下标
 */
- (void)safe_insertObject:(id)anObject atIndex:(NSUInteger)index{
    if (!anObject) {
        NSLog(@"插入数组为空了 ==== %s",__func__);
        return;
    }
    [self safe_insertObject:anObject atIndex:index];
}

@end
