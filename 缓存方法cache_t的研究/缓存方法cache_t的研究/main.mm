//
//  main.m
//  缓存方法cache_t的研究
//
//  Created by apple on 2018/8/2.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DGPersonInfo.h"
#import "DGChinesePerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        DGChinesePerson *chinesePerson = [[DGChinesePerson alloc] init];
        DG_objc_class *chinesePersonStruct = (__bridge DG_objc_class *)[DGChinesePerson class];
        cache_t cacheMethods = chinesePersonStruct->cache;
        
        [chinesePerson DGChinesePersonTest];
        [chinesePerson DGYellowPersonTest];
      //  [chinesePerson personTest];
       
        
        NSLog(@"---------------");
//        bucket_t *bucketLists = cacheMethods._buckets;
//        for (int index = 0; index <= cacheMethods._mask; index++) {
//            bucket_t bucket = bucketLists[index];
//            NSLog(@"_key : %s --- _imp : %p",bucket._key,bucket._imp);
//        }
//        bucket_t testBucket = bucketLists[(long long)@selector(DGChinesePersonTest) & cacheMethods._mask];
//        NSLog(@"_key : %s --- _imp : %p",testBucket._key,testBucket._imp);
        
        IMP methodImp = cacheMethods.imp(@selector(DGChinesePersonTest));
        NSLog(@"methodImp -- %p",methodImp);
        
        NSLog(@"+++++++++++++");
        
    }
    return 0;
}
