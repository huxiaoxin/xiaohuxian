//
//  NSMutableDictionary+safeDic.m
//  xiaohu_test
//
//  Created by codehzx on 2021/3/8.
//

#import "NSMutableDictionary+safeDic.h"
#import <objc/runtime.h>
@implementation NSMutableDictionary (safeDic)
+(void)load{
    Class o_class = objc_getClass("__NSDictionaryM");
    Method  method1  =  class_getInstanceMethod(o_class, @selector(setObject:forKey:));
    Method  method2 = class_getInstanceMethod(o_class, @selector(setSafeObject:forKey:));
    method_exchangeImplementations(method1, method2);
}
-(void)setSafeObject:(id)anObject forKey:(id<NSCopying>)aKey{
    if (anObject) {
//     NSLog(@"非空:%@",anObject);
    [self setSafeObject:anObject forKey:aKey];
    }else{
        NSLog(@"是空的：%@",aKey);
//    [self setSafeObject:anObject forKey:aKey];
    }
}
@end
