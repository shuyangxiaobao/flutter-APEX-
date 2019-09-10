//
//  NSString+QDMethod.h
//  QDINFI
//
//  Created by xiaobao on 2019/6/4.
//  Copyright © 2019 quantdo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (QDMethod)


/**
 获取当前时间

 @return 时间格式 YYYY-MM-dd HH:mm:ss
 */
+(NSString *)getCurrentTime;

+(NSString *)getCurrentTime:(NSString *)format;

+(NSString *)timestampSwitchTime:(long)timestamp andFormatter:(NSString *)format;
@end

NS_ASSUME_NONNULL_END
