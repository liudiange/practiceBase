//
//  ViewController.m
//  verification_Isa
//
//  Created by apple on 2018/7/31.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ViewController.h"
#import "DGPerson.h"
#import <objc/runtime.h>
#import "DGPerson.h"
#import "DGPersonInfo.h"

@interface ViewController ()


@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    DGPerson *person = [[DGPerson alloc] init];
//    [person test];
//
//    [person test];
//    [person test];
//    [person test];

//    DGPerson *person = [[DGPerson alloc] init];
//    objc_setAssociatedObject(person, @"nameKey", @"asdasdasdasd", OBJC_ASSOCIATION_COPY_NONATOMIC);
//
//    NSLog(@"-------------");
    
//    SEL method1 = @selector(name);
//    SEL method2 = sel_registerName("name");
////    NSLog(@"method1 : %p -- method2:%p",method1,method2);
//
//    NSString *methodName1 = NSStringFromSelector(method1);
//    const char *methodName2 = sel_getName(method2);
//    NSLog(@"methodName1 --- %@ //// methodName2 ---- %s",methodName1,methodName2);
    
    DGPerson *person = [[DGPerson alloc] init];
    DG_objc_class *personStruct = (__bridge DG_objc_class *)[DGPerson class];
    class_rw_t *rwStruct = personStruct->data();
      NSLog(@"---------");
    
    
}


@end
