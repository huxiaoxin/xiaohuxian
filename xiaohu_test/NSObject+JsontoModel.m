//
//  NSObject+JsontoModel.m
//  xiaohu_test
//
//  Created by codehzx on 2021/3/8.
//

#import "NSObject+JsontoModel.h"
#import <objc/runtime.h>
@implementation NSObject (JsontoModel)
-(void)initWithDic:(NSDictionary *)dic{
    NSMutableArray * keys = [NSMutableArray array];
    
//    unsigned int count;
//
//    objc_property_t * propertys =  class_copyPropertyList([self class], &count);
//    for (int index = 0 ; index < count; index++) {
//    objc_property_t property =  propertys[index];
//     NSString * key =   [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
//        [keys addObject:key];
//
//    }
//    for (NSString * key in keys) {
//        if ([dic valueForKey:key] == nil) nil;
//        [self setValue:[dic valueForKey:key] forKey:key];
//    }
    
    unsigned int count;
   objc_property_t  * propertys =   class_copyPropertyList([self class], &count);
    
    for (int index = 0; index < count; index++) {
        objc_property_t property =  propertys[index];

        NSString * key  =[NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        [keys addObject:key];
    }
    for (NSString * key in keys) {
        if ([dic valueForKey:key]== nil) continue;;
        [self setValue:[dic valueForKey:key] forKey:key];
    }
    
    //总结
    //1、class_copyPropertyList(<#Class  _Nullable __unsafe_unretained cls#>, <#unsigned int * _Nullable outCount#>)
    //2、   property_getName(<#objc_property_t  _Nonnull property#>)
    //3、setValue: forkey:
}
@end
