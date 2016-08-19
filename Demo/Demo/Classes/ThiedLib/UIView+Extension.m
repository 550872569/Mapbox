//  UIVieh+Extension.m
//  
//
//  Created by Yan on 16/6/30.
//  Copyright © 2016年 YY. All rights reserved.
//


#import "UIView+Extension.h"

@implementation UIView (Extension)

//创建setX 方法
-(void)setX:(CGFloat)x {
    CGRect rect = self.frame;
    rect.origin.x = x;
    self.frame = rect;
}

-(CGFloat)x {
    return self.frame.origin.x;
}

-(void)setY:(CGFloat)y {
    CGRect rect = self.frame;
    rect.origin.y = y;
    self.frame = rect;
}
-(CGFloat)y {
    return self.frame.origin.y;
}

-(void)setW:(CGFloat)w {
    CGRect rect = self.frame;
    rect.size.width = w;
    self.frame = rect;
}
-(CGFloat)w {
    return self.frame.size.width;
}

-(void)setH:(CGFloat)h {
    CGRect rect = self.frame;
    rect.size.height = h;
    self.frame = rect;
}
-(CGFloat)h {
    return self.frame.size.height;
}

+ (UIView *)viewWithBackgroundColor:(UIColor *)backgroundColor ract:(CGRect)ract {
    UIView *view = [[UIView alloc]initWithFrame:ract];
    view.backgroundColor = [UIColor clearColor];
    return view;
}
+(UIButton *)buttonWithTitle:(NSString *)title titleFont:(CGFloat)font titleColor:(UIColor *)titleColor image:(NSString *)image backgroundImage:(NSString *)backgroundImage backgroundColor:(UIColor *)backgroundColor  ract:(CGRect)ract {
    UIButton *button = [[UIButton alloc]init];
    [button setFrame:ract];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button setBackgroundColor:backgroundColor];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:backgroundImage] forState:UIControlStateNormal];
    return button;
}
+(UILabel *)labelWithTitle:(NSString *)title titleFont:(CGFloat)font backgroundColor:(UIColor *)backgroundColor textAlignment:(NSTextAlignment)textAlignment ract:(CGRect)ract numberOfLines:(NSInteger)numberOfLines {
    UILabel *label = [[UILabel alloc]init];
    [label setText:title];
    [label setFrame:ract];
    [label setTextAlignment:textAlignment];
    [label setBackgroundColor:backgroundColor];
    [label setNumberOfLines:numberOfLines];
    return label;
}
@end
