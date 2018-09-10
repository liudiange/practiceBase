//
//  ViewController.m
//  gcd的使用以及死锁问题
//
//  Created by apple on 2018/8/22.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ViewController.h"
#import <libkern/OSAtomic.h>
#import <os/lock.h>
#import <pthread.h>


@interface ViewController ()

@property (assign, nonatomic) NSInteger ticketsCount;
@property (assign, nonatomic) NSInteger beginMoney;

// 自旋锁
@property (assign, nonatomic) OSSpinLock lock;
@property (assign, nonatomic) os_unfair_lock unFairLock;
// 互斥锁
@property (assign, nonatomic) pthread_mutex_t mutexLock;
// 条件
@property (assign, nonatomic) pthread_cond_t condition;
// 数组
@property (strong, nonatomic) NSMutableArray *dataArray;
// 互斥锁 oc层面上的
@property (strong, nonatomic) NSLock *ocLock;
// 递归锁 oc层面上的
@property (strong, nonatomic) NSRecursiveLock *recursiveLock;
// 条件所 oc层面上的
@property (strong, nonatomic) NSCondition *conditionLock;
// 条件所 更加牛逼的条件所
@property (strong, nonatomic) NSConditionLock *fineConditionLock;
// 串行队列
@property (strong, nonatomic) dispatch_queue_t serialQueue;
// 信号量
@property (strong, nonatomic) dispatch_semaphore_t semaphore;
// 读写锁
@property (assign, nonatomic) pthread_rwlock_t rwlock;
// 栅栏的队列
@property (strong, nonatomic) dispatch_queue_t barrierQueue;

@end

@implementation ViewController
@synthesize name = _name;

-(void)setName:(NSString *)name{
    // 加锁
    _name = name;
    // 解锁
}
-(NSString *)name {
    // 加锁
    NSString *str = _name;
    // 解锁
    return str;
}



- (void)viewDidLoad {
    [super viewDidLoad];


    // 初始化自旋锁
//    self.lock = OS_SPINLOCK_INIT;
//    self.unFairLock = OS_UNFAIR_LOCK_INIT;
//    self.ticketsCount = 100;
//
//    [[[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil] start];
//    [[[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil] start];
//    [[[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil] start];
    
    
//    self.unFairLock = OS_UNFAIR_LOCK_INIT;
    
//    // 初始化互斥相关的 第一种创建方式
//    pthread_mutexattr_t attr;
//    pthread_mutexattr_init(&attr);
//    // 设置属性
//    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_DEFAULT);
//    // 初始化互斥锁
//    pthread_mutex_init(&_mutexLock, &attr);
//    // 销毁属性
//    pthread_mutexattr_destroy(&attr);
//    // c语言函数创建了就的销毁  干完事情了要销毁
////    pthread_mutex_destroy(&_mutexLock);
//
////    // 第二种创建方式 这种相当于创建了默认的方式
//    pthread_mutex_init(&_mutexLock, NULL);
//    // 销毁属性
//    pthread_mutexattr_destroy(&attr);
    // 干完事情了要销毁
//    pthread_mutex_destroy(&_mutexLock);
    
    
//    self.ticketsCount = 50;
//    [self testTickAction];
//    self.beginMoney = 100;
//    [self testMoney];
    
    
//    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_queue_t queue1 = dispatch_queue_create("queue1", DISPATCH_QUEUE_CONCURRENT);
   
//    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
//
//    dispatch_async(queue, ^{
//        NSLog(@"任务1");
//    });
//    dispatch_async(queue, ^{
//        NSLog(@"任务2");
//    });
//    dispatch_async(queue, ^{
//        NSLog(@"任务3");
//    });
//    // 暂停队列
//    dispatch_suspend(queue);
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        NSLog(@"--------------");
//        dispatch_async(queue, ^{
//            NSLog(@"任务4");
//        });
//        sleep(5.0);
//        NSLog(@"++++++++++++++");
//        dispatch_resume(queue);
//    });
//    dispatch_async(queue, ^{
//        NSLog(@"任务5");
//    });

    // 递归锁
//    pthread_mutexattr_t attr;
//    pthread_mutexattr_init(&attr);
//    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
//    pthread_mutex_init(&_mutexLock, &attr);
//    pthread_mutexattr_destroy(&attr);
//
//    [self recursiveTest];
    
    // 条件所相关
//    pthread_mutexattr_t attr;
//    pthread_mutexattr_init(&attr);
//    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_DEFAULT);
//    pthread_mutex_init(&_mutexLock, &attr);
//    pthread_mutexattr_destroy(&attr);
//    pthread_cond_init(&_condition, NULL);
//
//    self.dataArray = [NSMutableArray array];
//
//    [[[NSThread alloc] initWithTarget:self selector:@selector(__removrAction) object:nil] start];
//
//    [[[NSThread alloc] initWithTarget:self selector:@selector(__addAction) object:nil] start];
    
    
    // oc层面的互斥锁
//    self.ocLock = [[NSLock alloc] init];
//    self.ticketsCount = 50;
//    [self testTickAction];

    // oc层面的递归锁
//    self.recursiveLock = [[NSRecursiveLock alloc] init];
//    [self recursiveTest];
    
    // oc层面的条件所
//    self.conditionLock = [[NSCondition alloc] init];
//    [[[NSThread alloc] initWithTarget:self selector:@selector(__removrAction) object:nil] start];
//    [[[NSThread alloc] initWithTarget:self selector:@selector(__addAction) object:nil] start];

    // 更加牛逼的条件锁
//    self.fineConditionLock = [[NSConditionLock alloc] initWithCondition:0];
//    self.fineConditionLock = [[NSConditionLock alloc] init];
//
//    [[[NSThread alloc] initWithTarget:self selector:@selector(threeAction) object:nil] start];
//    [[[NSThread alloc] initWithTarget:self selector:@selector(twoAction) object:nil] start];
//    [[[NSThread alloc] initWithTarget:self selector:@selector(oneAction) object:nil] start];
    
    // 串行队列执行卖票
//    self.serialQueue = dispatch_queue_create("queue", DISPATCH_QUEUE_SERIAL);
//    self.ticketsCount = 50;
//    [self testTickAction];
    
    // 信号量卖票
//    self.semaphore = dispatch_semaphore_create(1);
//    self.ticketsCount = 50;
//    [self testTickAction];

    // @synchronized 线程同步
//    self.ticketsCount = 50;
//    [self testTickAction];
    
    // 读写锁
//    pthread_rwlock_init(&_rwlock, NULL);
//    dispatch_queue_t queue = dispatch_queue_create("name", DISPATCH_QUEUE_CONCURRENT);
//    for (NSInteger index = 0; index < 10; index ++) {
//        dispatch_async(queue, ^{
//            [self readAction];
//        });
//        dispatch_async(queue, ^{
//            [self writeAction];
//        });
//    }
    // 栅栏方法
    self.barrierQueue = dispatch_queue_create("name", DISPATCH_QUEUE_CONCURRENT);
    for (NSInteger index = 0; index < 10; index ++) {
        [self readAction];
        [self readAction];
        [self writeAction];
        [self writeAction];
    }
    
}
-(void)readAction{
    dispatch_async(self.barrierQueue, ^{
        sleep(1.0);
        NSLog(@"readAction");
    });
}
-(void)writeAction{
    dispatch_barrier_async(self.barrierQueue, ^{
        sleep(1.0);
        NSLog(@"writeAction");

    });
}

-(void)saleTicket{
    
//        OSSpinLockLock(&_lock);
//        NSInteger currentTickets = self.ticketsCount;
//        currentTickets --;
//        self.ticketsCount = currentTickets;
//        NSLog(@"当前剩余的票数为：%zd",currentTickets);
//        OSSpinLockUnlock(&_lock);
    
    
//        os_unfair_lock_lock(&_unFairLock);
//        NSInteger currentTickets = self.ticketsCount;
//        currentTickets --;
//        self.ticketsCount = currentTickets;
//        NSLog(@"当前剩余的票数为：%zd",currentTickets);
//        os_unfair_lock_unlock(&_unFairLock);
    
    //    if (os_unfair_lock_trylock(&_unFairLock)) {
    //        NSInteger currentTickets = self.ticketsCount;
    //        currentTickets --;
    //        self.ticketsCount = currentTickets;
    //        NSLog(@"当前剩余的票数为：%zd",currentTickets);
    //        os_unfair_lock_unlock(&_unFairLock);
    //    }
    
    //    pthread_mutex_lock(&_mutexLock);
    //    NSInteger currentTickets = self.ticketsCount;
    //    currentTickets --;
    //    self.ticketsCount = currentTickets;
    //    NSLog(@"当前剩余的票数为：%zd",currentTickets);
    //    pthread_mutex_unlock(&_mutexLock);

    // oc层面的互斥锁
//    [self.ocLock lock];
//    NSInteger currentTickets = self.ticketsCount;
//    currentTickets --;
//    self.ticketsCount = currentTickets;
//    NSLog(@"当前剩余的票数为：%zd",currentTickets);
//    [self.ocLock unlock];
    
    
    // 串行队列卖票
//    dispatch_sync(self.serialQueue, ^{
//        NSInteger currentTickets = self.ticketsCount;
//        currentTickets --;
//        self.ticketsCount = currentTickets;
//        NSLog(@"当前剩余的票数为：%zd",currentTickets);
//    });
    
    // 信号量卖票
//    dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
//    NSInteger currentTickets = self.ticketsCount;
//    currentTickets --;
//    self.ticketsCount = currentTickets;
//    NSLog(@"当前剩余的票数为：%zd",currentTickets);
//    dispatch_semaphore_signal(self.semaphore);

    //@synchronized 枷锁
    @synchronized(self){
        NSInteger currentTickets = self.ticketsCount;
        currentTickets --;
        self.ticketsCount = currentTickets;
        NSLog(@"当前剩余的票数为：%zd",currentTickets);
    }
}
-(void)testMoney{
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        
        for (NSInteger index = 0; index < 20; index++) {
            sleep(0.5);
            [self saveMoney];
        }
        
    });
    dispatch_async(queue, ^{
        
        for (NSInteger index = 0; index < 50; index++) {
            sleep(0.5);
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
        
        for (NSInteger index = 0; index < 10; index++) {
            [NSThread sleepForTimeInterval:0.5];
            [self saleTicket];
        }
        
    });
    dispatch_async(queue, ^{
        
        for (NSInteger index = 0; index < 20; index++) {
            [NSThread sleepForTimeInterval:0.5];
            [self saleTicket];
        }
        
    });
}
#pragma mark 其他方法
- (void)oneAction{
    NSLog(@"oneAction - begin");
    [self.fineConditionLock lock];
    NSLog(@"oneAction");
    [self.fineConditionLock unlockWithCondition:2];
    
}
- (void)twoAction{
    
    NSLog(@"twoAction - begin");
    [self.fineConditionLock lockWhenCondition:2];
    NSLog(@"twoAction");
    [self.fineConditionLock unlockWithCondition:3];
}
- (void)threeAction{
    
    NSLog(@"threeAction - begin");
    [self.fineConditionLock lockWhenCondition:3];
    NSLog(@"threeAction");
    [self.fineConditionLock unlock];
}
-(void)__removrAction{
    
//    pthread_mutex_lock(&_mutexLock);
//    NSLog(@"__removrAction - begin");
//    if (self.dataArray.count == 0) {
//        NSLog(@"等待");
//        pthread_cond_wait(&_condition, &_mutexLock);
//
//    }
//    [self.dataArray removeLastObject];
//    NSLog(@"__removrAction - end");
//    pthread_mutex_unlock(&_mutexLock);
    
    [self.conditionLock lock];
    NSLog(@"__removrAction - begin");
    if (self.dataArray.count == 0) {
        NSLog(@"等待");
        [self.conditionLock wait];
        
    }
    [self.dataArray removeLastObject];
    NSLog(@"__removrAction - end");
    [self.conditionLock unlock];
}
-(void)__addAction{
    
//    pthread_mutex_lock(&_mutexLock);
//    NSLog(@"__addAction - begin");
//    [self.dataArray addObject:@"asdasd"];
//    pthread_mutex_unlock(&_mutexLock);
//    // 发送一个信号
//    pthread_cond_signal(&_condition);
//    NSLog(@"__addAction - end");
//    // 给所有等待的发送信号 也叫广播
//    //    pthread_cond_broadcast(&_condition);
    
    [self.conditionLock lock];
    NSLog(@"__addAction - begin");
    [self.dataArray addObject:@"asdasd"];
    [self.conditionLock unlock];
    // 发送一个信号
    [self.conditionLock signal];
    NSLog(@"__addAction - end");
    // 给所有等待的发送信号 也叫广播
    //   [self.conditionLock broadcast];
}
/**
 递归的测试
 */
- (void)recursiveTest{
    
//    pthread_mutex_lock(&_mutexLock);
//    NSLog(@"哈哈哈哈哈");
//    [self recursiveTest];
//    pthread_mutex_unlock(&_mutexLock);
    
    [self.recursiveLock lock];
    NSLog(@"哈哈哈哈哈");
    [self recursiveTest];
    [self.recursiveLock unlock];
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
-(void)dealloc{
    
    pthread_mutex_destroy(&_mutexLock);
    pthread_cond_destroy(&_condition);
    pthread_rwlock_destroy(&_rwlock);
}


@end
