//
//  DGViewController.m
//  kvo的底层原理窥探
//
//  Created by apple on 2018/7/9.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "DGViewController.h"

@implementation DGViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.student = [[DGStudent alloc] init];
    self.student.age = 10;
    [self.student addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:@"sdadasd"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.student.age = 30;
    });
    
}
/**
 观察者的回去调用的代理

 @param keyPath 那个属性
 @param object 那个对象
 @param change 改变的字典
 @param context 传递的数据
 */
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"+++++++++++++++");
    NSLog(@"%@ --- 的 %@ 属性值发生了改变，变化为 %@  传递给观察者的参数 %@",object,keyPath,change,context);

}
@end
