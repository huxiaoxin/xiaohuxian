//
//  UIImageView+tapimggesture.m
//  xiaohu_test
//
//  Created by codehzx on 2021/3/7.
//

#import "UIImageView+tapimggesture.h"
#import <objc/runtime.h>
@implementation UIImageView (tapimggesture)
-(void)setImgindexPath:(NSIndexPath *)imgindexPath{
    objc_setAssociatedObject(self, @selector(imgindexPath), imgindexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(NSIndexPath *)imgindexPath{
    return   objc_getAssociatedObject(self, _cmd);
}
-(void)imgViewHanlderWithgesture:(imgtapgesture)imgblobk{
    NSLog(@"图片封装的方法");
    objc_setAssociatedObject(self, @selector(imgTapgesture:), imgblobk, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    UITapGestureRecognizer * tap   = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imgTapgesture:)];
    [self addGestureRecognizer:tap];
    
}
-(void)imgTapgesture:(UITapGestureRecognizer *)tap{
    UIImageView * mtimg = (UIImageView *)[tap view];
    imgtapgesture  imgblockb  =  objc_getAssociatedObject(self, _cmd);
    imgblockb(mtimg);
}
@end
