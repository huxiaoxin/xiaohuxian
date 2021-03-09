//
//  encodetestModel.m
//  xiaohu_test
//
//  Created by codehzx on 2021/3/8.
//

#import "encodetestModel.h"
#import <objc/runtime.h>
@implementation encodetestModel
//归档
- (void)encodeWithCoder:(NSCoder *)coder{
    unsigned int count;
    Ivar  * vats =  class_copyIvarList([self class], &count);
    for (int index = 0; index < count; index ++) {
        Ivar var = vats[index];
        NSString * key = [NSString stringWithCString:ivar_getName(var) encoding:NSUTF8StringEncoding];
        [coder encodeObject:[self valueForKey:key] forKey:key];
    }
    
    /**
        获取变量，返回一个集合
     class_copyIvarList(<#Class  _Nullable __unsafe_unretained cls#>, <#unsigned int * _Nullable outCount#>)
      遍历拿到ivar对象
     //进而拿到ivar对象名称
     ivar_getName(<#Ivar  _Nonnull v#>)
       
     //然后进行序列化
     **/
    
   
    
}
//解挡
- (nullable instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super init]) {
        unsigned int count ;
        Ivar * vars = class_copyIvarList([self class], &count);
        
        for (int index = 0; index < count; index ++) {
            Ivar  var =   vars[index];
            NSString * key = [NSString  stringWithCString:ivar_getName(var) encoding:NSUTF8StringEncoding];
            [self setValue:[coder decodeObjectForKey:key] forKey:key];
        }
        
    }
    return self;
}
+ (BOOL)supportsSecureCoding{
    return YES;
}
@end
