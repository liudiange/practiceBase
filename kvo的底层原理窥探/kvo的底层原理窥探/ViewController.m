//
//  ViewController.m
//  kvo的底层原理窥探
//
//  Created by apple on 2018/7/4.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ViewController.h"
#import "DGPerson.h"
#import <objc/runtime.h>

@interface ViewController ()

@property (strong, nonatomic) DGPerson *person1;
@property (strong, nonatomic) DGPerson *person2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 动态生成这个类isa ---- NSKVONotifying_DGPerson
    self.person1 = [[DGPerson alloc] init];
    // 因为没有添加观察者 所以不生成中间类 而是isa --- 指向 DGPerson
    self.person1.age = 10;
    
    self.person2 = [[DGPerson alloc] init];
    self.person2.age = 20;
    // 查看他们调用那一个方法
    NSLog(@"调用之前的 调用方法的地址 ：%p %p",[self.person1 methodForSelector:@selector(setAge:)],[self.person2 methodForSelector:@selector(setAge:)]);
    
    // 添加观察者。观察者的主要目的是 观察对象的属性的改变
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [self.person1 addObserver:self forKeyPath:@"age" options:options context:@"sasd"];
#pragma mark - 添加了观察者的之后的方法调用foundation的这个方法_NSSetIntValueAndNotify
    //  P (IMP) 0x10daf2790 :通过地址打印调用的方法
   NSLog(@"调用之后的 调用方法的地址 ：%p %p",[self.person1 methodForSelector:@selector(setAge:)],[self.person2 methodForSelector:@selector(setAge:)]);
    
    
    Class person1Class = object_getClass(self.person1);
    Class person1Cls = [self.person1 class];
     NSLog(@"%@ --- %@",person1Class,person1Cls);
    Class person2Class = object_getClass(self.person2);
    Class person2Cls = [self.person2 class];
     NSLog(@"%@ --- %@",person2Class,person2Cls);
   
    [self methodWithClass:object_getClass(self.person1)];

}
- (void)methodWithClass:(Class)cls {
    
    unsigned int count;
    Method *methodList = class_copyMethodList(cls, &count);
    NSMutableString *nameStr = [NSMutableString string];
    
    for (NSInteger index = 0; index < count; index ++) {
        Method method = methodList[index];
        NSString *methodName = NSStringFromSelector(method_getName(method));
        [nameStr appendFormat:@" + %@",methodName];
    }
    NSLog(@"nameStr --- %@",nameStr);
    // c语言的函数要释放
    free(methodList);
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    self.person1.age = 20;
    self.person2.age = 30;

}
/**
 观察者的回去调用的代理

 @param keyPath 那个属性
 @param object 那个对象
 @param change 改变的字典
 @param context 传递的数据
 */
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    NSLog(@"%@ --- 的 %@ 属性值发生了改变，变化为 %@  传递给观察者的参数 %@",object,keyPath,change,context);
    
}
-(void)dealloc {
    [self.person1 removeObserver:self forKeyPath:@"age"];
}
@end
