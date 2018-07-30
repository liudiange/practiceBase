//
//  main.m
//  block的本质问题
//
//  Created by apple on 2018/7/13.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DGPerson.h"

//// __block_impl的结构
//struct __block_impl {
//    void *isa;
//    int Flags;
//    int Reserved;
//    void *FuncPtr;
//};
//// __main_block_desc_0 什么东西
//static struct __main_block_desc_0 {
//    size_t reserved;
//    size_t Block_size;
//}
//// 内部函数调用
//struct __main_block_impl_0 {
//    struct __block_impl impl;
//    struct __main_block_desc_0* Desc;
//    __main_block_impl_0(void *fp, struct __main_block_desc_0 *desc, int flags=0) {
//        impl.isa = &_NSConcreteStackBlock;
//        impl.Flags = flags;
//        impl.FuncPtr = fp;
//        Desc = desc;
//    }
//};

//void (^TestBlock)(void);
//void test(){
//    int weight = 10;
//    TestBlock = ^{
//        NSLog(@"weight = %d",weight);
//    };
//
//}
//int height = 10;

//typedef void (^TestBlock)(void);
//TestBlock test(){
//    int age = 3;
//    return ^{
//        NSLog(@"-------------%d",age);
//    };
//}
//typedef void(^MyBlock)(void);


//struct __Block_byref_age_0 {
//    void *__isa;
//    struct __Block_byref_age_0 *__forwarding;
//    int __flags;
//    int __size;
//    int age;
//};
//struct __block_impl {
//    void *isa;
//    int Flags;
//    int Reserved;
//    void *FuncPtr;
//};
//struct __main_block_desc_0 {
//    size_t reserved;
//    size_t Block_size;
//    void (*copy)(void);
//    void (*dispose)(void);
//};
//struct __main_block_impl_0 {
//    struct __block_impl impl;
//    struct __main_block_desc_0* Desc;
//    struct __Block_byref_age_0 *age; // by ref
//};



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        DGPerson *person = [[DGPerson alloc] init];
        __weak typeof(person) weakPerson = person;
        person.myBlock = [^{
            NSLog(@"age = %d",weakPerson.age);
        } copy];
        person.myBlock();
        [person release];
        NSLog(@"-------------");
        
//        __block DGPerson *person = [[DGPerson alloc] init];
//        person.myBlock = ^{
//            NSLog(@"age = %d",person.age);
//            person = nil;
//        };
//        person.myBlock();
//        NSLog(@"-------------");
        
//        DGPerson *person = [[DGPerson alloc] init];
//        __weak typeof(person)weakPerspon = person;
//        person.myBlock = ^{
//            weakPerspon.age = 20;
//        };
//        person.myBlock();
//        NSLog(@"-------------");
        
//        DGPerson *person = [[DGPerson alloc] init];
//        __weak typeof(person)weakPerspon = person;
//        person.myBlock = ^{
//            weakPerspon.age = 20;
//        };
//        person.myBlock();
//        NSLog(@"-------------");
        
//        __block int age = 10;
//        void (^myBlock)(void) = ^(){
//            age = 20;
//            NSLog(@"age = %d",age);
//        };
//        myBlock();
//
//        // 将block 替换成我们写的那个结构体
//        struct __main_block_impl_0 *block = (__bridge struct __main_block_impl_0 *)myBlock;
//
//        NSLog(@"age 的 address = %p",&age);
        
        
//        MyBlock myBlock;
//
//        {
//            DGPerson *person = [[DGPerson alloc] init];
//            person.age = 20;
////            __weak DGPerson *weakPerson = person;
//            myBlock = [^{
//                NSLog(@"age = %d",person.age);
//            } copy];
//            [person release];
//
//
//        }
//        NSLog(@"--------------");
        
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//
//        });
        
//        NSArray *array = [NSArray array];
//        [array sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
//
//        }];
        
//        int age = 3;
//        TestBlock testblock = ^(){
//            NSLog(@"age = %d",age);
//        };
//        testblock();
//        NSLog(@"class ++++ %@",[testblock class]);
        
//        TestBlock testBlock = test();
//        NSLog(@"class ++++ %@",[testBlock class]);
        
//        test();
//        TestBlock();
        
//        int age = 10;
//        static int weight = 10;
//
//        void (^myBlcok)(void) = ^{
//            NSLog(@"age = %d, weight = %d ,height = %d",age,weight,height);
//        };
//        age = 20;
//        weight = 20;
//        height = 30;
//        myBlcok();
        
        
//        void (^myBlock)(int,int) = ^(int a,int b){
//            NSLog(@"a = %d -- b = %d",a,b);
//        };
//        myBlock(10,10);
//        int age = 10;
//        void (^myBlock)(void) = [^{
//           // NSLog(@"---------------age = %d----------------------",age);
//        }copy];
//        myBlock();
//        NSLog(@"%@+++++%@++++++++%@++++++%@",[myBlock class],[[myBlock class] superclass],[[[myBlock class] superclass] superclass],[[[[myBlock class] superclass] superclass] superclass]);
        
        
        
        
    }
    return 0;
}
