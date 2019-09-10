//
//  NSString+QDMethod.m
//  QDINFI
//
//  Created by xiaobao on 2019/6/4.
//  Copyright © 2019 quantdo. All rights reserved.
//

#import "NSString+QDMethod.h"

@implementation NSString (QDMethod)


/**
 获取当前时间
 
 @return 时间格式 YYYY-MM-dd HH:mm:ss
 */
+(NSString *)getCurrentTime{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    //设置时区,这个对于时间的处理有时很重要
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    NSDate *datenow = [NSDate date];//现在时间
    return [formatter stringFromDate:datenow];
}

+(NSString *)getCurrentTime:(NSString *)format{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:format]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    //设置时区,这个对于时间的处理有时很重要
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    NSDate *datenow = [NSDate date];//现在时间
    return [formatter stringFromDate:datenow];
}

+(NSString *)timestampSwitchTime:(long)timestamp andFormatter:(NSString *)format{
    
    
    
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//
//    [formatter setDateStyle:NSDateFormatterMediumStyle];
//
//    [formatter setTimeStyle:NSDateFormatterShortStyle];
//
//    [formatter setDateFormat:format]; // （@"YYYY-MM-dd hh:mm:ss"）----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
//
//    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
//
//    [formatter setTimeZone:timeZone];
//
//    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timestamp];
//
//    NSLog(@"1296035591  = %@",confromTimesp);
//
//
//
//    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
//
    
    
    //NSLog(@"&&&&&&&confromTimespStr = : %@",confromTimespStr);
    
    
//    1561707587000
    
    double time =timestamp/1000;
    
    NSDate * myDate=[NSDate dateWithTimeIntervalSince1970:time];
    
    //设置时间格式
    
    NSDateFormatter * formatter=[[NSDateFormatter alloc]init];
    
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    
    //将时间转换为字符串
    
    NSString *timeStr=[formatter stringFromDate:myDate];
    
    
    
    
    
    return timeStr;
    
}

@end
