//
//  AppDelegate.h
//  Demo
//
//  Created by liu David on 16/7/25.
//  Copyright © 2016年 Yan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YHPAccount.h"
#import "YHPBaseViewController.h"
#import "AFNetworking.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,strong) YHPBaseViewController *baseVC;
@property (nonatomic,strong) YHPAccount *account;
+ (AFSecurityPolicy *)customSecurityPolicy;
@end

