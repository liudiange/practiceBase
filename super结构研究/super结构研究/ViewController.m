//
//  ViewController.m
//  super结构研究
//
//  Created by apple on 2018/8/10.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ViewController.h"
#import "DGPerson.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    struct ss = {
        id self,
        [ViewController class]
    };
    objc_MegSendSuper(ss,sel_registerName("viewDidLoad"));
    
    id cls = [DGPerson class];
    
    void *obj = &cls;
    
    [(__bridge id)obj print];


    
    NSLog(@"---------------");
    
}


@end
