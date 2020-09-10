//
//  NSString+BXExtension.h
//  Demo
//
//  Created by ZZY on 18/8/08.
//  Copyright © 2018年 baobeikeji. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Category)
///BOOL 验证手机号是否正确(void)
- (BOOL(^)(void))IsPhoneNumber;

/// BOOL 验证邮箱是否正确(void)
- (BOOL(^)(void))IsEmailAdress;

/// BOOL 验证身份证是否正确(void)
- (BOOL(^)(void))IsIdentityCard;

/// BOOL验证银行卡是否正确(void)
- (BOOL(^)(void))IsBankCard;

/// 根据身份证返回岁数
- (NSString *(^)(void))ageFromIDCard;

/// 根据身份证返回生日
- (NSString *(^)(void))birthdayFromIDCard;

/// 根据身份证返回性别
- (NSString*(^)(void))sexFromIDCard;

/// 返回隐藏了的电话号码
- (NSString *(^)(void))phoneHiddenPartlyWords;

/// 返回两个时间段间隔
/// @param start 开始时间
/// @param end 结束时间
+(NSString *)stringIntervalFrom:(NSDate *)start to:(NSDate *)end;

/// 返回字符串所占用的尺寸
/// @param font 字体大小
/// @param maxSize 最大尺寸
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

/// 获取字符串首字母(传入汉字字符串, 返回大写拼音首字母)
/// @param aString 汉字字符串
+ (NSString *)getFirstLetterFromString:(NSString *)aString;

/// 去除空格
-(NSString *(^)(void))trim;

/// 获取baseUrl
/// @param baseUrl Url
+ (NSString *)getBaseUrl:(NSURL *)baseUrl;

/// getUUID
+ (NSString *)getUUID;

/// Base64编码
- (NSString *(^)(void))toBase64String;

/// Base64解码
- (NSString *(^)(void))base64ToString;

/// UrlBase64解码
- (NSString *(^)(void))toUrlBase64Decode;

/// MD5 32位 小写
- (NSString *(^)(void))toMD5ForLower32BateString;
/// MD5 32位 大写
- (NSString *(^)(void))toMD5ForUpper32BateString;
/// MD5 16位 小写
- (NSString *(^)(void))toMD5ForLower16BateString;
/// MD5 16位 大写
- (NSString *(^)(void))toMD5ForUpper16BateString;
/// DES 加密
- (NSString *(^)(NSString *key))toDESEncryptForKey;
/// DES 解密
- (NSString *(^)(NSString *key))toDESDecryptForKey;
/// 版本号比较
/// @param first 新版本
/// @param second 旧版本
+ (int)versionCompareFirst:(NSString *)first andVersionSecond:(NSString *)second;

@end




