//
//  YHPAccount.h
//
//  Created by Yan on 16/2/1.
//  Copyright © 2016年 Yan. All rights reserved.
//


#import "YHPAccount.h"

@implementation YHPAccount
/**
 *  当从文件中解析出一个对象的时候调用
 *  在这个方法中写清楚：怎么解析文件中的数据
 */

- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        self.nick_name = [decoder decodeObjectForKey:@"nick_name"];
                self.age = [decoder decodeObjectForKey:@"age"];
                self.password = [decoder decodeObjectForKey:@"password"];
                self.user_id = [decoder decodeObjectForKey:@"user_id"];
                self.token = [decoder decodeObjectForKey:@"token"];
                self.avatar_uri = [decoder decodeObjectForKey:@"avatar_uri"];
                self.account = [decoder decodeObjectForKey:@"account"];
                self.rongcloud_user_id = [decoder decodeObjectForKey:@"rongcloud_user_id"];
                self.interests = [decoder decodeObjectForKey:@"interests"];
                self.signature = [decoder decodeObjectForKey:@"signature"];
                self.gender = [decoder decodeObjectForKey:@"gender"];
                self.cellphone = [decoder decodeObjectForKey:@"cellphone"];
                self.rongcloudtoken = [decoder decodeObjectForKey:@"rongcloudtoken"];
                self.showCircleAlert = [decoder decodeObjectForKey:@"showCircleAlert"];
                self.photo = [decoder decodeObjectForKey:@"photo"];
                self.image = [decoder decodeObjectForKey:@"image"];
                self.community = [decoder decodeObjectForKey:@"community"];
                self.officebuilding = [decoder decodeObjectForKey:@"officebuilding"];
                self.school = [decoder decodeObjectForKey:@"school"];
                self.hometown = [decoder decodeObjectForKey:@"hometown"];
                self.profession = [decoder decodeObjectForKey:@"profession"];
                self.salary = [decoder decodeObjectForKey:@"salary"];
                self.qualification = [decoder decodeObjectForKey:@"qualification"];
                self.point = [decoder decodeObjectForKey:@"point"];
                self.grade = [decoder decodeObjectForKey:@"grade"];
                self.rate = [decoder decodeObjectForKey:@"rate"];
                self.rate_count = [decoder decodeObjectForKey:@"rate_count"];
                self.messageNum = [decoder decodeObjectForKey:@"messageNum"];
                self.appraiseNum = [decoder decodeObjectForKey:@"appraiseNum"];
                self.repetmeNum = [decoder decodeObjectForKey:@"repetmeNum"];
                self.exist = [decoder decodeObjectForKey:@"exist"];
                self.lat = [decoder decodeObjectForKey:@"lat"];
                self.lng = [decoder decodeObjectForKey:@"lng"];
                self.auth = [decoder decodeObjectForKey:@"auth"];
    }
    return self;
}
/**
 *  将对象写入文件的时候调用
 *  在这个方法中写清楚：要存储哪些对象的哪些属性，以及怎样存储属性
 */

- (void)encoderWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.nick_name forKey:@"nick_name"];
    [encoder encodeObject:self.age forKey:@"age"];
    [encoder encodeObject:self.password forKey:@"password"];
    [encoder encodeObject:self.user_id forKey:@"user_id"];
    [encoder encodeObject:self.token forKey:@"token"];
    [encoder encodeObject:self.avatar_uri forKey:@"avatar_uri"];
    [encoder encodeObject:self.account forKey:@"account"];
    [encoder encodeObject:self.rongcloud_user_id forKey:@"rongcloud_user_id"];
    [encoder encodeObject:self.interests forKey:@"interests"];
    [encoder encodeObject:self.signature forKey:@"signature"];
    [encoder encodeObject:self.gender forKey:@"gender"];
    [encoder encodeObject:self.cellphone forKey:@"cellphone"];
    [encoder encodeObject:self.rongcloudtoken forKey:@"rongcloudtoken"];
    [encoder encodeObject:self.showCircleAlert forKey:@"showCircleAlert"];
    [encoder encodeObject:self.photo forKey:@"photo"];
    [encoder encodeObject:self.image forKey:@"image"];
    [encoder encodeObject:self.community forKey:@"community"];
    [encoder encodeObject:self.officebuilding forKey:@"officebuilding"];
    [encoder encodeObject:self.school forKey:@"school"];
    [encoder encodeObject:self.hometown forKey:@"hometown"];
    [encoder encodeObject:self.profession forKey:@"profession"];
    [encoder encodeObject:self.salary forKey:@"salary"];
    [encoder encodeObject:self.qualification forKey:@"qualification"];
    [encoder encodeObject:self.messageNum forKey:@"messageNum"];
    [encoder encodeObject:self.appraiseNum forKey:@"appraiseNum"];
    [encoder encodeObject:self.repetmeNum forKey:@"repetmeNum"];
    [encoder encodeObject:self.exist forKey:@"exist"];
    [encoder encodeObject:self.lat forKey:@"lat"];
    [encoder encodeObject:self.lng forKey:@"lng"];
    [encoder encodeObject:self.auth forKey:@"auth"];
}

@end
