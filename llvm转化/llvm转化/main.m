//
//  main.m
//  llvm转化
//
//  Created by apple on 2018/8/13.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DGStudent.h"

void test(int a){
    NSLog(@"%d",a);
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        DGStudent *student = [[DGStudent alloc] init];
//        [student test];
        
        int a = 10;
        int b = 20;
        int c = a + b;
        test(c);
    }
    return 0;
}
