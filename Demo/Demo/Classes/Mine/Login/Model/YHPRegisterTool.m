//
//  YHPGetPhoneNumerTool.m
//  Demo
//
//  Created by liu David on 16/7/27.
//  Copyright © 2016年 Yan. All rights reserved.
//

#import "YHPRegisterTool.h"

@implementation YHPRegisterTool

+ (void)getPhoneReturmNumberWithParam:(YHPGetPhoneReturnNumerParameter *)param success:(void (^)(YHPRegisterGetPhoneNumerResult *))success failure:(void (^)(NSError *))failure {
    AFHTTPSessionManager * manger = [AFHTTPSessionManager manager];
    manger.requestSerializer = [AFHTTPRequestSerializer serializer];
    manger.responseSerializer = [AFJSONResponseSerializer serializer];
    manger.requestSerializer.timeoutInterval =15;
    NSString *url = [NSString stringWithFormat:@"%@/sms/verify",API_BASE_URL];
    NSMutableDictionary *parame = [NSMutableDictionary dictionary];

    parame[@"cellphone"]= param.cellphone;
    parame[@"type"] = param.type;

    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    [manger.requestSerializer setValue:version forHTTPHeaderField:@"X-Client-Version"];
    [manger.requestSerializer setValue:@"iOS-WWHS-REQUEST" forHTTPHeaderField:@"X-Requested-With"];
#ifdef DEBUG
    
#else
    //SSL加密
    [manger setSecurityPolicy:[AppDelegate customSecurityPolicy]];
#endif
    [manger POST:url parameters:parame progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"uploadProgress---------------%@",uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"yhp log responseObject-------------------%@",responseObject);
        YHPRegisterGetPhoneNumerResult *result = [YHPRegisterGetPhoneNumerResult objectWithKeyValues:responseObject];
        if (success && responseObject) {
            success(result);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"yhp log error-------------------%@",error);
        if (error) {
            failure(error);
        }
    }];
}

+ (void)registWithParam:(YHPTestPhoneReturnNumberParamter *)param success:(void (^)(YHPRegisterGetPhoneNumerResult *result))success failure:(void (^)(NSError *error))failure {
    
    AFHTTPSessionManager * manger = [AFHTTPSessionManager manager];
    manger.requestSerializer = [AFJSONRequestSerializer serializer];
    manger.responseSerializer = [AFJSONResponseSerializer serializer];
    manger.requestSerializer.timeoutInterval =15;
    NSMutableDictionary *parame = [NSMutableDictionary dictionary];
    NSString *url = [NSString stringWithFormat:@"%@/user/register",API_BASE_URL];
    parame[@"cellphone"]= param.cellphone;
    parame[@"sms_verification_code"] = param.sms_verification_code;
    parame[@"device_token"] = param.device_token;
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    [manger.requestSerializer setValue:version forHTTPHeaderField:@"X-Client-Version"];
    [manger.requestSerializer setValue:@"iOS-WWHS-REQUEST" forHTTPHeaderField:@"X-Requested-With"];
#ifdef DEBUG
    
#else
    //SSL加密
    [manger setSecurityPolicy:[AppDelegate customSecurityPolicy]];
#endif
    [manger POST:url parameters:parame progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"uploadProgress---------------%@",uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"yhp log responseObject-------------------%@",responseObject);
        YHPRegisterGetPhoneNumerResult *result = [YHPRegisterGetPhoneNumerResult objectWithKeyValues:responseObject];
        if (success && responseObject) {
            success(result);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"yhp log error-------------------%@",error);
        if (error) {
            failure(error);
        }
    }];

}
@end
