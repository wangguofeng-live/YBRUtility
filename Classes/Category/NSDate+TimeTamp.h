//
//  NSDate+TimeTamp.h
//  YBRenstore
//
//  Created by 黄滨斌 on 2017/11/28.
//  Copyright © 2017年 BDKJ_Hbb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (TimeTamp)

//获取当前日期
+ (NSString*)ybr_getCurrentDateStr;
///获取当前的时间
+(NSString*)ybr_getCurrentTimes;
///获取当前的时间(毫秒)
+(NSString*)ybr_getCurrentTimesInMS;
///获取当前时间戳有两种方法(以秒为单位)
+(NSString *)ybr_getNowTimeTimestampInS;

+(NSString *)ybr_getNowTimeTimestamp;

///获取当前时间戳  （以毫秒为单位）
+(NSString *)ybr_getNowTimeTimestampInMS;

@end
