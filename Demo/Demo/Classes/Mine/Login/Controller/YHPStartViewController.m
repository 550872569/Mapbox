//
//  YHPStartViewController.m
//  Demo
//
//  Created by liu David on 16/7/26.
//  Copyright © 2016年 Yan. All rights reserved.
//

#import "YHPStartViewController.h"

@interface YHPStartViewController ()
@property (nonatomic, strong) YHPBaseViewController *baseVC;
@end

@implementation YHPStartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLOR_RANDOM;
    [self changeRootVC];
}
/** 切换跟控制器 */
- (void)changeRootVC {
    UIWindow * window = [[UIApplication sharedApplication].delegate window];
    YHPAccount * account = [YHPAccountTool account];
    /** 如果用户不存在 注册 */
    if (!account.user_id) {
        YHPGuideAccount *guide = [YHPAccountTool guideAccount];
        /** 第一次启动 进入引导页 */
        if (!guide) {
            window.rootViewController = [[YHPGuideViewController alloc] init];
        }else{
        /** !第一次启动 进入登录页 */
            window.rootViewController = [[YHPLoginViewController alloc] init];
        }
        return;
    /** 如果用户存在 */
    } else {
        if ([account.exist isEqualToString:@"3"]) {
            /** 如果用户存在 并且 已登录 */
            AppDelegate *Appdelegate =  (AppDelegate *)[UIApplication sharedApplication].delegate;
            Appdelegate.account = account;
            //直接进入 主界面
            _baseVC =[[YHPBaseViewController alloc] init];
            Appdelegate.baseVC = _baseVC;
            window.rootViewController = _baseVC;
        }else{
            /** 如果用户存在 未登录 */
            window.rootViewController = [[YHPLoginViewController alloc] init];
        }
    }
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"yhp log -------------------YHPStartViewController");
}
@end
