//
//  YHPGetPhoneReturnNumberViewModel.h
//  Demo
//
//  Created by liu David on 16/7/27.
//  Copyright © 2016年 Yan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YHPGetPhoneReturnNumerParameter,YHPTestPhoneReturnNumberParamter;
typedef void(^GetPhoneReturnNumberBlock)(id success);

@interface YHPGetPhoneReturnNumberViewModel : YHPBaseViewModel


@property (nonatomic,strong)GetPhoneReturnNumberBlock  phoneReturnNumberSuccessBlock;
@property (nonatomic,strong)FailureBlock  phoneReturnNumberFailureBlock;
@property (nonatomic,strong)ErrorBlock  phoneReturnNumberErrorBlock;

- (void)GetPhoneReturnNumberParam:(YHPGetPhoneReturnNumerParameter *)parameter;

- (void)TestPhoneReturnNumberParam:(YHPTestPhoneReturnNumberParamter *)parameter;

- (void)TestPhoneReturnNumberWithSuccessBlock: (GetPhoneReturnNumberBlock) phoneReturnNumberSuccessBlock
                             WithFailureBlock: (FailureBlock) phoneReturnNumberFailureBlock
                               WithErrorBlock: (ErrorBlock) phoneReturnNumberErrorBlock;
@end
