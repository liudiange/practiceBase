//
//  ViewController.m
//  gcd的使用以及死锁问题
//
//  Created by apple on 2018/8/22.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    
    
    
}
/**
 不会产生死锁
 */
- (void)acation5{
    NSLog(@"task 1");
    //  创建一个串行队列
    dispatch_queue_t queue = dispatch_queue_create("myQueue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        NSLog(@"task 2");
        dispatch_sync(queue, ^{
            NSLog(@"task 3");
        });
        NSLog(@"task 4");
    });
    NSLog(@"task 5");
    
    
}
/**
 不产生死锁
 */
- (void)action4{
    NSLog(@"task 1");
    //  创建一个串行队列
    dispatch_queue_t queue = dispatch_queue_create("myQueue", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t queue1 = dispatch_queue_create("myQueue1", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        NSLog(@"task 2");
        dispatch_sync(queue1, ^{
            NSLog(@"task 3");
        });
        NSLog(@"task 4");
    });
    NSLog(@"task 5");
}
/**
 产生死锁了。
 */
- (void)action3{
    NSLog(@"task 1");
    //  创建一个串行队列
    dispatch_queue_t queue = dispatch_queue_create("myQueue", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        NSLog(@"task 2");
        dispatch_sync(queue, ^{
            NSLog(@"task 3");
        });
        NSLog(@"task 4");
    });
    NSLog(@"task 5");
}
/**
 不产生死锁，因为
 */
- (void)action2{
    
    NSLog(@"task 1");
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_async(queue, ^{
        NSLog(@"task 2");
    });
    NSLog(@"task 3");
}
/**
 产生死锁了 这种情况
 */
- (void)action1{
    NSLog(@"task 1");
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_sync(queue, ^{
        NSLog(@"task 2");
    });
    NSLog(@"task 3");
    
}

/**
 异步执行
 */
- (void)asyncAction{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        NSLog(@"任务1");
    });
    dispatch_async(queue, ^{
        NSLog(@"任务2");
    });
    
    dispatch_async(queue, ^{
        
        NSLog(@"任务3");
        
    });
}
/**
 同步执行
 */
- (void)syncAction{
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_sync(queue, ^{
        NSLog(@"任务1");
    });
    dispatch_sync(queue, ^{
        NSLog(@"任务2");
    });
    dispatch_sync(queue, ^{
        NSLog(@"任务3");
    });
}

@end
