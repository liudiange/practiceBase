//
//  ViewController.m
//  内存管理相关
//
//  Created by apple on 2018/8/31.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ViewController.h"
#import "DGProxy.h"
#import "DGSpecifyProxy.h"
#import "DGTimer.h"


@interface ViewController ()

@property (weak, nonatomic) NSTimer *timer;
@property (strong, nonatomic) dispatch_source_t gcdTimer;
@property (copy, nonatomic) NSString *keyName;

// 我们要用的字符串
@property (copy, nonatomic) NSString *name;

@end
@implementation ViewController

int b;
int d = 4;
static int a;
static int c = 3;
NSString *g = @"asdasdasd";

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:[DGProxy initWithTarget:self] selector:@selector(timerAction) userInfo:nil repeats:YES];
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:[DGSpecifyProxy initWithTarget:self] selector:@selector(timerAction) userInfo:nil repeats:YES];
    
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    
//    NSString *keyName = [DGTimer start:0.0 interval:1.5 leeway:0 repeat:YES async:YES handleAction:^{
//        NSLog(@"1111111111 %@",[NSThread currentThread]);
//    }];
//    [DGTimer start:1.0 interval:2.0 leeway:0 repeat:YES async:YES target:self selector:@selector(test)];
//    self.keyName = keyName;
    
    // 内存分布
//    NSObject *e = [[NSObject alloc] init];
//    int f = 10;
//    NSLog(@"\n&a=%p\n&b=%p\n&c=%p\n&d=%p\n&e=%p\n&f=%p\n&g=%p\n",&a,&b,&c,&d,&e,&f,&g);
    
    // Tagged Pointer
//    NSNumber *abc = @(10);
//    NSNumber *edf = @(0x600000238140ffff);
//    NSLog(@"\n %p\n %p\n %@\n %@\n",abc,edf,[abc class],[edf class]);
    
//    NSString *str1 = [NSString stringWithFormat:@"abc"];
//    NSString *str2 = [NSString stringWithFormat:@"asdasdasdasdajsdajsdkasdajksdjkakjsdjkaksdjkasdjajksdkjjkasdjkjjkajsd"];
//    NSLog(@"\n%p \n%p \n%@ \n%@",str1,str2,[str1 class],[str2 class]);
    
    // 字符串1
//    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
//    for (NSInteger index = 0; index < 1000; index ++) {
//        dispatch_async(queue, ^{
//           self.name = [NSString stringWithFormat:@"abc"];
//        });
//    }

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [DGTimer cancleTask:self.keyName];
}
- (void)test{
     NSLog(@"2222222222%@",[NSThread currentThread]);
}
- (void)createGCDTimer{
    // 创建定时器
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, dispatch_time(DISPATCH_TIME_NOW, 2.0 * NSEC_PER_SEC), 1.0 *NSEC_PER_SEC, 0.0);
    // 事件处理
    dispatch_source_set_event_handler(timer, ^{
        
        NSLog(@"11111111111");
    });
    // 开始执行
    dispatch_resume(timer);
    self.gcdTimer = timer;
}
- (void)timerAction{
    NSLog(@"%s",__func__);
    
}
-(void)dealloc {
    NSLog(@"%s",__func__);
    [self.timer invalidate];
}
@end
