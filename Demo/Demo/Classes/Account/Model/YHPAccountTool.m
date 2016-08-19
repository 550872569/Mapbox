//
//  YHPAccount.h
//
//  Created by Yan on 16/2/1.
//  Copyright © 2016年 Yan. All rights reserved.
//


#import "YHPAccountTool.h"


@implementation YHPAccountTool
/**
 *  存储帐号
 */
+ (void)save:(YHPAccount *)account{
    // 归档
    [NSKeyedArchiver archiveRootObject:account toFile:YHPAccountFilepath];
}

/**
 *  读取帐号
 */
+ (YHPAccount *)account{
    // 读取帐号
    YHPAccount *account = [NSKeyedUnarchiver unarchiveObjectWithFile:YHPAccountFilepath];
    
    return account;
}

+ (void)saveGuideAccount:(YHPGuideAccount *)account
{
    // 归档
    [NSKeyedArchiver archiveRootObject:account toFile:YHPGuideAccountFilepath];
    
}

+ (YHPGuideAccount *)guideAccount
{
    // 读取帐号
    YHPGuideAccount *account = [NSKeyedUnarchiver unarchiveObjectWithFile:YHPGuideAccountFilepath];
    
    return account;
}


@end
