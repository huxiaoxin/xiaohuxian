//
//  MytestObjetc.m
//  xiaohu_test
//
//  Created by codehzx on 2021/3/8.
//

#import "MytestObjetc.h"
@interface MytestObjetc ()
@property(nonatomic,copy) NSString * sex;
@end
@implementation MytestObjetc
-(instancetype)init{
    if (self = [super init]) {
        
        self.sex = @"女";
    }
    return self;
}
-(void)encodeWithCoder:(NSCoder *)coder{
    [coder encodeObject:self.name forKey:@"name"];
    [coder encodeObject:self.age forKey:@"age"];

}
//jiema
- (nullable instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super init]) {
        self.age =  [coder decodeObjectForKey:@"age"];
        self.name = [coder decodeObjectForKey:@"name"];
    }
    return self;
   
}
+ (BOOL)supportsSecureCoding{
    return YES;
}
@end
