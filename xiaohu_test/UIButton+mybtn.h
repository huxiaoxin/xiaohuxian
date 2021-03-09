//
//  UIButton+mybtn.h
//  xiaohu_test
//
//  Created by codehzx on 2021/3/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^btnActionBlock)(id sender);
@interface UIButton (mybtn)
@property(nonatomic,strong) NSIndexPath * indexpaht;
-(void)handlebtnAction:(btnActionBlock)btnblock;
@end

NS_ASSUME_NONNULL_END
