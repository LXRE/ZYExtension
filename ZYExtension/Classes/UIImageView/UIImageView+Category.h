//
//  UIImageView+Category.h
//  FBSnapshotTestCase
//
//  Created by Daisy on 2020/9/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (Category)
/// 创建UIImageView   CGRect 位置和大小  image内容
+(UIImageView *(^)(CGRect rect,UIImage *image))imageViewWithFrame;

/// 设置image
-(UIImageView *(^)(UIImage *image))setImaged;

/// 设置gift imageView
-(UIImageView *(^)(NSArray *imageArr,float duration))setAnimationImages;
@end

NS_ASSUME_NONNULL_END
