//
//  DGPerson.h
//  一个字符设置bool值
//
//  Created by apple on 2018/7/30.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DGPerson : NSObject

//@property (assign, nonatomic) BOOL white;
//@property (assign, nonatomic) BOOL rich;
//@property (assign, nonatomic) BOOL beautiful;

-(void)setWhite:(BOOL)white;
-(void)setRich:(BOOL)rich;
-(void)setBeautiful:(BOOL)beautiful;

-(BOOL)isWhite;
-(BOOL)isRich;
-(BOOL)isBeautiful;




@end
