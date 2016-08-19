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
    
}

- (void)TestPhoneReturnNumberParam:(YHPTestPhoneReturnNumerParameter *)parameter {
    
}
- (void)TestPhoneReturnNumberWithSuccessBlock: (GetPhoneReturnNumberBlock) phoneReturnNumberSuccessBlock
                             WithFailureBlock: (FailureBlock) phoneReturnNumberFailureBlock
                               WithErrorBlock: (ErrorBlock) phoneReturnNumberErrorBlock {
    _phoneReturnNumberSuccessBlock = phoneReturnNumberSuccessBlock;
    _phoneReturnNumberFailureBlock = phoneReturnNumberFailureBlock;
    _phoneReturnNumberErrorBlock = phoneReturnNumberErrorBlock;
}
@end
