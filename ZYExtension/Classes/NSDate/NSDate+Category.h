//
//  NSDate+Category.h
//  TZImage
//
//  Created by yons on 2018/7/23.
//  Copyright © 2018年 zszc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Category)

/// 获取当前正确时区的0点时间(NSDate)
+ (NSDate *)getCurrentZeroDate;
/// 获取当前的时间
+ (NSString *)getCurrentTimes;
/// 格式化时间
/// @param date 时间
/// @param format 格式化字符串
+ (NSString *)formatDate:(NSDate *)date format:(NSString *)format;
/// 根据Date获取正确时区的系统时间(NSDate)
/// @param date 时间
+ (NSDate *)getCorrectWithDate:(NSDate *)date;
/// 获取时间的下一天
/// @param date 时间
+ (NSDate *)getTomorrowDate:(NSDate *)date;
/// String转Date(格式为yyyy/MM/dd HH:mm:ss)
/// @param str 时间字符串
+ (NSDate *)transformString:(NSString *)str;
/// Date转String（格式：yyyy年MM月dd日）
/// @param date 时间
+ (NSString *)transformDate:(NSDate *)date;
/// Date转string（格式：yyyy-MM-dd）
/// @param str 时间
+ (NSString *)transformYMDDate:(NSDate *)str;
/// 日期返回星期几 中文 如 星期一
/// @param inputDate 时间
+ (NSString*)weekdayStringFromDate:(NSDate*)inputDate;
/// 日期返回星期几(int)
/// @param inputDate 时间
+ (NSInteger)weekdayIntFromDate:(NSDate*)inputDate;
/// 获取当前年月和前4个月
+ (NSArray *)getMonths5;
/// 时间加上一天
/// @param date 时间
+ (NSDate *)addOneDay:(NSDate *)date;
/// 比较时间早晚 1 oneDay 比时间晚 0 时间相同 -1 anotherDay晚
/// @param oneDay 时间1
/// @param anotherDay 时间2
+ (int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay;
/// 日期返回当前年
/// @param date 日期
+ (NSString *)getYearFromDate:(NSDate *)date;
/// 时间格式转换
/// @param time 时间
/// @param dateFormat 时间格式字符串
+ (NSString *)convertStrToTime:(NSString *)time WithDateFormat:(NSString *)dateFormat;
/// 获取本月一号是星期几
+(NSInteger)getCuruntMonthIsIndex;
/// 获取当前年月 yyyy/MM
+(NSString*)getCuruntYearAndMonth;
/// 获取当前年月 yyyy/M
+(NSString*)getCuruntYearAndSmallMonth;
/// 获取当前年月和前几个月
/// @param Num 月数
+(NSArray *)getMonthsWith:(NSInteger)Num;
/// 获取指定年指定月的天数
/// @param imonth 月
/// @param iyear 年
+ (NSInteger)howManyDaysInThisMonth:(NSInteger)imonth withYear:(NSInteger)iyear;
/// 指定序列化时间
/// @param date 时间
/// @param format 格式
+(NSDate*)dateFromString:(NSString *)date DateFormat:(NSString *)format;

/// 1）1分钟以内 显示 : 刚刚
///2）1小时以内 显示 : X分钟前
///3）今天或者昨天 显示 : 今天 09:30 昨天 09:30
///今年 显示 : 09-12
///大于本年 显示 : 2013-09-09
/// @param dateString 时间 （格式：yyyy-MM-dd HH:mm:ss）
+(NSString *)formateDate:(NSString *)dateString;
/// 时间戳变为格式时间（格式：yyyy-MM-dd HH:mm:ss）
/// @param timeStr 时间戳
+ (NSString *)ConvertStrCuoToTime:(NSString *)timeStr;

@end
