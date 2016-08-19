//
//  YHPGetPhoneNumerTool.h
//  Demo
//
//  Created by liu David on 16/7/27.
//  Copyright © 2016年 Yan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YHPGetPhoneReturnNumerParameter,YHPRegisterGetPhoneNumerResult,YHPTestPhoneReturnNumberParamter;

@interface YHPRegisterTool : NSObject

/** 获取验证码 */
+ (void)getPhoneReturmNumberWithParam:(YHPGetPhoneReturnNumerParameter *)param success:(void (^)(YHPRegisterGetPhoneNumerResult *result))success failure:(void (^)(NSError *error))failure;
+ (void)registWithParam:(YHPTestPhoneReturnNumberParamter *)param success:(void (^)(YHPRegisterGetPhoneNumerResult *result))success failure:(void (^)(NSError *error))failure;


@end
