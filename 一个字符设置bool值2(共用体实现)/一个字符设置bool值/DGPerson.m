//
//  DGPerson.m
//  一个字符设置bool值
//
//  Created by apple on 2018/7/30.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "DGPerson.h"


@interface DGPerson()
{
    struct{
        char white : 1; // 设置位域
        char rich : 1;
        char beautiful : 1;
        
    }_whiteRichBeautiful;
}

//  0000 0000
// &0000 0001
//  ------------------
//  0000 0001

@end
@implementation DGPerson
-(void)setWhite:(BOOL)white{
    _whiteRichBeautiful.white = white;
}
-(void)setRich:(BOOL)rich{
    _whiteRichBeautiful.rich = rich;
    
}
-(void)setBeautiful:(BOOL)beautiful{
    _whiteRichBeautiful.beautiful = beautiful;
}

-(BOOL)isWhite{
    
    return !!_whiteRichBeautiful.white;
}
-(BOOL)isRich{
    
    return !!_whiteRichBeautiful.rich;
    
}
-(BOOL)isBeautiful{
    
    return !!_whiteRichBeautiful.beautiful;
    
}


@end
