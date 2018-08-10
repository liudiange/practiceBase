//
//  main.m
//  memberClass和kindOfClass的区别
//
//  Created by apple on 2018/8/10.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DGPerson.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        DGPerson *person = [[DGPerson alloc] init];
        
//        NSLog(@"%d",[person isMemberOfClass:[DGPerson class]]);
//        NSLog(@"%d",[person isMemberOfClass:[NSObject class]]);
//        NSLog(@"%d",[person isKindOfClass:[DGPerson class]]);
//        NSLog(@"%d",[person isKindOfClass:[NSObject class]]);
        
//        NSLog(@"%d", [[NSObject class] isKindOfClass:[NSObject class]]);
//        NSLog(@"%d", [[NSObject class] isMemberOfClass:[NSObject class]]);
//        NSLog(@"%d", [[DGPerson class] isKindOfClass:[DGPerson class]]);
//        NSLog(@"%d", [[DGPerson class] isMemberOfClass:[DGPerson class]]);
        
        NSLog(@"%d", [[DGPerson class] isKindOfClass:[NSObject class]]);
        
    }
    return 0;
}
