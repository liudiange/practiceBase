//
//  ViewController.m
//  runtime的运用
//
//  Created by apple on 2018/8/13.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ViewController.h"
#import "DGCar.h"
#import "DGPerson.h"
#import <objc/runtime.h>

@interface ViewController ()


@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    DGPerson *person = [[DGPerson alloc] init];
//    [person test];
//    // 将person的isa指针指向DGCar
//    object_setClass(person, [DGCar class]);
//    [person test];

    
//    DGPerson *person = [[DGPerson alloc] init];
//    NSLog(@"%d - %d - %d", object_isClass([DGPerson class]),object_isClass(object_getClass([DGPerson class])),object_isClass(person));
    
//   class_getSuperclass()
    
    
//    //创建一个类
//    Class animalClass = objc_allocateClassPair([NSObject class], "DGAnimal", 0);
//    // 添加属性（animalClass：类名 4：int占的字节数 1：内存对齐默认为1 "v@:"：types）
//    class_addIvar(animalClass, "_age", 4, 1, @encode(int));
//    // 添加方法
//    class_addMethod(animalClass, @selector(test), (IMP)otherTest, "v@:");
//    // 注册一个类 ，添加方法等等的 要在注册类的前面执行最好
//    objc_registerClassPair(animalClass);
//
//    // 开始使用（必须还要alloc，否则失败）
//    id animal = [[animalClass alloc] init];
//    [animal setValue:@10 forKey:@"_age"];
//
//    NSLog(@"age = %@",[animal valueForKey:@"_age"]);
//    [animal test];
//
//    // 不在用到这个类的时候需要释放
//    objc_disposeClassPair(animalClass);
    
    
//    // 获取成员变量
//    unsigned int count;
//    Ivar *ivarList = class_copyIvarList([UITextField class], &count);
//    for (int index = 0; index < count; index++) {
//        Ivar ivar = ivarList[index];
//        NSString *name = [NSString stringWithCString: ivar_getName(ivar) encoding:NSUTF8StringEncoding];
//        NSLog(@"%@",name);
//
//    }
//    free(ivarList);
    
    
//    // 获取一个对象的一个成员变量
//    Ivar ivar = class_getInstanceVariable([DGPerson class], "_name");
//    NSString *nameStr = [NSString stringWithCString:ivar_getName(ivar) encoding:NSUTF8StringEncoding];
//    NSString *typeStr = [NSString stringWithCString:ivar_getTypeEncoding(ivar) encoding:NSUTF8StringEncoding];
//    NSLog(@"nameStr --- %@  type---%@",nameStr,typeStr);

    
    // 设置一个ivar
    DGPerson *person = [[DGPerson alloc] init];
    Ivar nameIvar = class_getInstanceVariable([DGPerson class], "_name");
    Ivar ageIvar = class_getInstanceVariable([DGPerson class], "_age");
    object_setIvar(person, nameIvar, @"ahshdahshdahsd");
    object_setIvar(person, ageIvar, (__bridge id)(void *)10);
    NSLog(@"name = %@ --- age = %d",person.name,person.age);
    
    
    
    
    
    
    
    
    
}

void otherTest(){
    
    NSLog(@"老夫打印了哈");
}

@end
