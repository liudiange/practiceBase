//
//  DGPerson+eat.m
//  load和initalize原理和区别
//
//  Created by apple on 2018/7/9.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "DGPerson+eat.h"

@implementation DGPerson (eat)

//+ (void)load{
//    NSLog(@"DGPerson (eat) --- ") ;
//}
+ (void)initialize {
    
    NSLog(@"initialize -- DGPerson+eat");
    
}


@end
