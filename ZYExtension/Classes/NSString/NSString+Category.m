//
//  NSString+BXExtension.m
//  Demo
//
//  Created by ZZY on 18/8/08.
//  Copyright © 2018年 baobeikeji. All rights reserved.
//

#import "NSString+Category.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSString (Category)

- (BOOL(^)(void))isPhoneNumber{
    return ^{
        NSString *number=self;
        if (number.length != 11)
        {
            return NO;
        }
        /**
         * 手机号码:
         * 13[0-9], 14[5,7], 15[0, 1, 2, 3, 5, 6, 7, 8, 9], 17[6, 7, 8], 18[0-9], 170[0-9]
         * 移动号段: 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
         * 联通号段: 130,131,132,155,156,185,186,145,176,1709
         * 电信号段: 133,153,180,181,189,177,1700
         */
        NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|9[0-9]|7[0678])\\d{8}$";
        /**
         * 中国移动：China Mobile
         * 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
         */
        NSString *CM = @"(^1(3[4-9]|4[7]|5[0-27-9]|7[8]|8[2-478])\\d{8}$)|(^1705\\d{7}$)";
        /**
         * 中国联通：China Unicom
         * 130,131,132,155,156,166,185,186,145,176,1709
         */
        NSString *CU = @"(^1(3[0-2]|4[5]|5[56]|6[6]|7[6]|8[56])\\d{8}$)|(^1709\\d{7}$)";
        /**
         * 中国电信：China Telecom
         * 133,153,180,181,189,177,1700
         */
        NSString *CT = @"(^1(33|53|77|8[019])\\d{8}$)|(^1700\\d{7}$)";
        /**
         25     * 大陆地区固话及小灵通
         26     * 区号：010,020,021,022,023,024,025,027,028,029
         27     * 号码：七位或八位
         28     */
        //  NSString * PHS = @"^(0[0-9]{2})\\d{8}$|^(0[0-9]{3}(\\d{7,8}))$";
        NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
        NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
        NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
        NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
        if (([regextestmobile evaluateWithObject:number] == YES)
            || ([regextestcm evaluateWithObject:number] == YES)
            || ([regextestct evaluateWithObject:number] == YES)
            || ([regextestcu evaluateWithObject:number] == YES))
        {
            return YES;
        }
        else
        {
            return NO;
        }
    };
    
}

- (BOOL(^)(void))isEmailAdress{
    return ^{
        NSString *emailCheck = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
        NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",emailCheck];
        return [emailTest evaluateWithObject:self];
    };
    
}

- (BOOL(^)(void))isIdentityCard {
    return ^{
        NSString *IDCardNumber=self;
        if (IDCardNumber.length <= 0) {
            return NO;
        }
        NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
        NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
        return [identityCardPredicate evaluateWithObject:IDCardNumber];
    };
    
}

- (BOOL(^)(void))isBankCard{
    return ^{
        NSString *cardNumber=self;
        if(cardNumber.length==0)
        {
            return NO;
        }
        NSString *digitsOnly = @"";
        char c;
        for (int i = 0; i < cardNumber.length; i++)
        {
            c = [cardNumber characterAtIndex:i];
            if (isdigit(c))
            {
                digitsOnly =[digitsOnly stringByAppendingFormat:@"%c",c];
            }
        }
        int sum = 0;
        int digit = 0;
        int addend = 0;
        BOOL timesTwo = false;
        for (NSInteger i = digitsOnly.length - 1; i >= 0; i--)
        {
            digit = [digitsOnly characterAtIndex:i] - '0';
            if (timesTwo)
            {
                addend = digit * 2;
                if (addend > 9) {
                    addend -= 9;
                }
            }
            else {
                addend = digit;
            }
            sum += addend;
            timesTwo = !timesTwo;
        }
        int modulus = sum % 10;
        if (modulus==0) {
            return YES;
        }else{
            return NO;
        }
        
    };
    
}

- (NSString *(^)(void))ageFromIDCard {
    return ^{
        NSMutableString *birthYear = nil;
        if (self.length == 15) {
            birthYear = [[self substringWithRange:NSMakeRange(6, 2)] mutableCopy];
            [birthYear insertString:@"19" atIndex:0];
        } else if (self.length == 18) {
            birthYear = [[self substringWithRange:NSMakeRange(6, 4)] mutableCopy];
        }
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy"];
        NSString *year = [formatter stringFromDate:[NSDate date]];
        NSInteger age = year.integerValue - birthYear.integerValue;
        if (age >= 0 && age < 200) {
            return [NSString stringWithFormat:@"%zd", age];
        } else {
            return @"未知";
        }
    };
    
}

- (NSString*(^)(void))birthdayFromIDCard {
    return ^{
        NSString *result = @"未知";
        if (self.length == 15) {
            NSMutableString *birthString = [[self substringWithRange:NSMakeRange(6, 6)] mutableCopy];
            [birthString insertString:@"19" atIndex:0];
            [birthString insertString:@"." atIndex:4];
            [birthString insertString:@"." atIndex:7];
            result = birthString;
        } else if (self.length == 18) {
            NSMutableString *birthString = [[self substringWithRange:NSMakeRange(6, 8)] mutableCopy];
            [birthString insertString:@"." atIndex:4];
            [birthString insertString:@"." atIndex:7];
            result = birthString;
        }
        
        return result;
    };
    
}

- (NSString*(^)(void))sexFromIDCard {
    return ^{
        NSString *sexString = @"";
        
        if (self.length == 15) {
            sexString =  [[self substringWithRange:NSMakeRange(14, 1)] mutableCopy];
        } else if (self.length == 18) {
            sexString = [[self substringWithRange:NSMakeRange(16, 1)] mutableCopy];
        }
        
        int x = sexString.intValue;
        if (x < 0 || sexString.length == 0) {
            return @"";
        }
        if (x % 2 == 0) {
            return @"女";
        } else {
            return @"男";
        }
        return sexString;
    };
    
}

- (NSString *(^)(void))phoneHiddenPartlyWords{
    return ^{
        if (self && self.length > 0) {
            NSString *newStr = [NSString stringWithFormat:@"%@****%@",[self substringWithRange:NSMakeRange(0, 3)],[self substringWithRange:NSMakeRange(7, 4)]];
            return newStr;
        }else{
            return self;
        }
    };
    
}

+(NSString *)stringIntervalFrom:(NSDate *)start to:(NSDate *)end {
    NSInteger interval = end.timeIntervalSince1970 - start.timeIntervalSince1970;
    if (interval <= 0) {
        return @"刚刚";
    }
    
    if (interval < 60) {
        return [NSString stringWithFormat:@"%zd 秒前", interval];
    }
    
    interval = interval / 60;
    if (interval < 60) {
        return [NSString stringWithFormat:@"%zd 分钟前", interval];
    }
    
    interval = interval / 60;
    if (interval < 24) {
        return [NSString stringWithFormat:@"%zd 小时前", interval];
    }
    
    interval = interval / 24;
    if (interval < 7) {
        return [NSString stringWithFormat:@"%zd 天前", interval];
    }
    
    if (interval < 30) {
        return [NSString stringWithFormat:@"%zd 周前", interval / 7];
    }
    
    if (interval < 365) {
        return [NSString stringWithFormat:@"%zd 个月前", interval / 30];
    }
    return [NSString stringWithFormat:@"%zd 年前", interval / 365];
}

- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    CGSize size = [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return size;
}

+ (NSString *)getFirstLetterFromString:(NSString *)aString{
    //转成了可变字符串
    NSMutableString *str = [NSMutableString stringWithString:aString];
    //先转换为带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);
    //转化为大写拼音
    NSString *strPinYin = [str capitalizedString];
    //获取并返回首字母
    return [strPinYin substringToIndex:1];
}

-(NSString *(^)(void))trim{
    return ^{
        return [self stringByReplacingOccurrencesOfString:@" " withString:@""];;
    };
}

+ (NSString *)getBaseUrl:(NSURL *)baseUrl
{
    return [NSString stringWithFormat:@"%@://%@:%@",[baseUrl scheme],[baseUrl host],([baseUrl port]==nil?@"":[baseUrl port])];
}

+ (NSString *)getUUID {
    CFUUIDRef puuid = CFUUIDCreate( nil );
    CFStringRef uuidString = CFUUIDCreateString(nil, puuid);
    NSString *result = (NSString *)CFBridgingRelease(CFStringCreateCopy( NULL, uuidString));
    return result;
}

- (NSString *(^)(void))toBase64String{
    return ^{
        NSData *encodeData = [self dataUsingEncoding:NSUTF8StringEncoding];
        NSString *base64String = [encodeData base64EncodedStringWithOptions:0];
        return base64String;
    };
    
}

- (NSString *(^)(void))base64ToString{
    return ^{
    NSData *decodedData = [[NSData alloc] initWithBase64EncodedString:self options:0];
    NSString *decodedString = [[NSString alloc] initWithData:decodedData encoding:NSUTF8StringEncoding];
    return decodedString;
   };
}

- (NSString *(^)(void))toUrlBase64Decode{
    return ^{
        //将safeBase64编码中的"-"，"_"字符串转换成"+"，"/"，字符串长度余4倍的位补"="
        // '-' -> '+'
        // '_' -> '/'
        // 不足4倍长度，补'='
        NSMutableString * base64Str = [[NSMutableString alloc] initWithString:self];
        base64Str = (NSMutableString * )[base64Str stringByReplacingOccurrencesOfString:@"-" withString:@"+"];
        base64Str = (NSMutableString * )[base64Str stringByReplacingOccurrencesOfString:@"_" withString:@"/"];
        NSInteger mod4 = base64Str.length % 4;
        if(mod4 > 0) {
            [base64Str appendString:[@"====" substringToIndex:(4-mod4)]];
        }
        return base64Str.base64ToString();
    };
    
}

+ (int)versionCompareFirst:(NSString *)first andVersionSecond:(NSString *)second{
    NSArray *versions1 = [first componentsSeparatedByString:@"."];
    NSArray *versions2 = [second componentsSeparatedByString:@"."];
    NSMutableArray *ver1Array = [NSMutableArray arrayWithArray:versions1];
    NSMutableArray *ver2Array = [NSMutableArray arrayWithArray:versions2];
    // 确定最大数组
    NSInteger a = (ver1Array.count> ver2Array.count)?ver1Array.count : ver2Array.count;
    // 补成相同位数数组
    if (ver1Array.count < a) {
        for(NSInteger j = ver1Array.count; j < a; j++) {
            [ver1Array addObject:@"0"];
        }
    }else {
        for(NSInteger j = ver2Array.count; j < a; j++) {
            [ver2Array addObject:@"0"];
        }
    }
    // 比较版本号
    for (int i = 0; i< ver2Array.count; i++) {
        NSInteger a = [[ver1Array objectAtIndex:i] integerValue];
        NSInteger b = [[ver2Array objectAtIndex:i] integerValue];
        if (a > b) {
            return 1;
        } else if (a < b) {
            return -1;
        }
    }
    return 0;
}
- (NSString *(^)(void))toMD5ForLower32BateString{
    return ^{
        //要进行UTF8的转码
        const char* input = [self UTF8String];
        unsigned char result[CC_MD5_DIGEST_LENGTH];
        CC_MD5(input, (CC_LONG)strlen(input), result);
        
        NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
        for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
            [digest appendFormat:@"%02x", result[i]];
        }
        
        return digest;
    };
}
- (NSString *(^)(void))toMD5ForUpper32BateString{
    return ^{
        const char* input = [self UTF8String];
           unsigned char result[CC_MD5_DIGEST_LENGTH];
           CC_MD5(input, (CC_LONG)strlen(input), result);
           
           NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
           for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
               [digest appendFormat:@"%02X", result[i]];
           }
           
           return digest;
    };
}
-(NSString *(^)(void))toMD5ForLower16BateString{
    return ^{
        NSString *md5Str = self.toMD5ForLower32BateString();
        
        NSString  *string;
        for (int i=0; i<24; i++) {
            string=[md5Str substringWithRange:NSMakeRange(8, 16)];
        }
        return string;
    };
}
- (NSString *(^)(void))toMD5ForUpper16BateString{
    return ^{
        NSString *md5Str = self.toMD5ForUpper32BateString();
           
           NSString  *string;
           for (int i=0; i<24; i++) {
               string=[md5Str substringWithRange:NSMakeRange(8, 16)];
           }
           return string;
    };
}
- (NSString *(^)(NSString *key))toDESEncryptForKey{
    return ^(NSString *key){
        NSString *ciphertext = nil;
        const char *textBytes = [self UTF8String];
        size_t dataLength = [self length];
        uint8_t *bufferPtr = NULL;
        size_t bufferPtrSize = 0;
        size_t movedBytes = 0;
        
        bufferPtrSize = (dataLength + kCCBlockSizeDES) & ~(kCCBlockSizeDES - 1);
        bufferPtr = malloc( bufferPtrSize * sizeof(uint8_t));
        memset((void *)bufferPtr, 0x0, bufferPtrSize);
        CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithm3DES,
                                              kCCOptionPKCS7Padding|kCCOptionECBMode,
                                              [key UTF8String], kCCKeySize3DES,
                                              NULL,
                                              textBytes, dataLength,
                                              (void *)bufferPtr, bufferPtrSize,
                                              &movedBytes);
        if (cryptStatus == kCCSuccess) {
            
            ciphertext= [self parseByte2HexString:bufferPtr :(int)movedBytes];
            
        }
        ciphertext=[ciphertext uppercaseString];//字符变大写
        
        return ciphertext ;
    };
}
- (NSString *)parseByte2HexString:(Byte *) bytes  :(int)len{
    NSString *hexStr = @"";
    if(bytes)
    {
        for(int i=0;i<len;i++)
        {
            NSString *newHexStr = [NSString stringWithFormat:@"%x",bytes[i]&0xff]; ///16进制数
            if([newHexStr length]==1)
                hexStr = [NSString stringWithFormat:@"%@0%@",hexStr,newHexStr];
            else
            {
                hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr];
            }
            
        }
    }
    return hexStr;
}
- (NSString *(^)(NSString *key))toDESDecryptForKey{
    return ^(NSString *key){
    NSData* cipherData = [self convertHexStrToData:[self lowercaseString]];
    unsigned char buffer[1024];
    memset(buffer, 0, sizeof(char));
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithm3DES,
                                          kCCOptionPKCS7Padding|kCCOptionECBMode,
                                          [key UTF8String],
                                          kCCKeySize3DES,
                                          NULL,
                                          [cipherData bytes],
                                          [cipherData length],
                                          buffer,
                                          1024,
                                          &numBytesDecrypted);
    NSString* plainText = nil;
    if (cryptStatus == kCCSuccess) {
        NSData* data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesDecrypted];
        plainText = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return plainText;
    };
}
- (NSData *)convertHexStrToData:(NSString *)str {
    if (!str || [str length] == 0) {
        return nil;
    }
    
    NSMutableData *hexData = [[NSMutableData alloc] initWithCapacity:8];
    NSRange range;
    if ([str length] % 2 == 0) {
        range = NSMakeRange(0, 2);
    } else {
        range = NSMakeRange(0, 1);
    }
    for (NSInteger i = range.location; i < [str length]; i += 2) {
        unsigned int anInt;
        NSString *hexCharStr = [str substringWithRange:range];
        NSScanner *scanner = [[NSScanner alloc] initWithString:hexCharStr];
        
        [scanner scanHexInt:&anInt];
        NSData *entity = [[NSData alloc] initWithBytes:&anInt length:1];
        [hexData appendData:entity];
        
        range.location += range.length;
        range.length = 2;
    }
    
    return hexData;
}
@end
