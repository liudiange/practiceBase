//
//  DGTwoViewController.m
//  kvo的底层原理窥探
//
//  Created by apple on 2018/7/9.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "DGTwoViewController.h"
#import "DGStudent.h"

@interface DGTwoViewController ()

@end

@implementation DGTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    [self.student addObserver:self forKeyPath:@"weight" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:@"weight"];
    [self.student addObserver:self forKeyPath:@"height" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:@"height"];
}
/**
 观察者的回去调用的代理

 @param keyPath 那个属性
 @param object 那个对象
 @param change 改变的字典
 @param context 传递的数据
 */
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"------------------");
    NSLog(@"%@ --- 的 %@ 属性值发生了改变，变化为 %@  传递给观察者的参数 %@",object,keyPath,change,context);
    if (([object isKindOfClass:[DGStudent class]]) && ([keyPath isEqualToString:@"weight"] || [keyPath isEqualToString:@"height"])) {
        NSLog(@"我们是好孩子");
    }else{
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }

}
#pragma mark - 其他的相关的处理
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    self.student.weight = 50;
    self.student.height = 50;
}

-(void)dealloc {
    [self.student removeObserver:self forKeyPath:@"age"];
}

@end
