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
#import "DGModel.h"
#import "NSObject+DGExtension.h"

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
//    DGPerson *person = [[DGPerson alloc] init];
//    Ivar nameIvar = class_getInstanceVariable([DGPerson class], "_name");
//    Ivar ageIvar = class_getInstanceVariable([DGPerson class], "_age");
//    object_setIvar(person, nameIvar, @"ahshdahshdahsd");
//    object_setIvar(person, ageIvar, (__bridge id)(void *)10);
//    NSLog(@"name = %@ --- age = %d",person.name,person.age);

    // 获取一个属性的例子
//    objc_property_t nameProperty = class_getProperty([DGPerson class], "name");
//    NSString *nameStr = [NSString stringWithCString:property_getName(nameProperty) encoding:NSUTF8StringEncoding];
//    NSLog(@"nameStr -- %@",nameStr);
    
//    class_copyPropertyList(<#Class  _Nullable __unsafe_unretained cls#>, <#unsigned int * _Nullable outCount#>)
    
    //动态的添加属性
//    objc_property_attribute_t type = {"T",[[NSString stringWithFormat:@"@\"%@\"",NSStringFromClass([NSString class])] UTF8String] }; // type 我这里是string类型
//    objc_property_attribute_t copyShip = { "C",""}; // C = copy
//    objc_property_attribute_t nonatomicAttr = {"N",""}; // N = nonatomic
//    objc_property_attribute_t nameIvar = { "V",[[NSString stringWithFormat:@"_%@",@"hand"] UTF8String]};
//    objc_property_attribute_t attrs[] = {type,copyShip,nonatomicAttr,nameIvar};
//    class_addProperty([DGPerson class], [@"hand" UTF8String], attrs, 4);
//
//    // 动态的获取属性
//    unsigned int outCount, i;
//    objc_property_t *properties = class_copyPropertyList([DGPerson class], &outCount);
//    for (i = 0; i < outCount; i++) {
//        objc_property_t property = properties[i];
//        NSLog(@"属性 %s ======= 特征 %s\n", property_getName(property), property_getAttributes(property));
//    }
    
    // 动态替换成员变量
//    class_replaceProperty(<#Class  _Nullable __unsafe_unretained cls#>, <#const char * _Nonnull name#>, <#const objc_property_attribute_t * _Nullable attributes#>, <#unsigned int attributeCount#>)
    
    // 获取属性的一些信息
//    property_getName(<#objc_property_t  _Nonnull property#>) property_getAttributes(<#objc_property_t  _Nonnull property#>)
    
    // 获取一个实例的方法
//    Method testMethod = class_getClassMethod([DGPerson class], @selector(eat));
//    NSString *methodName = NSStringFromSelector(method_getName(testMethod));
//    NSLog(@"methodName -- %@",methodName);
    
    // 获取一个方法的实现
//    IMP eatImp = class_getMethodImplementation([DGPerson class], @selector(eat));
//    NSLog(@"eatImp --- %s",eatImp);
    
    // 设置一个方法的实现
//    IMP carTestImp = class_getMethodImplementation([DGCar class], @selector(test));
//    Method personTestMethod = class_getInstanceMethod([DGPerson class], @selector(test));
//    method_setImplementation(personTestMethod, carTestImp);
//    DGPerson *person = [[DGPerson alloc] init];
//    [person test];
    
//    // 替换方法的实现
//    Method personTestMethod = class_getInstanceMethod([DGPerson class], @selector(test));
//    Method carTestMethod = class_getInstanceMethod([DGCar class], @selector(test));
//    method_exchangeImplementations(personTestMethod, carTestMethod);
//
//    DGPerson *person = [[DGPerson alloc] init];
//    [person test];
    
    // 获取方法列表
//    class_copyMethodList(<#Class  _Nullable __unsafe_unretained cls#>, <#unsigned int * _Nullable outCount#>)
    
//    class_addMethod([DGPerson class], <#SEL  _Nonnull name#>, <#IMP  _Nonnull imp#>, <#const char * _Nullable types#>)
//    class_replaceMethod(<#Class  _Nullable __unsafe_unretained cls#>, <#SEL  _Nonnull name#>, <#IMP  _Nonnull imp#>, <#const char * _Nullable types#>)
    
    // 替换方法block的实现
//    class_replaceMethod([DGPerson class], @selector(test), imp_implementationWithBlock(^{
//        NSLog(@"123455666");
//
//    }), "v@:");
//    DGPerson *person = [[DGPerson alloc] init];
//    [person test];
    
    // 字典转化模型
//    NSDictionary *dic = @{
//                          @"name" :@"kate",
//                          @"age" :@10,
//                          @"weight" :@100
//                          };
//    DGModel *model = [DGModel modelWithJson:dic];
//    NSLog(@"==== %@",model.name);
    
    // 方法替换实际应用
//    id obj = nil;
//    NSMutableArray *array = [[NSMutableArray alloc] init];
//    [array addObject:obj];
//
//    NSLog(@"============");
    
//    objc_setAssociatedObject(<#id  _Nonnull object#>, <#const void * _Nonnull key#>, <#id  _Nullable value#>, <#objc_AssociationPolicy policy#>)
    
    
    
}
//+ (void)addStrPropertyForTargetClass:(Class)targetClass Name:(NSString *)propertyName{
//    objc_property_attribute_t type = { "T", [[NSString stringWithFormat:@"@\"%@\"",NSStringFromClass([NSString class])] UTF8String] }; //type
//    objc_property_attribute_t ownership0 = { "C", "" }; // C = copy
//    objc_property_attribute_t ownership = { "N", "" }; //N = nonatomic
//    objc_property_attribute_t backingivar  = { "V", [[NSString stringWithFormat:@"_%@", propertyName] UTF8String] };  //variable name
//    objc_property_attribute_t attrs[] = { type, ownership0, ownership, backingivar };
//    if (class_addProperty(targetClass, [propertyName UTF8String], attrs, 4)) {
//        //添加get和set方法
//        [targetClass addObjectProperty:propertyName];
//        DDLogDebug(@"创建属性Property成功");
//    }
//}
void otherTest(){
    
    NSLog(@"老夫打印了哈");
}

@end
