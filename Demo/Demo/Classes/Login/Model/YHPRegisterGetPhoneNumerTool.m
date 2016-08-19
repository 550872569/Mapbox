//
//  YHPGetPhoneNumerTool.m
//  Demo
//
//  Created by liu David on 16/7/27.
//  Copyright © 2016年 Yan. All rights reserved.
//

#import "YHPRegisterGetPhoneNumerTool.h"

@implementation YHPRegisterGetPhoneNumerTool

+ (void)getPhoneReturmNumberWithParam:(YHPRegisterGetPhoneNumerParamter *)param success:(void (^)(YHPRegisterGetPhoneNumerResult *))success failure:(void (^)(NSError *))failure {
    AFHTTPSessionManager * manger = [AFHTTPSessionManager manager];
    manger.requestSerializer = [AFJSONRequestSerializer serializer];
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
#ifdef IOS_DEBUG
    
#else
    //SSL加密
    [manger setSecurityPolicy:[AppDelegate customSecurityPolicy]];
#endif
    
    [manger POST:url parameters:param progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"uploadProgress---------------%@",uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"yhp log responseObject-------------------%@",responseObject);
        
        YHPRegisterGetPhoneNumerResult *result = [YHPRegisterGetPhoneNumerResult new];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"yhp log error-------------------%@",error);
    }];
//    [manger POST:url parameters:parame success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        //  NSLog(@"返回验证码:%@",responseObject);
//        
//        VGRegisterGetPhoneBackNumResult *result = [VGRegisterGetPhoneBackNumResult objectWithKeyValues:responseObject];
//        
//        if (success && responseObject) {
//            success(result);
//        }
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        if (error) {
//            failure(error);
//        }
//    }];

}
@end
