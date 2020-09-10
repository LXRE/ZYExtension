//
//  UIImage+Category.m
//  FBSnapshotTestCase
//
//  Created by Daisy on 2020/9/10.
//

#import "UIImage+Category.h"

@implementation UIImage (Category)
+(UIImage *(^)(NSString *name))imageNamed{
    return ^(NSString *name){
        return [UIImage imageNamed:name];
    };
}

-(UIImage *(^)(CGFloat blur))blurImage{
    return ^(CGFloat blur){
        //转换图片
       CIContext *context = [CIContext contextWithOptions:nil];
       CIImage *midImage = [CIImage imageWithData:UIImagePNGRepresentation(self)];
       //图片开始处理
       CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
       [filter setValue:midImage forKey:kCIInputImageKey];
       NSNumber *num= [NSNumber numberWithFloat:blur];
       //value 改变模糊效果值
       [filter setValue:num forKey:@"inputRadius"];
       CIImage *result = [filter valueForKey:kCIOutputImageKey];
       CGImageRef outimage = [context createCGImage:result fromRect:[result extent]];
       //转换成UIimage
       return [UIImage imageWithCGImage:outimage];
    };
}
+(UIImage *(^)(UIColor *color,CGSize size))initAImage{
    return ^(UIColor *color,CGSize size){
        CGRect rect = CGRectMake(0, 0, size.width, size.height);
        // 开启图形上下文
        UIGraphicsBeginImageContext(rect.size);
        // 获取当前的上下文
        CGContextRef context = UIGraphicsGetCurrentContext();
        // 将颜色填充到上下文
        CGContextSetFillColorWithColor(context, color.CGColor);
        // 将内容填满指定的尺寸
        CGContextFillRect(context, rect);
        // 从上下文获取图片
        UIImage *image =UIGraphicsGetImageFromCurrentImageContext();
        // 关闭上下文
        UIGraphicsEndImageContext();
        
        return image;
        
    };
}
-(UIImage *(^)(UIColor *borderColor,CGFloat borderWidth))circleImageWithBorder{
    return ^(UIColor *borderColor,CGFloat borderWidth){
        UIImage *originImage=self;
        // 设置圆形图片的直径
        CGFloat imageDia = originImage.size.width;
        // 计算外圆的直径(边框是在图片外额外添加的区域)
        CGFloat borderDia = imageDia + 2 * borderWidth;

        // 开启图形上下文
        UIGraphicsBeginImageContext(originImage.size);
        // 画一个包含边框的圆形
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, borderDia, borderDia)];
        // 设置颜色
        [borderColor set];
        [path fill];

        // 设置裁剪区域
        UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderWidth, borderWidth, imageDia, imageDia)];
        // 裁剪图片
        [clipPath addClip];
        
        // 绘制图片
        [originImage drawAtPoint:CGPointMake(borderWidth, borderWidth)];
        // 从上下文中获取图片
        UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
        // 关闭上下文
        UIGraphicsEndImageContext();
        
        return resultImage;
    };
}
@end
