//
//  ViewController.m
//  按位或枚举的实现方案
//
//  Created by apple on 2018/7/31.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ViewController.h"

typedef NS_ENUM(NSUInteger,DGTpye) {
    DGTpyeTwo   = 1<<0,
    DGTpyeThree = 1<<1,
    DGTpyeFour  = 1<<2
};

@interface ViewController ()



@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setDGType:DGTpyeThree|DGTpyeFour];
    
    
}
- (void)setDGType:(DGTpye)type{
    
    if (type&DGTpyeTwo) {
        NSLog(@"我是小 DGTpyeTwo");
    }
    
    if (type&DGTpyeThree) {
         NSLog(@"我是小 DGTpyeThree");
    }
    
    if (type&DGTpyeFour) {
        NSLog(@"我是小 DGTpyeFour");
    }
    
}

@end
