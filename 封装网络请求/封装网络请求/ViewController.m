//
//  ViewController.m
//  封装网络请求
//
//  Created by apple on 2018/7/18.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ViewController.h"
#import "TestHttpObject.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    [TestHttpObject obtainHomeMessageComplete:^(DGBaseHttpModel *httpModel) {
        
    }];
    
}


@end
