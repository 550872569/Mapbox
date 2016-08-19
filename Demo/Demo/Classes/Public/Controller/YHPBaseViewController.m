//
//  YHPBaseViewController.m
//  Demo
//
//  Created by liu David on 16/7/26.
//  Copyright © 2016年 Yan. All rights reserved.
//

#import "YHPBaseViewController.h"

@interface YHPBaseViewController ()

@end

@implementation YHPBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configChildViewController];
}

- (void)configChildViewController {
    YHPHomeViewController *homeVC = [YHPHomeViewController new];
    YHPNewsViewController *newsVC = [YHPNewsViewController new];
    YHPDiscoverViewController *discoverVC = [YHPDiscoverViewController new];
    YHPMineViewController *mineVC = [YHPMineViewController new];
    [self setUpChildVC:homeVC image:[UIImage imageNamed:@"circle_tablebar"] selectedImage:[UIImage imageNamed:@"circle_tablebar_select"] title:@"Home"];
    [self setUpChildVC:newsVC image:[UIImage imageNamed:@"topic_tablebar"] selectedImage:[UIImage imageNamed:@"topic_tablebar_select"] title:@"News"];
    [self setUpChildVC:discoverVC image:[UIImage imageNamed:@"chat_tablebar"] selectedImage:[UIImage imageNamed:@"chat_tablebar_select"] title:@"Discover"];
    [self setUpChildVC:mineVC image:[UIImage imageNamed:@"mine_tablebar"] selectedImage:[UIImage imageNamed:@"mine_tablebar_select"] title:@"Mine"];
}
// 封装创建控制器方法
- (void)setUpChildVC:(UIViewController *)vc image:(UIImage *)image selectedImage:(UIImage *)selectdeImage title:(NSString *)title {
    vc.title = title;
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selectdeImage;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}
@end
