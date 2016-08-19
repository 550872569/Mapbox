//
//  YHPGetPhoneReturnNumberViewModel.m
//  Demo
//
//  Created by liu David on 16/7/27.
//  Copyright © 2016年 Yan. All rights reserved.
//

#import "YHPGetPhoneReturnNumberViewModel.h"

@implementation YHPGetPhoneReturnNumberViewModel

- (void)GetPhoneReturnNumberParam:(YHPGetPhoneReturnNumerParameter *)parameter {
    
    [YHPRegisterTool getPhoneReturmNumberWithParam:parameter success:^(YHPRegisterGetPhoneNumerResult *result) {
        if ([result.code isEqualToString:@"1"]) {
            self.successBlock(result);
        } else {
            self.failureBlock(result);
        }
    } failure:^(NSError *error) {
        if (error) {
            self.errorBlock(error);
        }
    }];
}

- (void)TestPhoneReturnNumberParam:(YHPTestPhoneReturnNumberParamter *)parameter {
    
    [YHPRegisterTool registWithParam:parameter success:^(YHPRegisterGetPhoneNumerResult *result) {
        if ([result.code isEqualToString:@"1"]) {
            self.successBlock(result);
        } else {
            self.failureBlock(result);
        }
    } failure:^(NSError *error) {
        if (error) {
            self.errorBlock(error);
        }
    }];
}
- (void)TestPhoneReturnNumberWithSuccessBlock: (GetPhoneReturnNumberBlock) phoneReturnNumberSuccessBlock
                             WithFailureBlock: (FailureBlock) phoneReturnNumberFailureBlock
                               WithErrorBlock: (ErrorBlock) phoneReturnNumberErrorBlock {
    _phoneReturnNumberSuccessBlock = phoneReturnNumberSuccessBlock;
    _phoneReturnNumberFailureBlock = phoneReturnNumberFailureBlock;
    _phoneReturnNumberErrorBlock = phoneReturnNumberErrorBlock;
}
@end
