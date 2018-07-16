//
//  main.m
//  block的本质问题
//
//  Created by apple on 2018/7/13.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

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

typedef void (^TestBlock)(void);
//TestBlock test(){
//    int age = 3;
//    return ^{
//        NSLog(@"-------------%d",age);
//    };
//}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
        });
        
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
