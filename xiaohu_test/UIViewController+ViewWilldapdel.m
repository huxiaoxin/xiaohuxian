
//
//  UIViewController+ViewWilldapdel.m
//  xiaohu_test
//
//  Created by codehzx on 2021/3/8.
//

#import "UIViewController+ViewWilldapdel.h"
#import <objc/runtime.h>
@implementation UIViewController (ViewWilldapdel)
+(void)load{
//    Method  method_viewWillappear =  class_getInstanceMethod([self  class], @selector(viewWillAppear:));
//
//    Method method_hzxViewWillappear = class_getInstanceMethod([self class], @selector(hzx_ViewWillappear:));
//    method_exchangeImplementations(method_viewWillappear, method_hzxViewWillappear);
    
    Method method_viewdidload =  class_getInstanceMethod([self class], @selector(viewDidLoad));
    
    Method  method_hzxViewdidload  = class_getInstanceMethod([self class], @selector(hzx_ViewdidLoad));
    
    method_exchangeImplementations(method_viewdidload, method_hzxViewdidload);
    
}
-(void)hzx_ViewdidLoad{
   NSString * class_name =  NSStringFromClass([self class]);
    
    NSLog(@"%@",class_name);
    //此处调用的其实是系统的viewDidlaod方法
    [self hzx_ViewdidLoad];
}
//-(void)hzx_ViewWillappear:(BOOL)animate{
//
//   NSString  * className =  NSStringFromClass([self class]);
//    NSLog(@"类名：%@",className);
//    [self hzx_ViewWillappear:animate];
//}
@end
