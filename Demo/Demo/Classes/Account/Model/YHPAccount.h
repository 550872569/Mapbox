//
//  YHPAccount.h
//
//  Created by Yan on 16/2/1.
//  Copyright © 2016年 Yan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YHPAccount : NSObject

@property (nonatomic,copy)NSString *account;
@property (nonatomic,copy)NSString *nick_name;//昵称.
@property (nonatomic,copy)NSString *age;//年龄
@property (nonatomic,copy)NSString *password;//密码
@property (nonatomic,copy)NSString *cellphone;
@property (nonatomic,copy)NSString *avatar_uri;//头像
@property (nonatomic,copy)NSString *user_id;
@property (nonatomic,copy)NSString *gender;//性别..1男2女0保密
@property (nonatomic,copy)NSString *token;//系统内唯一标识.
@property (nonatomic,copy)NSString *rongcloudtoken;//荣云token
@property (nonatomic,copy)NSString *interests;//兴趣
@property (nonatomic,copy)NSString *signature;//签名.
@property (nonatomic,copy)NSString *rongcloud_user_id;
@property (nonatomic,copy)NSString *points;
@property (nonatomic,copy)NSString *showCircleAlert;
@property (nonatomic,strong)NSArray *photo;//相册
@property (nonatomic,strong)NSArray *image;//图片id
@property (nonatomic,copy)NSString *point;//积分
@property (nonatomic,copy)NSString *grade;//等级
@property (nonatomic,copy)NSString *rate;//用户的好评度 1-5
@property (nonatomic,copy)NSString *rate_count;//用户被评论的次数
@property (nonatomic,copy)NSString *repetmeNum;
@property (nonatomic,copy)NSString *messageNum;
@property (nonatomic,copy)NSString *appraiseNum;
@property (nonatomic,copy)NSString *community;//认证的小区
@property (nonatomic,copy)NSString *officebuilding;//认证的写字楼
@property (nonatomic,copy)NSString *school;//认证的学校
@property (nonatomic,copy)NSString *hometown;//认证的家乡
@property (nonatomic,copy)NSString *profession;//认证的职业
@property (nonatomic,copy)NSString *salary;//认证的薪资
@property (nonatomic,copy)NSString *qualification; //认证的资格证书
@property (nonatomic,copy)NSString *exist;//判断是否注册
@property (nonatomic,copy)NSString *lat;
@property (nonatomic,copy)NSString *lng;
@property (nonatomic,copy)NSString *auth;


@end
