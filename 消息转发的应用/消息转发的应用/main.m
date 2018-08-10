//
//  main.m
//  消息转发的应用
//
//  Created by apple on 2018/8/7.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DGPerson.h"



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        DGPerson *person = [[DGPerson alloc] init];
        [person test];
        [person run];
        [person eat];
        
        
    }
    return 0;
}
