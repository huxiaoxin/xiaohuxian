//
//  UIImageView+tapimggesture.h
//  xiaohu_test
//
//  Created by codehzx on 2021/3/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^imgtapgesture)(id object);
@interface UIImageView (tapimggesture)
@property(nonatomic,strong) NSIndexPath  * imgindexPath;
-(void)imgViewHanlderWithgesture:(imgtapgesture)imgblobk;
@end

NS_ASSUME_NONNULL_END
