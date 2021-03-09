//
//  AppDelegate.m
//  xiaohu_test
//
//  Created by codehzx on 2021/3/7.
//

#import "AppDelegate.h"
#import "NSMutableDictionary+safeDic.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = [NSClassFromString(@"xiaohuHomeViewController") new];
    return YES;
}



@end
