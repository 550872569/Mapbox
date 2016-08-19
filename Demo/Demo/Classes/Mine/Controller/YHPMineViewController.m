//
//  YHPMineViewController.m
//  Demo
//
//  Created by liu David on 16/7/26.
//  Copyright © 2016年 Yan. All rights reserved.
//

#import "YHPMineViewController.h"

@interface YHPMineViewController ()

@end

@implementation YHPMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLOR_RANDOM;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"yhp log -------------------YHPMineViewController");
}

@end
