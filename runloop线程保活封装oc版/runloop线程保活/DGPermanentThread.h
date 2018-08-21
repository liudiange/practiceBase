//
//  DGPermanentThread.h
//  runloop线程保活
//
//  Created by apple on 2018/8/21.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^threadBlock)(void);

@interface DGPermanentThread : NSObject
/**
 执行的事件

 @param action 事件响应
 */
-(void)executeAction:(threadBlock)action;
/**
 停止线程
 */
-(void)stop;


@end
