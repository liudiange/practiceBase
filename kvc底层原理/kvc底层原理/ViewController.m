//
//  ViewController.m
//  kvc底层原理
//
//  Created by apple on 2018/7/6.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ViewController.h"
#import "DGPerson.h"


@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    DGPerson *person = [[DGPerson alloc] init];
//    person->_age = 10;
//    person ->_isAge = 30;
    [person setValue:@10 forKey:@"age"];
    
    NSLog(@"%@",[person valueForKey:@"age"]);
    
    
}


@end
