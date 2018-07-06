//
//  DGPerson.m
//  kvc底层原理
//
//  Created by apple on 2018/7/6.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "DGPerson.h"

@implementation DGPerson
#pragma mark - 付值的过程
//-(void)setAge:(int)age {
//    NSLog(@"setAge---- %d",age);
//}

//- (void)_setAge:(int)age {
//   NSLog(@"_setAge---- %d",age);
//}

/**
 这个方法告诉有没有这个属相，返回yes you这个属性

 @return bool值
 */
+ (BOOL)accessInstanceVariablesDirectly {

    return YES;
}
#pragma mark - 取值的过程
//- (int)getAge{
//    return 11;
//}
//- (int)age{
//    return 12;
//}
//- (int)isAge{
//    return 13;
//}
//- (int)_age{
//    return 14;
//}

@end
