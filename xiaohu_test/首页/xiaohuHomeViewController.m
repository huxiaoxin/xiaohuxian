//
//  xiaohuHomeViewController.m
//  xiaohu_test
//
//  Created by codehzx on 2021/3/8.
//

#import "xiaohuHomeViewController.h"
#import "NSObject+JsontoModel.h"
#import "MytestObjetc.h"
#import "encodetestModel.h"
@interface xiaohuHomeViewController ()

@end

@implementation xiaohuHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self testWithruntimeToDic];
    
    [self testWithruntimeTojsonModel];
    
    [self testWithRuntiemToprivateivar];
    
     /**
      什么是runtime？
      
      runtime底层是一套c语言的API，它能够让程序在运行的时候，去实施一系列的操作，正是因为如此oc这门语言拥有了动态的特色，oc所有的代码最终都会转化为runtime的代码，分为三个流程，大概经历了消息发送 消息解析 跟消息转发
      消息发送：会调用runtime的msgsendapid会传入一个实例对象跟SEL ,这个SEL就是方法名称，会去类里查处方法名，会先类的缓存列表查找，然后去分发列表查找，然后去父类查找，最终查到NSobject类
        然后会去解析这条消息，解析resolvemethodinstanceclass或者resolvemethodclass 返回YES消息已经处理 返回NO则会继续查找接收者，forwardingtargetselector 返回一个非空对象且对象实现了这个方法则直接处理否则继续去signaturetagertemetho，返回一个sinature 最终会调用消息的完整方法nsinvocation方法
      **/
    
    //给分类添加属性、以及事件，用到的是对象关联
    //    objc_setAssociatedObject(<#id  _Nonnull object#>, <#const void * _Nonnull key#>, <#id  _Nullable value#>, <#objc_AssociationPolicy policy#>)
    //    objc_getAssociatedObject(<#id  _Nonnull object#>, <#const void * _Nonnull key#>)
    //    objc_removeAssociatedObjects(<#id  _Nonnull object#>)

    //防止数组越界 字典非空 ,对于大型项目快速定位到哪个类名 用到是的方法交换
    //     method_exchangeImplementations(<#Method  _Nonnull m1#>, <#Method  _Nonnull m2#>)
//     Method meothid =  class_getMethodImplementation(<#Class  _Nullable __unsafe_unretained cls#>, <#SEL  _Nonnull name#>)
    
    //json-转model用
    //   class_copyPropertyList(<#Class  _Nullable __unsafe_unretained cls#>, <#unsigned int * _Nullable outCount#>)
    ////        property_getName(<#objc_property_t  _Nonnull property#>)
//     self setValue:<#(nullable id)#> forKey:<#(nonnull NSString *)#>

    //一键序列化
    //归档
//     class_copyIvarList(<#Class  _Nullable __unsafe_unretained cls#>, <#unsigned int * _Nullable outCount#>)
//      object_getIvar(<#id  _Nullable obj#>, <#Ivar  _Nonnull ivar#>)
        //        [coder encodeObject:[self valueForKey:key] forKey:key];

    
    
    /**
     json 字典 对象三者之间的区别
     1：json: 跟跨语言 序列化 反序列化有关，对数据类型有要求比如fuction类型无法支持，原因fuction不是一个跨语言支持的数据类型，不像字符串 布尔
        2：字典跟跨语言 序列化没有关系，他是一个通用的和排序无关的组织复杂数据结构的数据类型
     **/

    
    /**
     什么是 序列化？
     就是将数据写到硬盘中，以二进制的形式写入，
     反序列化
     就是从硬盘盘读取二进制文件，并转化为对象
     
     plist文件写入的数据都是些基本数据类型 ，比如：整形 布尔 字符串。数组 字典等 这些是不需要序列化
     
     **/
    
    
    
    
}
#pragma mark-利用runtime访问私有变量
-(void)testWithRuntiemToprivateivar{
    MytestObjetc * modl = [[MytestObjetc alloc]init];
   Ivar var =  class_getInstanceVariable([MytestObjetc class], "_sex");
    NSString * name =   object_getIvar(modl, var);
    NSLog(@"私有变量name=%@",name);
//    class_getInstanceVariable(MytestObjetc, "");
//     object_getIvar(modl, var)
}
 #pragma mark--利用runtime实现一键序列化
-(void)testwithruntimeToanurchierver{
    
    
}
 #pragma mark--runtime实现json转mdoel
-(void)testWithruntimeTojsonModel{
    MytestObjetc * ojetc =[[MytestObjetc alloc]init];
    [ojetc initWithDic:@{@"name":@"code_hzx",@"age":@"18"}];
    NSLog(@"name=%@ age=%@",ojetc.name,ojetc.age);
    NSDictionary  * dic = [NSDictionary dictionary];
    //序列化转化为二进制（序列化的对象必须实现NSSecureCoding协议，不然序列化失败iOS13才有的）
     NSData * data =   [NSKeyedArchiver archivedDataWithRootObject:ojetc requiringSecureCoding:YES error:nil];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"erjinzhi"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    //反序列化转为对象
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSData * data =   [[NSUserDefaults standardUserDefaults] objectForKey:@"erjinzhi"];
        MytestObjetc * objec =  [NSKeyedUnarchiver unarchivedObjectOfClass:[MytestObjetc class] fromData:data error:nil];
        NSLog(@"name=%@age=%@",objec.name,objec.age);
    });
    
}
#pragma mark--runtime分类添加方法交换（防止字典value为空导致crash）
-(void)testWithruntimeToDic{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    NSMutableDictionary * dics = [[NSMutableDictionary alloc]init];
    [dics setObject:nil forKey:@"test"];
    });

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
