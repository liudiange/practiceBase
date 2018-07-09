//
//  DGPerson.m
//  load和initalize原理和区别
//
//  Created by apple on 2018/7/9.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "DGPerson.h"

@implementation DGPerson
//+ (void)load{
//    NSLog(@"DGPerson --- ") ;
//}


+ (void)initialize {
    NSLog(@"initialize -- DGPerson");
}

@end
