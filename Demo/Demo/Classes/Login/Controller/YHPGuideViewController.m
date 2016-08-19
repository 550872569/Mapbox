//
//  YHPGuideViewController.m
//  Demo
//
//  Created by liu David on 16/7/26.
//  Copyright © 2016年 Yan. All rights reserved.
//

#import "YHPGuideViewController.h"

@interface YHPGuideViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@end

@implementation YHPGuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = COLOR_RANDOM;
    [self configGuideView];
}
- (void)configGuideView {
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * 3, SCREEN_HEIGHT);
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.bounces = NO;
    //通过循环给滚动视图添加图片
    for (int i = 0; i < 3; i++) {
        UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * i, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        iv.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.png",i + 1]];
        iv.userInteractionEnabled = YES;
        [_scrollView addSubview:iv];
        if (i == 2) {
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 3.5/ 12, (667- 90) * SCREEN_HEIGHT / 667, SCREEN_WIDTH  * 5 / 12, 60  *SCREEN_HEIGHT / 667)];
            button.layer.cornerRadius = 6;
            button.layer.borderColor = RGB(252, 65, 44).CGColor;
            button.layer.borderWidth = 1;
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button setTitle:@"开始体验" forState:UIControlStateNormal];
            button.titleLabel.adjustsFontSizeToFitWidth = YES;
            [button setTitleColor:RGB(252, 65, 44) forState:UIControlStateNormal];
            [button addTarget:self action:@selector(toJumpToLoginVC:) forControlEvents:UIControlEventTouchUpInside];
            button.userInteractionEnabled = YES;
            [iv addSubview:button];
        }
    }
    [self.view addSubview:_scrollView];
    //初始化轮播页码控件
    _pageControl=[[UIPageControl alloc]init];
    //设置轮播页码的位置
    _pageControl.numberOfPages= 3;
    _pageControl.frame=CGRectMake(0,self.view.frame.size.height-30, self.view.frame.size.width, 30);
    _pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    _pageControl.pageIndicatorTintColor = [UIColor grayColor];
    [self.view addSubview:_pageControl];
}
#pragma mark - scrollViewDelegate
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self updatePageControl];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self updatePageControl];
}
- (void)updatePageControl {
    NSInteger index = contentOffSet_x/frame_width;
    _pageControl.currentPage=index;
}
- (void)toJumpToLoginVC:(id)sender {
    [_scrollView removeFromSuperview];
    UIWindow * window = kAppDelegate.window;
    window.rootViewController = [YHPLoginAccountViewController new];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"yhp log -------------------YHPGuideViewController");
}
@end
