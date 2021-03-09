//
//  MyTableViewCell.h
//  xiaohu_test
//
//  Created by codehzx on 2021/3/7.
//

#import <UIKit/UIKit.h>
#import "UIButton+mybtn.h"
#import "UIImageView+tapimggesture.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyTableViewCell : UITableViewCell
@property(nonatomic,strong) UIButton * btn;
@property(nonatomic,strong) UIImageView * myimgIcon;
@end

NS_ASSUME_NONNULL_END
