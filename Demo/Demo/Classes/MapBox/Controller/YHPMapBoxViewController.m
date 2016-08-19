//
//  YHPMapBoxViewController.m
//  Demo
//
//  Created by YY on 16/8/14.
//  Copyright © 2016年 Yan. All rights reserved.
//

#import "YHPMapBoxViewController.h"
@import Mapbox;

@interface YHPMapBoxViewController () {
    UIButton *_buttonSimple;
    UIButton *_buttonDefault;
    UIButton *_buttonCustom;
    UIView *_viewBack;
}

@end
@implementation YHPMapBoxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    [self configMapBoxView];
//    [self configChildView];
//    [self crashDemo];
}
- (void)crashDemo {
    NSLog(@"self%@",self);
    NSArray * array = @[@"1"];
    NSLog(@"array%@",array[1]);
}

- (void)configChildView {
    CGRect ractView = CGRectMake(10, 100, SCREEN_WIDTH*0.4, SCREEN_WIDTH*0.2*3);
    _viewBack = [UIView viewWithBackgroundColor:[UIColor clearColor] ract:ractView];
    [self.view addSubview:_viewBack];
    [self.view bringSubviewToFront:_viewBack];
    CGRect ractSimple = CGRectMake(10, 100, SCREEN_WIDTH*0.4, SCREEN_WIDTH*0.2);
    _buttonSimple = [UIButton buttonWithTitle:@"MapStayle-Stayle" titleFont:17 titleColor:[UIColor redColor] image:nil backgroundImage:nil backgroundColor:[UIColor clearColor] ract:ractSimple];
    [_viewBack addSubview:_buttonSimple];
    [_buttonSimple addTarget:self action:@selector(confiMapboxViewSimple) forControlEvents:UIControlEventTouchUpInside];
    
    CGRect ractCustom = CGRectMake(10, _buttonSimple.y+_buttonSimple.h, SCREEN_WIDTH*0.4, SCREEN_WIDTH*0.2);
    _buttonCustom = [UIButton buttonWithTitle:@"MapStayle-Custom" titleFont:17 titleColor:[UIColor redColor] image:nil backgroundImage:nil backgroundColor:[UIColor clearColor] ract:ractCustom];
    [_buttonCustom addTarget:self action:@selector(confiMapboxViewSimple) forControlEvents:UIControlEventTouchUpInside];
    [_viewBack addSubview:_buttonCustom];
    
    CGRect ractDefault = CGRectMake(10, _buttonCustom.y+_buttonCustom.h, SCREEN_WIDTH*0.4, SCREEN_WIDTH*0.2);
    _buttonDefault = [UIButton buttonWithTitle:@"MapStayle-Custom" titleFont:17 titleColor:[UIColor redColor] image:nil backgroundImage:nil backgroundColor:[UIColor clearColor] ract:ractDefault];
    [_buttonDefault addTarget:self action:@selector(confiMapboxViewSimple) forControlEvents:UIControlEventTouchUpInside];
    [_viewBack addSubview:_buttonDefault];
}
- (void)configMapBoxView {
    
}
- (void)confiMapboxViewSimple {
    MGLMapView *mapView = [[MGLMapView alloc] initWithFrame:self.view.bounds];
    mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    // Set the map’s center coordinate and zoom level.
    [mapView setCenterCoordinate:CLLocationCoordinate2DMake(59.31, 18.06)
                       zoomLevel:9
                        animated:NO];
    [self.view addSubview:mapView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"self%@",self);
}
@end
