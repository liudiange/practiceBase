//
//  ViewController.m
//  gcd的使用以及死锁问题
//
//  Created by apple on 2018/8/22.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ViewController.h"
#import <libkern/OSAtomic.h>


@interface ViewController ()

@property (assign, nonatomic) NSInteger ticketsCount;
@property (assign, nonatomic) NSInteger beginMoney;
@property (assign, nonatomic) OSSpinLock lock;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.ticketsCount = 100;
    [self testTickAction];
//    self.beginMoney = 100;
//    [self testMoney];

}

-(void)testMoney{
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        
        for (NSInteger index = 0; index < 20; index++) {
            [NSThread sleepForTimeInterval:0.5];
            [self saveMoney];
        }
        
    });
    dispatch_async(queue, ^{
        
        for (NSInteger index = 0; index < 50; index++) {
            [NSThread sleepForTimeInterval:0.5];
            [self takeMoney];
        }
    });
}

-(void)saveMoney{
    
    NSInteger currentMoney = self.beginMoney;
    currentMoney ++;
    self.beginMoney = currentMoney;
    NSLog(@"当前人民币为：%zd",currentMoney);
    
}
-(void)takeMoney{
    NSInteger currentMoney = self.beginMoney;
    currentMoney --;
    self.beginMoney = currentMoney;
    NSLog(@"当前人民币为：%zd",currentMoney);
}

-(void)testTickAction{
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
       
        for (NSInteger index = 0; index < 20; index++) {
            [NSThread sleepForTimeInterval:0.5];
            [self saleTicket];
        }
        
    });
    dispatch_async(queue, ^{
        
        for (NSInteger index = 0; index < 50; index++) {
            [NSThread sleepForTimeInterval:0.5];
            [self saleTicket];
        }
        
    });
    dispatch_async(queue, ^{
        
        for (NSInteger index = 0; index < 30; index++) {
            [NSThread sleepForTimeInterval:0.5];
            [self saleTicket];
        }
        
    });
}
-(void)saleTicket{
    
    OSSpinLockLock(&_lock);
    NSInteger currentTickets = self.ticketsCount;
    currentTickets --;
    self.ticketsCount = currentTickets;
    NSLog(@"当前剩余的票数为：%zd",currentTickets);
    OSSpinLockUnlock(&_lock);
    
}




-(void)task7{
    
    dispatch_semaphore_t semphore = dispatch_semaphore_create(2);
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        dispatch_semaphore_wait(semphore, DISPATCH_TIME_FOREVER);
        NSLog(@"任务1");
        // 增减信号量 相当于信号总量加1
        dispatch_semaphore_signal(semphore);
        NSLog(@"任务1执行完毕");
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        dispatch_semaphore_wait(semphore, DISPATCH_TIME_FOREVER);
        NSLog(@"任务2");
        // 增减信号量 相当于信号总量加1
        dispatch_semaphore_signal(semphore);
        NSLog(@"任务2执行完毕");
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        dispatch_semaphore_wait(semphore, DISPATCH_TIME_FOREVER);
        NSLog(@"任务3");
        // 增减信号量 相当于信号总量加1
        dispatch_semaphore_signal(semphore);
        NSLog(@"任务3执行完毕");
    });

}
- (void)task6{
    dispatch_semaphore_t semphore = dispatch_semaphore_create(0);
    __block int countNumber = 0;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (int index = 0 ; index < 100; index ++) {
            countNumber ++;
        }
        // 增减信号量 相当于信号总量加1
        dispatch_semaphore_signal(semphore);
    });
    dispatch_semaphore_wait(semphore, DISPATCH_TIME_FOREVER);
    NSLog(@"countNumber == :%d",countNumber);
}
- (void)task5{
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_group_enter(group);
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:3.0];
        NSLog(@"任务1");
        dispatch_group_leave(group);
    });
    
    dispatch_group_enter(group);
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:6.0];
        NSLog(@"任务2");
        dispatch_group_leave(group);
    });
    
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    NSLog(@"已经完成了");
}
- (void)task4{
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_group_enter(group);
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:3.0];
        NSLog(@"任务1");
        dispatch_group_leave(group);
    });
    
    dispatch_group_enter(group);
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:3.0];
        NSLog(@"任务2");
        dispatch_group_leave(group);
    });
    
    dispatch_group_notify(group, queue, ^{
        NSLog(@"已经完成了奥");
    });
}
- (void)task3{
    NSArray *array = @[@"a", @"b", @"c", @"d", @"e", @"f", @"g", @"h", @"i", @"j"];
    //    dispatch_queue_t queue =  dispatch_get_global_queue(0, 0);
    dispatch_queue_t queue =  dispatch_queue_create("myqyeye", DISPATCH_QUEUE_SERIAL);
    dispatch_apply([array count],queue, ^(size_t index) {
        NSLog(@"%@ --- %zd",array[index],index);
    });
}
- (void)task2{
    // 1. 串行队列
    dispatch_queue_t queue1 = dispatch_queue_create("myQueue1", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue1, ^{
        NSLog(@"任务1");
        [NSThread sleepForTimeInterval:3.0];
        NSLog(@"任务1");
    });
    dispatch_async(queue1, ^{
        NSLog(@"任务2");
        [NSThread sleepForTimeInterval:3.0];
        NSLog(@"任务2");
    });
    dispatch_barrier_sync(queue1, ^{
        NSLog(@"任务3");
        [NSThread sleepForTimeInterval:3.0];
        NSLog(@"任务3");
    });
    dispatch_async(queue1, ^{
        NSLog(@"任务4");
        [NSThread sleepForTimeInterval:3.0];
        NSLog(@"任务4");
    });
    dispatch_async(queue1, ^{
        NSLog(@"任务5");
        [NSThread sleepForTimeInterval:3.0];
        NSLog(@"任务5");
    });
    
}
- (void)task1{
    // 1. 串行队列
    dispatch_queue_t queue1 = dispatch_queue_create("myQueue1", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(queue1, ^{
        NSLog(@"任务1");
        [NSThread sleepForTimeInterval:3.0];
        NSLog(@"任务1");
    });
    dispatch_async(queue1, ^{
        NSLog(@"任务2");
        [NSThread sleepForTimeInterval:3.0];
        NSLog(@"任务2");
    });
    dispatch_async(queue1, ^{
        NSLog(@"任务3");
        [NSThread sleepForTimeInterval:3.0];
        NSLog(@"任务3");
    });
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
