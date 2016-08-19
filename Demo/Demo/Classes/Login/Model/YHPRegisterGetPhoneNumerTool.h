//
//  YHPGetPhoneNumerTool.h
//  Demo
//
//  Created by liu David on 16/7/27.
//  Copyright © 2016年 Yan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YHPGetPhoneReturnNumerParameter,YHPRegisterGetPhoneNumerResult;

@interface YHPRegisterGetPhoneNumerTool : NSObject

+ (void)getPhoneReturmNumberWithParam:(YHPRegisterGetPhoneNumerTool *)param success:(void (^)(YHPRegisterGetPhoneNumerResult *result))success failure:(void (^)(NSError *error))failure;

@end
