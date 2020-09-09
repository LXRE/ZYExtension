//
//  NSDate+Category.m
//  TZImage
//
//  Created by yons on 2018/7/23.
//  Copyright © 2018年 zszc. All rights reserved.
//

#import "NSDate+Category.h"

@implementation NSDate (Category)

#pragma mark - 获取当前正确时区的0点时间(NSDate)
+ (NSDate *)getCurrentZeroDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    [formatter setDateFormat:@"yyyy/MM/dd"];
    NSDate *date = [formatter dateFromString:[formatter stringFromDate:[NSDate getCorrectWithDate:[NSDate date]]]];
    return date;
}

#pragma mark - 获取当前的时间
+(NSString*)getCurrentTimes{

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    NSDate *datenow = [NSDate date];
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    return currentTimeString;
}


#pragma mark - 获取当前时间的格式化字符串(NSString)
+ (NSString *)formatDate:(NSDate *)date format:(NSString *)format
{
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    dateformatter.dateFormat = format;
    return [dateformatter stringFromDate:date];
}

#pragma mark - 根据Date获取正确时区的系统时间(NSDate)
+ (NSDate *)getCorrectWithDate:(NSDate *)date
{
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:date];
    return [date dateByAddingTimeInterval:interval];
}

#pragma mark - 获取明天的某一个时刻
+ (NSDate *)getTomorrowDate:(NSDate *)date
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSCalendarUnit dayInfoUnits = NSCalendarUnitWeekday|NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay;
    NSDateComponents *components = [gregorian components:dayInfoUnits fromDate:date];
    NSInteger day = components.day;
    components.day = day + 1;
    components.hour = 0;
    NSDate *tomorrowDate = [gregorian dateFromComponents:components];
    return tomorrowDate;
}

#pragma mark - String转Date
+ (NSDate *)transformString:(NSString *)str
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    return [formatter dateFromString:str];
}

#pragma mark - Date转String
+ (NSString *)transformDate:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [formatter stringFromDate:date];
}

#pragma mark - Date转换为年月日
+ (NSString *)transformYMDDate:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy年MM月dd日"];
    return [formatter stringFromDate:date];
}

#pragma mark - 日期返回星期几
+ (NSString*)weekdayStringFromDate:(NSDate*)inputDate {
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"星期天", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", nil];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    [calendar setTimeZone: timeZone];
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    return [weekdays objectAtIndex:theComponents.weekday];
}

#pragma mark - 日期返回星期几(int)
+(NSInteger)weekdayIntFromDate:(NSDate*)inputDate {
    NSArray *weekdays = [NSArray arrayWithObjects: @"7", @"1", @"2", @"3", @"4", @"5", @"6", nil];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    [calendar setTimeZone: timeZone];
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    return [[weekdays objectAtIndex:theComponents.weekday] integerValue];
}

#pragma mark - 获取当前年月和前4个月
+ (NSArray *)getMonths5
{
    NSMutableArray *dates = [NSMutableArray array];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    [calendar setTimeZone: timeZone];
    NSDate *currentDate = [NSDate date];
    NSDateComponents* theComponents = [[NSDateComponents alloc] init];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy年MM月"];
    NSDate *theDate = [calendar dateByAddingComponents:theComponents toDate:currentDate options:0];
    NSString *dateStr = [formatter stringFromDate:theDate];
    [dates addObject:dateStr];
    for (int i = 1; i <= 4; i++) {
        [theComponents setMonth:-i];
        NSDate *theDate = [calendar dateByAddingComponents:theComponents toDate:currentDate options:0];
        NSString *dateStr = [formatter stringFromDate:theDate];
        [dates addObject:dateStr];
    }
    return dates;
}

#pragma mark - 加一天
+ (NSDate *)addOneDay:(NSDate *)date
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    [calendar setTimeZone: timeZone];
    NSDateComponents *theComponents = [[NSDateComponents alloc] init];
    [theComponents setDay:+1];
    NSDate *theDate = [calendar dateByAddingComponents:theComponents toDate:date options:0];
    return theDate;
}

#pragma mark - 比较时间早晚
+ (int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *oneDayStr = [dateFormatter stringFromDate:oneDay];
    NSString *anotherDayStr = [dateFormatter stringFromDate:anotherDay];
    NSDate *dateA = [dateFormatter dateFromString:oneDayStr];
    NSDate *dateB = [dateFormatter dateFromString:anotherDayStr];
    NSComparisonResult result = [dateA compare:dateB];
    if (result == NSOrderedDescending) {
        // oneDay比 anotherDay时间晚;
        return 1;
    }
    else if (result == NSOrderedAscending){
        // oneDay比 anotherDay时间早;
        return -1;
    }
    // 两者时间是同一个时间;
    return 0;
}

#pragma mark - 日期返回当前年
+ (NSString *)getYearFromDate:(NSDate *)date
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    [calendar setTimeZone: timeZone];
    NSDateComponents *theComponents = [[NSDateComponents alloc] init];
    NSDate *theDate = [calendar dateByAddingComponents:theComponents toDate:date options:0];
    NSString *YMDStr = [self transformYMDDate:theDate];
    NSArray *ymds = [YMDStr componentsSeparatedByString:@"-"];
    return ymds[0];
}

#pragma mark - 时间格式转换
+ (NSString *)convertStrToTime:(NSString *)time WithDateFormat:(NSString *)dateFormat {
    if ([time containsString:@"T"]) {
        time = [time stringByReplacingOccurrencesOfString:@"T" withString:@" "];
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    if ([time containsString:@"."]) {
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
    }else{
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    }
    NSDate *date = [formatter dateFromString:time];
    [formatter setDateFormat:dateFormat];
    return [formatter stringFromDate:date];
}
#pragma mark - 获取本月一号是星期几
+(NSInteger)getCuruntMonthIsIndex{
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-01"];
    NSString  *firstMonth=[formatter stringFromDate:date];
    NSDateFormatter *formatter1 = [[NSDateFormatter alloc] init];
    [formatter1 setDateFormat:@"yyyy-MM-dd"];
    NSDate *dates= [formatter1 dateFromString:firstMonth];
    NSDate *zsDate=[NSDate getCorrectWithDate:dates];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [calendar components:NSCalendarUnitWeekday fromDate:zsDate];
    return components.weekday;
}
#pragma mark - 获取当前年月 yyyy/MM
+(NSString*)getCuruntYearAndMonth{
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy/MM"];
    NSString  *cMonth=[formatter stringFromDate:date];
    return cMonth;
}

#pragma mark - 获取当前年月 yyyy/M
+(NSString*)getCuruntYearAndSmallMonth{
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy/M"];
    NSString  *cMonth=[formatter stringFromDate:date];
    return cMonth;
}

#pragma mark - 获取当前年月和前几个月
+ (NSArray *)getMonthsWith:(NSInteger)Num
{
    NSMutableArray *dates = [NSMutableArray array];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    [calendar setTimeZone: timeZone];
    NSDate *currentDate = [NSDate date];
    NSDateComponents* theComponents = [[NSDateComponents alloc] init];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy年MM月"];
    NSDate *theDate = [calendar dateByAddingComponents:theComponents toDate:currentDate options:0];
    NSString *dateStr = [formatter stringFromDate:theDate];
    [dates addObject:dateStr];
    for (int i = 1; i <= Num; i++) {
        [theComponents setMonth:-i];
        NSDate *theDate = [calendar dateByAddingComponents:theComponents toDate:currentDate options:0];
        NSString *dateStr = [formatter stringFromDate:theDate];
        [dates addObject:dateStr];
    }
    return dates;
}

#pragma mark - 获取指定年指定月的天数
+ (NSInteger)howManyDaysInThisMonth:(NSInteger)imonth withYear:(NSInteger)iyear{

    NSInteger year = iyear;

    if((imonth == 1)||(imonth == 3)||(imonth == 5)||(imonth == 7)||(imonth == 8)||(imonth == 10)||(imonth == 12)){
        return 31;
    }

    if((imonth == 4)||(imonth == 6)||(imonth == 9)||(imonth == 11)){
        return 30;
    }
    
    if((year%4 == 1)||(year%4 == 2)||(year%4 == 3)){
        return 28;
    }

    if(year%400 == 0){
        return 29;
    }
    
    if(year%100 == 0){
        return 28;
    }
    return 29;
}
//string转date
+(NSDate*)dateFromString:(NSString *)date DateFormat:(NSString *)format{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    return [formatter dateFromString:date];
}

+(NSString *)formateDate:(NSString *)dateString
{
    
    @try {
        
        // ------实例化一个NSDateFormatter对象
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];//这里的格式必须和DateString格式一致
        
        NSDate * nowDate = [NSDate date];

        // ------将需要转换的时间转换成 NSDate 对象
        NSDate * needFormatDate = [dateFormatter dateFromString:dateString];
        
        // ------取当前时间和转换时间两个日期对象的时间间隔
        NSTimeInterval time = [nowDate timeIntervalSinceDate:needFormatDate];

        NSLog(@"time----%f",time);
        // ------再然后，把间隔的秒数折算成天数和小时数：
        
        NSString *dateStr = [[NSString alloc] init];
        
        if (time<=60) {  //1分钟以内的
            
            dateStr = @"刚刚";
            
        }else if(time<=60*60){  //一个小时以内的
            
            int mins = time/60;
            dateStr = [NSString stringWithFormat:@"%d分钟前",mins];
            
        }else if(time<=60*60*24*2){  //在两天内的
            
            [dateFormatter setDateFormat:@"YYYY-MM-dd"];
            NSString * need_yMd = [dateFormatter stringFromDate:needFormatDate];
            NSString *now_yMd = [dateFormatter stringFromDate:nowDate];
            
            [dateFormatter setDateFormat:@"HH:mm"];
            if ([need_yMd isEqualToString:now_yMd]) {
                //在同一天
                dateStr = [NSString stringWithFormat:@"今天 %@",[dateFormatter stringFromDate:needFormatDate]];
            }else{
                //昨天
                dateStr = [NSString stringWithFormat:@"昨天 %@",[dateFormatter stringFromDate:needFormatDate]];
            }
        }else {
            
            [dateFormatter setDateFormat:@"yyyy"];
            NSString * yearStr = [dateFormatter stringFromDate:needFormatDate];
            NSString *nowYear = [dateFormatter stringFromDate:nowDate];
            
            if ([yearStr isEqualToString:nowYear]) {
                //在同一年
                [dateFormatter setDateFormat:@"MM月dd日"];
                dateStr = [dateFormatter stringFromDate:needFormatDate];
            }else{
                [dateFormatter setDateFormat:@"yyyy年MM月dd日"];
                dateStr = [dateFormatter stringFromDate:needFormatDate];
            }
        }
        
        return dateStr;
    }
    @catch (NSException *exception) {
        return @"";
    }
    
    
}

#pragma mark - 时间戳变为格式时间
+ (NSString *)ConvertStrCuoToTime:(NSString *)timeStr{
    long long time=[timeStr longLongValue] / 1000;
    //    如果服务器返回的是13位字符串，需要除以1000，否则显示不正确(13位其实代表的是毫秒，需要除以1000)
    //    long long time=[timeStr longLongValue] / 1000;

    NSDate *date = [[NSDate alloc]initWithTimeIntervalSince1970:time];

    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];

    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];

    NSString*timeString=[formatter stringFromDate:date];

    return timeString;
}
@end
