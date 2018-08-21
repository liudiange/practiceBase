//
//  DGPermanentThread.m
//  runloop线程保活
//
//  Created by apple on 2018/8/21.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "DGPermanentThread.h"



@interface DGThread : NSThread

@end
@implementation DGThread
- (void)dealloc{
    
    NSLog(@"创建的线程销毁了 ：%s",__func__);
    
}
@end

@interface DGPermanentThread ()

@property (strong, nonatomic) DGThread *thread;
@property (assign, nonatomic,getter=isStopThread) BOOL stopThread;

@end
@implementation DGPermanentThread
#pragma mark - 私有的方法
-(instancetype)init{
    if (self = [super init]) {
        
        __weak typeof(self)weakSelf = self;
        self.thread = [[DGThread alloc] initWithBlock:^{
            
            // 因为runloop没有添加进observer/timer等等的runloop会直接退出
            [[NSRunLoop currentRunLoop] addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
            while (weakSelf.thread && !weakSelf.isStopThread) {
                // 开启运行
                [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
            }
        }];
        [self.thread start];
    }
    return self;
}
/**
 执行方法

 @param action 方法
 */
-(void)executeAction:(threadBlock)action{
    
    if (!self.thread || self.isStopThread) return;
    
    [self performSelector:@selector(runAction:) onThread:self.thread withObject:action waitUntilDone:NO];
    
}

/**
 在这个线程执行这个方法

 @param action block
 */
-(void)runAction:(threadBlock)action{
    if (action) {
        action();
    }
}
#pragma mark - 公共的方法
/**
 停止线程
 */
-(void)stop{
    
    if (!self.thread || self.isStopThread) return;
    
    [self performSelector:@selector(stopThreadAction) onThread:self.thread withObject:nil waitUntilDone:YES];
}

/**
 停止线程
 */
-(void)stopThreadAction{
    
    self.stopThread = YES;
    CFRunLoopStop(CFRunLoopGetCurrent());
    self.thread = nil;
}
-(void)dealloc {
    [self stop];
    NSLog(@"永久线程销毁了 %s",__func__);
}
@end
