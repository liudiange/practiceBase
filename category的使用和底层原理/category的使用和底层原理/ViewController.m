//
//  ViewController.m
//  category的使用和底层原理
//
//  Created by apple on 2018/7/6.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ViewController.h"
#import "DGPerson.h"
#import "DGPerson+test.h"

//struct _category_t {
//    const char *name;
//    struct _class_t *cls;
//    const struct _method_list_t *instance_methods;
//    const struct _method_list_t *class_methods;
//    const struct _protocol_list_t *protocols;
//    const struct _prop_list_t *properties;
//};

@interface ViewController ()



@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    DGPerson *person = [[DGPerson alloc] init];
    [person test];
    
    
}


@end
