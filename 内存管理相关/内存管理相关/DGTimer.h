//
//  DGTimer.h
//  内存管理相关
//
//  Created by apple on 2018/9/3.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DGTimer : NSObject

/**
 定时器的事件

 @param start 开始的时间
 @param interval 中间的间隔
 @param leeway 延时多少秒开始执行
 @param repeat 是否重复
 @param isAsync 是否在异步线程
 @param action 事件处理
 */
+ (NSString *)start:(NSTimeInterval)start
     interval:(NSTimeInterval)interval
       leeway:(NSTimeInterval)leeway
       repeat:(BOOL)repeat
        async:(BOOL)isAsync
 handleAction:(void (^)(void))action;

/**
 定时器的事件

 @param start 开始的时间
 @param interval 中间的间隔
 @param leeway 延时多少秒开始执行
 @param repeat 是否重复
 @param isAsync 是否在异步线程
 @param target 对象
 @param selector 时间的方法
 */
+ (NSString *)start:(NSTimeInterval)start
           interval:(NSTimeInterval)interval
             leeway:(NSTimeInterval)leeway
             repeat:(BOOL)repeat
              async:(BOOL)isAsync
             target:(id)target
           selector:(SEL)selector;
/**
 取消任务

 @param taskName 任务名称 开始的时候大爷已经给你返回了
 */
+ (void)cancleTask:(NSString *)taskName;

@end
