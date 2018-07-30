//
//  main.m
//  一个字符设置bool值
//
//  Created by apple on 2018/7/30.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DGPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        DGPerson *person = [[DGPerson alloc] init];
        person.white = YES;
        person.rich = NO;
        person.beautiful = YES;
        
        NSLog(@"white = %d ,rich = %d, beautiful = %d",person.isWhite,person.isRich,person.isBeautiful);
        
    }
    return 0;
}
