//
//  DGPerson.m
//  一个字符设置bool值
//
//  Created by apple on 2018/7/30.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "DGPerson.h"

#define WhiteMask       (1<<2)
#define RichMask        (1<<1)
#define BeautifulMask   (1<<0)
@interface DGPerson()
{
    union{
        char bits;
        /** 这个结构体可写可不写 ，写上为了增加可读性**/
        struct{
            char white : 1; // 设置位域
            char rich : 1;
            char beautiful : 1;
        };
    }_whiteRichBeautiful;
}

//  0000 0000
// &0000 0001
//  ------------------
//  0000 0001

@end
@implementation DGPerson
-(void)setWhite:(BOOL)white{
    if (white) {
        _whiteRichBeautiful.bits |= WhiteMask;
    }else{
        _whiteRichBeautiful.bits &= ~WhiteMask;
    }
}
-(void)setRich:(BOOL)rich{
    if (rich) {
        _whiteRichBeautiful.bits |= RichMask;
    }else{
        _whiteRichBeautiful.bits &= ~RichMask;
    }
    
}
-(void)setBeautiful:(BOOL)beautiful{
    if (beautiful) {
        _whiteRichBeautiful.bits |= BeautifulMask;
    }else{
        _whiteRichBeautiful.bits &= ~BeautifulMask;
    }
}

-(BOOL)isWhite{
    
    return !!(_whiteRichBeautiful.bits & WhiteMask);
}
-(BOOL)isRich{
    
    return !!(_whiteRichBeautiful.bits & RichMask);
    
}
-(BOOL)isBeautiful{
    
    return !!(_whiteRichBeautiful.bits & BeautifulMask);
    
}


@end
