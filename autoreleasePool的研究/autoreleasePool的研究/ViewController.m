//
//  ViewController.m
//  autoreleasePool的研究
//
//  Created by apple on 2018/9/10.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ViewController.h"
#import "DGPerson.h"

@interface ViewController ()

@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s",__func__);
    DGPerson *person = [[[DGPerson alloc] init] autorelease];
    NSLog(@"++++++++++++ %@",[NSRunLoop currentRunLoop]);
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"%s",__func__);
    
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"%s",__func__);
}
@end
