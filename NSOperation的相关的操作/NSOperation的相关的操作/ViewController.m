//
//  ViewController.m
//  NSOperation的相关的操作
//
//  Created by apple on 2018/8/28.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
  
}
- (void)queuePriority {
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    NSBlockOperation *block1 = [[NSBlockOperation alloc] init];
    block1.queuePriority = NSOperationQueuePriorityVeryLow;
    [block1 addExecutionBlock:^{
        NSLog(@"block1");
    }];
    NSBlockOperation *block2 = [[NSBlockOperation alloc] init];
    block2.queuePriority = NSOperationQueuePriorityHigh;
    [block2 addExecutionBlock:^{
        NSLog(@"block2");
    }];
    NSBlockOperation *block3 = [[NSBlockOperation alloc] init];
    block3.queuePriority = NSOperationQueuePriorityVeryHigh;
    [block3 addExecutionBlock:^{
        NSLog(@"block3");
    }];
    [block2 addDependency:block1];
    [queue addOperation:block1];
    [queue addOperation:block2];
    [queue addOperation:block3];
}
- (void)addDependency{
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    NSBlockOperation *blockOperation1 = [[NSBlockOperation alloc] init];
    [blockOperation1 addExecutionBlock:^{
        NSLog(@"blockOperation1");
    }];
    NSBlockOperation *blockOperation2 = [[NSBlockOperation alloc] init];
    [blockOperation2 addExecutionBlock:^{
        NSLog(@"blockOperation2");
    }];
    NSBlockOperation *blockOperation3 = [[NSBlockOperation alloc] init];
    [blockOperation3 addExecutionBlock:^{
        NSLog(@"blockOperation3");
    }];
    [blockOperation1 addDependency:blockOperation2];
    [blockOperation2 addDependency:blockOperation1];
    [blockOperation2 addDependency:blockOperation3];
    [queue addOperation:blockOperation2];
    [queue addOperation:blockOperation1];
    [queue addOperation:blockOperation3];
}
- (void)maxConcurrentOperationQueueCount{
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    queue.maxConcurrentOperationCount = 2;
    
    [queue addOperationWithBlock:^{
        for (NSInteger index = 0; index <= 2; index++) {
            sleep(2.0);
            NSLog(@"%@",[NSThread currentThread]);
        }
    }];
    [queue addOperationWithBlock:^{
        for (NSInteger index = 0; index <= 2; index++) {
            sleep(2.0);
            NSLog(@"%@",[NSThread currentThread]);
        }
    }];
    [queue addOperationWithBlock:^{
        for (NSInteger index = 0; index <= 2; index++) {
            sleep(2.0);
            NSLog(@"%@",[NSThread currentThread]);
        }
    }];
    [queue addOperationWithBlock:^{
        for (NSInteger index = 0; index <= 2; index++) {
            sleep(2.0);
            NSLog(@"%@",[NSThread currentThread]);
        }
    }];
}
- (void)operationQueue{
    
    // 基本操作
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperationWithBlock:^{
        NSLog(@"%@",[NSThread currentThread]);
    }];
    [queue addOperationWithBlock:^{
        NSLog(@"%@",[NSThread currentThread]);
    }];
    [queue addOperationWithBlock:^{
        NSLog(@"%@",[NSThread currentThread]);
    }];
    // 线程间通信
    NSOperationQueue *queue1 = [[NSOperationQueue alloc] init];
    [queue1 addOperationWithBlock:^{
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            NSLog(@"%@",[NSThread currentThread]);
        }];
    }];
    
}
- (void)addOperatopn1{
    NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
    NSBlockOperation *blcokOperation1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"%@",[NSThread currentThread]);
    }];
    [blcokOperation1 addExecutionBlock:^{
        NSLog(@"%@",[NSThread currentThread]);
    }];
    [blcokOperation1 addExecutionBlock:^{
        NSLog(@"%@",[NSThread currentThread]);
    }];
    [blcokOperation1 addExecutionBlock:^{
        NSLog(@"%@",[NSThread currentThread]);
    }];
    [mainQueue addOperation:blcokOperation1];
}
- (void)addOperation{
    NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
    NSInvocationOperation *invocationOperation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(test) object:nil];
    [mainQueue addOperation:invocationOperation];
}
- (void)creatOperationQueue{
    
    NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
    
    NSOperationQueue *globalQueue = [[NSOperationQueue alloc] init];
    
}
- (void)blockOperation2{
    NSBlockOperation *blcokOperation1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"%@",[NSThread currentThread]);
    }];
    [blcokOperation1 addExecutionBlock:^{
        NSLog(@"%@",[NSThread currentThread]);
    }];
    [blcokOperation1 addExecutionBlock:^{
        NSLog(@"%@",[NSThread currentThread]);
    }];
    [blcokOperation1 addExecutionBlock:^{
        NSLog(@"%@",[NSThread currentThread]);
    }];
    
    [blcokOperation1 start];
}
- (void)blockOperation1{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        NSBlockOperation *blcokOperation1 = [NSBlockOperation blockOperationWithBlock:^{
            NSLog(@"%@",[NSThread currentThread]);
        }];
        [blcokOperation1 start];
        NSBlockOperation *blcokOperation2 = [NSBlockOperation blockOperationWithBlock:^{
            NSLog(@"%@",[NSThread currentThread]);
        }];
        [blcokOperation2 start];
        
    });
}
- (void)operationAction{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(test) object:nil];
        [operation start];
    });
}
- (void)test{
    NSLog(@"%@",[NSThread currentThread]);
    
}

@end
