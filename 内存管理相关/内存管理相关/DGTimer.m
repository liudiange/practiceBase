//
//  DGTimer.m
//  内存管理相关
//
//  Created by apple on 2018/9/3.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "DGTimer.h"

@implementation DGTimer


static NSMutableDictionary *timer_dic;
static dispatch_semaphore_t gcd_semaphore;

+ (void)initialize{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        timer_dic = [NSMutableDictionary dictionary];
        gcd_semaphore = dispatch_semaphore_create(1);
        
    });
}
/**
 定时器的事件
 
 @param start 开始的时间
 @param interval 中间的间隔
 @param leeway 延时多少秒开始执行
 @param repeat 是否重复
 @param isAsync 是否在异步线程
 @param action 事件处理
 */
+ (NSString *)start:(NSTimeInterval)start
     interval:(NSTimeInterval)interval
       leeway:(NSTimeInterval)leeway
       repeat:(BOOL)repeat
        async:(BOOL)isAsync
 handleAction:(void (^)(void))action{
 
    if ((interval <= 0 && repeat) || action == nil) {
        NSAssert((interval <= 0 && repeat) != YES, @"如果重复操作,那么时间间隔不能为0");
        NSAssert(action != nil, @"事件处理不能为空");
        return nil;
    }
    // 创建gcd定时器
    dispatch_queue_t queue = isAsync ?dispatch_get_global_queue(0, 0) : dispatch_get_main_queue();
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, dispatch_time(DISPATCH_TIME_NOW, start * NSEC_PER_SEC), interval *NSEC_PER_SEC, leeway *NSEC_PER_SEC);
    // 加锁
    dispatch_semaphore_wait(gcd_semaphore, DISPATCH_TIME_FOREVER);
    NSString *keyName = [NSString stringWithFormat:@"%zd",timer_dic.count];
    timer_dic[keyName] = timer;
    dispatch_semaphore_signal(gcd_semaphore);
    // 时间处理
    dispatch_source_set_event_handler(timer, ^{
        action();
        if (!repeat) {
            [self cancleTask:keyName];
        }
    });
    dispatch_resume(timer);
    // 这样的操作相当于强引用了
    return keyName;
}
+ (NSString *)start:(NSTimeInterval)start
           interval:(NSTimeInterval)interval
             leeway:(NSTimeInterval)leeway
             repeat:(BOOL)repeat
              async:(BOOL)isAsync
             target:(id)target
           selector:(SEL)selector{
    
    
  return [DGTimer start:start interval:interval leeway:leeway repeat:repeat async:isAsync handleAction:^{
        
        if ([target respondsToSelector:selector]) {
    #pragma clang diagnostic push
    #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
             [target performSelector:selector];
    #pragma clang diagnostic pop
        }
    }];
}

/**
 取消任务
 
 @param taskName 任务名称 开始的时候大爷已经给你返回了
 */
+ (void)cancleTask:(NSString *)taskName{
    
    if (taskName.length == 0 || ![timer_dic.allKeys containsObject:taskName]) {
        return;
    }
    dispatch_semaphore_wait(gcd_semaphore, DISPATCH_TIME_FOREVER);
    
    dispatch_source_cancel(timer_dic[taskName]);
    [timer_dic removeObjectForKey:taskName];
    
    dispatch_semaphore_signal(gcd_semaphore);
}


@end
