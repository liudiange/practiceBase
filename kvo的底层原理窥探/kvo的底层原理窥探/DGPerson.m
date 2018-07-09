//
//  DGPerson.m
//  kvo的底层原理窥探
//
//  Created by apple on 2018/7/4.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "DGPerson.h"

@implementation DGPerson


-(void)setAge:(int)age {
    if (age < 0) {
        _age = age;
    }else{
        [self willChangeValueForKey:@"age"];
        _age = age;
        [self didChangeValueForKey:@"age"];
    }
}
/**
 是否自动发送通知呢

 @return no：不自动发送通知
 */
+(BOOL)automaticallyNotifiesObserversOfAge{
    return NO;
}

@end
