//
//  ViewController.m
//  runloop线程保活
//
//  Created by apple on 2018/8/20.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ViewController.h"
#import "DGPermanentThread.h"


@interface ViewController ()
@property (strong, nonatomic) DGPermanentThread *permanetThread;

@end
@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.permanetThread = [[DGPermanentThread alloc] init];
    [self.permanetThread executeAction:^{
        NSLog(@"老夫开始做事情了 : %@",[NSThread currentThread]);
    }];
   
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.permanetThread executeAction:^{
        NSLog(@"老夫开始做事情了 : %@",[NSThread currentThread]);
    }];
}
-(void)dealloc{
    NSLog(@"%s",__func__);
}
@end
