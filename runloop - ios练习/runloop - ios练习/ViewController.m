//
//  ViewController.m
//  runloop - ios练习
//
//  Created by apple on 2018/8/16.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    NSRunLoop *mainRun = [NSRunLoop mainRunLoop];
//    NSRunLoop *currentRun = [NSRunLoop currentRunLoop];
//
//
//    CFRunLoopRef mainRunRef = CFRunLoopGetMain();
//    CFRunLoopRef currentRunRef = CFRunLoopGetCurrent();
//
//    NSLog(@"%p %p ==== %p %p",mainRun,currentRun,mainRunRef,currentRunRef);
//    NSLog(@"------------------------------------------------");
//    NSLog(@"mainRun ==== %@",mainRun);
    

    // 创建观察对象
    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        
        switch (activity) {
            case kCFRunLoopEntry:
            {
                CFRunLoopMode mode = CFRunLoopCopyCurrentMode(CFRunLoopGetCurrent());
                NSLog(@"kCFRunLoopEntry %@",mode);
                CFRelease(mode);
                break;
            }
            case kCFRunLoopExit:
            {

                CFRunLoopMode mode = CFRunLoopCopyCurrentMode(CFRunLoopGetCurrent());
                NSLog(@"kCFRunLoopExit %@",mode);
                CFRelease(mode);
                break;

            }
//            case kCFRunLoopBeforeSources:
//                NSLog(@"kCFRunLoopBeforeSources");
//                break;
//            case kCFRunLoopBeforeTimers:
//                NSLog(@"kCFRunLoopBeforeTimers");
//                break;
//            case kCFRunLoopBeforeWaiting:
//                NSLog(@"kCFRunLoopBeforeWaiting");
//                break;
//            case kCFRunLoopAfterWaiting:
//                NSLog(@"kCFRunLoopAfterWaiting");
//                break;
//            case kCFRunLoopAllActivities:
//                {
//                    NSLog(@"kCFRunLoopAllActivities");
//                    break;
//                }
            default:
            {
                break;
            }
        }
    });
   //  kCFRunLoopCommonModes == kCFRunLoopDefaultMode(没有滚动事件的处理) + UITrackingRunLoopMode(滚动时候的情形)
    CFRunLoopAddObserver(CFRunLoopGetMain(), observer, kCFRunLoopCommonModes);
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSLog(@"========================================");
}















@end
