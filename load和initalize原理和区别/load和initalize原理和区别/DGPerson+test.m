//
//  DGPerson+test.m
//  load和initalize原理和区别
//
//  Created by apple on 2018/7/9.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "DGPerson+test.h"

@implementation DGPerson (test)

//+ (void)load{
//
//    NSLog(@"DGPerson (test) --- ") ;
//
//}

+ (void)initialize {
    NSLog(@"initialize -- DGPerson+test");
}



@end
