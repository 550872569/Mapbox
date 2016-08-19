//
//  YHPLoginAccountPrama.h
//  Demo
//
//  Created by liu David on 16/7/27.
//  Copyright © 2016年 Yan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YHPLoginAccountParameter : NSObject

/*
 POST /user/register
 请求参数
 cellphone 手机号
 password 密码 判断密码 6-18 位
 sms_verification_code 验证码
 device_token 极光id
 返回参数
 { code: 1, data: { user_id: string }}
 */

@property (nonatomic, copy) NSString *cellphone;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, copy) NSString *sms_verification_code;
@property (nonatomic, copy) NSString *device_token;

@end
