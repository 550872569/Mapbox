//
//  YHPAccount.h
//
//  Created by Yan on 16/2/1.
//  Copyright © 2016年 Yan. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "YHPAccount.h"
#import "YHPGuideAccount.h"

@interface YHPAccountTool : NSObject
/**
 *  存储帐号
 */
+ (void)save:(YHPAccount *)account;
/**
 *  读取帐号
 */
+ (YHPAccount *)account;

+ (void)saveGuideAccount:(YHPGuideAccount *)account;
+ (YHPGuideAccount *)guideAccount;
@end
