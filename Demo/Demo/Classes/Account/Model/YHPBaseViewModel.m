//
//  YHPBaseViewModel.m
//  Demo
//
//  Created by liu David on 16/7/27.
//  Copyright © 2016年 Yan. All rights reserved.
//

#import "YHPBaseViewModel.h"

@implementation YHPBaseViewModel
-(void) setBlockWithSusscessBlock: (SuccessBlock) susscessBlock
                 WithFailureBlock: (FailureBlock) failureBlock
                   WithErrorBlock: (ErrorBlock) errorBlock
{
    _successBlock = susscessBlock;
    _failureBlock = failureBlock;
    _errorBlock = errorBlock;
}

@end
