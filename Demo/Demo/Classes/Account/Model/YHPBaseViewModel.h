//
//  YHPBaseViewModel.h
//  Demo
//
//  Created by liu David on 16/7/27.
//  Copyright © 2016年 Yan. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum : NSUInteger {
    LoadTypeNew,
    LoadTypeMore,
    LoadTypeSearch
} LoadType;

@interface YHPBaseViewModel : NSObject

@property (nonatomic,strong)SuccessBlock successBlock;
@property (nonatomic,strong)FailureBlock failureBlock;
@property (nonatomic,strong)ErrorBlock errorBlock;

// 传入交互的Block块
-(void) setBlockWithSusscessBlock: (SuccessBlock) susscessBlock
                 WithFailureBlock: (FailureBlock) failureBlock
                   WithErrorBlock: (ErrorBlock) errorBlock;

@end
