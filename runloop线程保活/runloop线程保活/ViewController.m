//
//  ViewController.m
//  runloop线程保活
//
//  Created by apple on 2018/8/20.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ViewController.h"
#import "DGThread.h"

@interface ViewController ()
@property (strong, nonatomic) DGThread *thread;
@property (assign, nonatomic) BOOL isStopThread;

@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
        NSLog(@"asdasdasdasdasd");
    }];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
   
}

-(void)startThread{
    __weak typeof(self)weakSelf = self;
    self.thread = [[DGThread alloc] initWithBlock:^{
        
        // 这里面进行线程包活
        NSLog(@"当前的线程 ---- %@",[NSThread currentThread]);
        // 往runloop里面添加观察者、observer、timer等等
        [[NSRunLoop currentRunLoop] addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
        // 开启runloop 让他来进行监听，好处理事件
        while (weakSelf.thread && !weakSelf.isStopThread) {
            NSLog(@"weakSelf.isStopThread --- %d",weakSelf.isStopThread);
            [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        }
        
        
    }];
    // 线程开启了
    [self.thread start];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    // 这个参数穿点为NO，为立刻执行后面的事情，比如立刻执行 123
    if (!self.thread) return;
    [self performSelector:@selector(startAction) onThread:self.thread withObject:nil waitUntilDone:NO];
    NSLog(@"123");
    
}

- (void)startAction{
    
    NSLog(@"老夫在这里做了很多的事情");
}

- (void)stop{
    // 停止runloop
    NSLog(@"%s",__func__);
    CFRunLoopStop(CFRunLoopGetCurrent());
    self.isStopThread = YES;
    NSLog(@"已经停止定时器了");
}
-(void)dealloc{
    [self stopThread];
    NSLog(@"%s",__func__);
    
}
- (IBAction)stopThread {
    if (!self.thread || self.isStopThread) return;
    [self performSelector:@selector(stop) onThread:self.thread withObject:nil waitUntilDone:YES];
    NSLog(@"已经停止鲜橙了");
}

@end
