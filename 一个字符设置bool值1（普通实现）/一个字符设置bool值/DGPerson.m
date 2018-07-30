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
    char _whiteRichBeautiful;
}

//  0000 0000
// &0000 0001
//  ------------------
//  0000 0001

@end
@implementation DGPerson
-(instancetype)init{
    if (self = [super init]) {
        _whiteRichBeautiful = 0b00000000;
    }
    return self;
    
}
-(void)setWhite:(BOOL)white{
    if (white) {
        _whiteRichBeautiful = _whiteRichBeautiful | WhiteMask;
    }else{
        _whiteRichBeautiful = _whiteRichBeautiful & (~WhiteMask);
    }
}
-(void)setRich:(BOOL)rich{
    if (rich) {
        _whiteRichBeautiful = _whiteRichBeautiful | RichMask;
    }else{
        _whiteRichBeautiful = _whiteRichBeautiful & (~RichMask);
    }
    
}
-(void)setBeautiful:(BOOL)beautiful{
    if (beautiful) {
        _whiteRichBeautiful = _whiteRichBeautiful | BeautifulMask;
    }else{
        _whiteRichBeautiful = _whiteRichBeautiful & (~BeautifulMask);
    }
}

-(BOOL)isWhite{
    
    return !!(_whiteRichBeautiful & WhiteMask);
}
-(BOOL)isRich{
    
    return !!(_whiteRichBeautiful & RichMask);
    
}
-(BOOL)isBeautiful{
    
    return !!(_whiteRichBeautiful & BeautifulMask);
    
}


@end
