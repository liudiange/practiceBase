//
//  main.m
//  category添加属性
//
//  Created by apple on 2018/7/10.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DGPerson.h"
#import "DGPerson+test.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        DGPerson *person = [[DGPerson alloc] init];
        person.name = @"liudiange";
        NSLog(@"name --- %@",person.name);
    }
    return 0;
}
