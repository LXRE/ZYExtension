//
//  UIColor+Category.h
//  FBSnapshotTestCase
//
//  Created by Daisy on 2020/9/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Category)

/// 十六进制颜色
/// @param color 参数 如 @“#213214” 或@“0x213434”
+(UIColor *)colorWithHexString:(NSString *)color;

/// 带有透明度的颜色，十六进制封装
/// @param color 颜色
/// @param alpha 透明度
+(UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
@end

NS_ASSUME_NONNULL_END
