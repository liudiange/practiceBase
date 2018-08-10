//
//  DGPerson.h
//  dynmatic 和synchronized的区别
//
//  Created by apple on 2018/8/7.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DGPerson : NSObject
{
    int _age;
}
@property (assign, nonatomic) int age;

// 如果什么都不写 相当于他自动生成了set方法和get方法，并且生成相关的实现。还主动生成了下划线的成员变量如下：相当于默认的情况下使用了@synthesize age = _age; 这样写相当于自动生成了_age;
// 假如在方法的实现中写上 @dynamic age; 意味着不实现方法的他的set方法和get方法，也不会生成下划线的成员变量，但是方法还是能调用。

-(void)setAge:(int)age;
-(int)age;


@end
