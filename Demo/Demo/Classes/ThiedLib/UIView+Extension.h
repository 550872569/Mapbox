//  UIView+Extension.h
//
//
//
//  Created by Yan on 16/6/30.
//  Copyright © 2016年 YY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

//有一个x 属性
@property (nonatomic , assign)CGFloat x;

@property (nonatomic , assign)CGFloat y;

@property (nonatomic , assign)CGFloat w;

@property (nonatomic , assign)CGFloat h;
/**
 *  自定义View
 *
 *  @param backgroundColor 背景色
 *  @param ract            frame
 *
 *  @return view
 */
+ (UIView *)viewWithBackgroundColor:(UIColor *)backgroundColor ract:(CGRect)ract;
/**
 *  自定义button
 *
 *  @param title           文字
 *  @param font            字体
 *  @param image           图片
 *  @param backgroundImage 背景图片
 *  @param backgroundColor 背景颜色
 *
 *  @return button
 */
+ (UIButton *)buttonWithTitle:(NSString *)title titleFont:(CGFloat)font titleColor:(UIColor *)titleColor image:(NSString *)image backgroundImage:(NSString *)backgroundImage backgroundColor:(UIColor *)backgroundColor  ract:(CGRect)ract;
/**
 *  自定义label
 *
 *  @param title           文字
 *  @param font            字体
 *  @param backgroundColor 背景颜色
 *
 *  @return label
 */
+ (UILabel *)labelWithTitle:(NSString *)title titleFont:(CGFloat)font backgroundColor:(UIColor *)backgroundColor;
@end
