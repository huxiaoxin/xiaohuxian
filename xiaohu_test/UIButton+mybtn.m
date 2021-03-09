//
//  UIButton+mybtn.m
//  xiaohu_test
//
//  Created by codehzx on 2021/3/7.
//

#import "UIButton+mybtn.h"
#import <objc/runtime.h>
@implementation UIButton (mybtn)
-(void)setIndexpaht:(NSIndexPath *)indexpaht{
    objc_setAssociatedObject(self, @selector(indexpaht), indexpaht, OBJC_ASSOCIATION_RETAIN);
}
-(NSIndexPath *)indexpaht{
    return objc_getAssociatedObject(self, _cmd);
}
-(void)handlebtnAction:(btnActionBlock)btnblock{
    NSLog(@"按钮封装的方法");
    objc_setAssociatedObject(self, @selector(btnClicks:), btnblock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self
             action:@selector(btnClicks:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)btnClicks:(UIButton * )btn{
    btnActionBlock block = objc_getAssociatedObject(self, _cmd);
    block(btn);
}
@end
