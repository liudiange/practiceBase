//
//  DGPerson.m
//  autoreleasePool的研究
//
//  Created by apple on 2018/9/10.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "DGPerson.h"

@implementation DGPerson
-(void)dealloc{
    
    NSLog(@"%s",__func__);
    [super dealloc];
    
}
@end
