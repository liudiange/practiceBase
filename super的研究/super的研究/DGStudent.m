//
//  DGStudent.m
//  super的研究
//
//  Created by apple on 2018/8/7.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "DGStudent.h"

@implementation DGStudent

-(void)handleAction{
    [super handleAction];
}
struct objc_super {
    __unsafe_unretained _Nonnull id receiver;
    __unsafe_unretained _Nonnull Class super_class;
    
}

static void _I_DGStudent_handleAction(DGStudent * self, SEL _cmd)
{
    (
     objc_super {
        (id)self,
         DGPerson,
         
     }
        sel_registerName("handleAction")
     );


}


-(instancetype)init{
    if (self = [super init]) {
        
        NSLog(@"[self class] = %@",[self class]);
        NSLog(@"[self superclass] = %@",[self superclass]);
        
        NSLog(@"-------------------------");
        
        NSLog(@"[super class] = %@",[super class]);
        NSLog(@"[super superclass] = %@",[super superclass]);
    }
    return self;
}

@end
