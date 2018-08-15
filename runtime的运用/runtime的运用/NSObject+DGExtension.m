//
//  NSObject+DGExtension.m
//  runtime的运用
//
//  Created by apple on 2018/8/15.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "NSObject+DGExtension.h"
#import <objc/runtime.h>

@implementation NSObject (DGExtension)
+ (instancetype)modelWithJson:(NSDictionary *)dic{
    
    id obj = [[self alloc] init];
    unsigned int count;
    Ivar *ivarList = class_copyIvarList([self class], &count);
    
     // 开始便利
    for (int index = 0; index < count; index ++) {
        Ivar ivar = ivarList[index];
        NSMutableString *nameStr = [[NSMutableString alloc] initWithString:[NSString stringWithCString:ivar_getName(ivar) encoding:NSUTF8StringEncoding]];
        [nameStr deleteCharactersInRange:NSMakeRange(0, 1)];
        if ([dic.allKeys containsObject:nameStr]) {
            
            if (dic[nameStr]) { // 不能设置空的值
             [obj setValue:dic[nameStr] forKey:nameStr];
            }
        }
    }
    // 释放
    free(ivarList);
    return obj;
}
@end
