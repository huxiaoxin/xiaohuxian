//
//  MytestObjetc.h
//  xiaohu_test
//
//  Created by codehzx on 2021/3/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MytestObjetc : NSObject<NSCoding,NSSecureCoding>
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString * age;
@end

NS_ASSUME_NONNULL_END
