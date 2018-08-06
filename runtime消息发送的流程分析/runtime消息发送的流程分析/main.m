//
//  main.m
//  runtime消息发送的流程分析
//
//  Created by apple on 2018/8/3.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        DDPerson *person = [[DDPerson alloc] init];
        [person test];
//        [DDPerson test];
        
    }
    return 0;
}
