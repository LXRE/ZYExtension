//
//  UIImage+Category.h
//  FBSnapshotTestCase
//
//  Created by Daisy on 2020/9/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Category)

/// 根据name获取image
+(UIImage *(^)(NSString *name))imageNamed;

///生成一张高斯模糊的图片 blur 模糊程度
-(UIImage *(^)(CGFloat blur))blurImage;

///  根据颜色生成一张图片 color颜色 size大小
+(UIImage *(^)(UIColor *color,CGSize size))initAImage;

/// 转换成一张圆形图片 borderColor边框颜色 borderWidth边框宽度
-(UIImage *(^)(UIColor *borderColor,CGFloat borderWidth))circleImageWithBorder;
@end

NS_ASSUME_NONNULL_END
