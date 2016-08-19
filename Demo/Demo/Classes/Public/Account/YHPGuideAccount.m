//
//  YHPAccount.h
//
//  Created by Yan on 16/2/1.
//  Copyright © 2016年 Yan. All rights reserved.
//

#import "YHPGuideAccount.h"

@implementation YHPGuideAccount


/**
 *  当从文件中解析出一个对象的时候调用
 *  在这个方法中写清楚：怎么解析文件中的数据
 */
- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {
        self.guideNumber = [decoder decodeObjectForKey:@"guideNumber"];
    }
    return self;
}

/**
 *  将对象写入文件的时候调用
 *  在这个方法中写清楚：要存储哪些对象的哪些属性，以及怎样存储属性
 */
- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.guideNumber forKey:@"guideNumber"];
}


@end
