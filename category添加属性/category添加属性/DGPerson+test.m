//
//  DGPerson+test.m
//  category添加属性
//
//  Created by apple on 2018/7/10.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "DGPerson+test.h"
#import <objc/runtime.h>

//#define DGNameKey @"asdasdas"
@implementation DGPerson (test)

#pragma mark - 第一种办法
//static const char DGNameKey;
//- (void)setName:(NSString *)name{
//    objc_setAssociatedObject(self, &DGNameKey, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
//}
//
//- (NSString *)name{
//    return objc_getAssociatedObject(self, &DGNameKey);
//}
#pragma mark - 第二种办法
//- (void)setName:(NSString *)name{
//    objc_setAssociatedObject(self, DGNameKey, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
//}
//
//- (NSString *)name{
//    return objc_getAssociatedObject(self, DGNameKey);
//}
#pragma mark - 第三种办法
- (void)setName:(NSString *)name{
    objc_setAssociatedObject(self, @selector(name), name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)name{
    return objc_getAssociatedObject(self, _cmd);
}














@end
