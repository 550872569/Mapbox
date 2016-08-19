//
//  AppDelegate.m
//  Demo
//
//  Created by liu David on 16/7/25.
//  Copyright © 2016年 Yan. All rights reserved.
//

#import "AppDelegate.h"
@import Mapbox;
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self configWindowAndRootVC];
    [self AFNetworkStatus];
    [self setCancel];
//    [self configMapboxToken];
    [self configBugly];
    return YES;
}

- (void)configBugly {
    [Bugly startWithAppId:kBuglyAppID];
}
- (void)configMapboxToken {
    [MGLAccountManager setAccessToken:kMapBoxToken];
//    [MGLAccountManager setAccessToken:@"pk.eyJ1IjoiNTUwODcyNTY5IiwiYSI6ImNpcnJ4MmFtbjBodjBmYW02b2xta3Q1ZDIifQ.x-c93VEl_KMc1NcJbfquNA"];
}
/** 配置window + rootVC */
- (void)configWindowAndRootVC {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    self.window.rootViewController = [YHPStartViewController new];
    self.window.rootViewController = [YHPMapBoxViewController new];
    [self.window makeKeyAndVisible];
}
/** 网络监测 */
- (void)AFNetworkStatus{
    //1.创建网络监测者
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    /*枚举里面四个状态  分别对应 未知 无网络 数据 WiFi
     typedef NS_ENUM(NSInteger, AFNetworkReachabilityStatus) {
     AFNetworkReachabilityStatusUnknown          = -1,      未知
     AFNetworkReachabilityStatusNotReachable     = 0,       无网络
     AFNetworkReachabilityStatusReachableViaWWAN = 1,       蜂窝数据网络
     AFNetworkReachabilityStatusReachableViaWiFi = 2,       WiFi
     };
     */
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        //这里是监测到网络改变的block  可以写成switch方便
        //在里面可以随便写事件
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
//                NSLog(@"yhp log -------------------未知网络状态");
                break;
            case AFNetworkReachabilityStatusNotReachable:
//                NSLog(@"yhp log -------------------无网络");
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
//                NSLog(@"yhp log -------------------蜂窝数据网");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
//                NSLog(@"yhp log -------------------WiFi");
                break;
            default:
                break;
        }
    }] ;
    // 开始监控
    [manager startMonitoring];
}
/** 设置缓存策略 */
- (void)setCancel
{
    int cacheSizeMemory = 64*1024*1024; // 64MB
    int cacheSizeDisk = 256*1024*1024; // 256MB
    NSURLCache *sharedCache = [[NSURLCache alloc] initWithMemoryCapacity:cacheSizeMemory diskCapacity:cacheSizeDisk diskPath:@"nsurlcache"];
    [NSURLCache setSharedURLCache:sharedCache];
}

+ (AFSecurityPolicy*)customSecurityPolicy
{
    // /先导入证书
    NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"certificate" ofType:@"cer"];//证书的路径
    NSData *certData = [NSData dataWithContentsOfFile:cerPath];
    
    // AFSSLPinningModeCertificate 使用证书验证模式
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    
    // allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO
    // 如果是需要验证自建证书，需要设置为YES
    securityPolicy.allowInvalidCertificates = YES;
    
    //validatesDomainName 是否需要验证域名，默认为YES；
    //假如证书的域名与你请求的域名不一致，需把该项设置为NO；如设成NO的话，即服务器使用其他可信任机构颁发的证书，也可以建立连接，这个非常危险，建议打开。
    //置为NO，主要用于这种情况：客户端请求的是子域名，而证书上的是另外一个域名。因为SSL证书上的域名是独立的，假如证书上注册的域名是www.google.com，那么mail.google.com是无法验证通过的；当然，有钱可以注册通配符的域名*.google.com，但这个还是比较贵的。
    //如置为NO，建议自己添加对应域名的校验逻辑。
    securityPolicy.validatesDomainName = NO;
    
    
    securityPolicy.pinnedCertificates = @[certData];
    
    return securityPolicy;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
