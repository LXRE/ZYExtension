//
//  UIColor+Category.h
//  FBSnapshotTestCase
//
//  Created by Daisy on 2020/9/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Category)

/// 十六进制颜色  如 @“#213214” 或@“0x213434”
+(UIColor *(^)(NSString *color))colorWithHexString;

/// 带有透明度的颜色，十六进制封装
+(UIColor *(^)(NSString *color,CGFloat alpha))colorWithHexStringAndAlpha;
@end

NS_ASSUME_NONNULL_END
