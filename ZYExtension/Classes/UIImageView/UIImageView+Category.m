//
//  UIImageView+Category.m
//  FBSnapshotTestCase
//
//  Created by Daisy on 2020/9/10.
//

#import "UIImageView+Category.h"

@implementation UIImageView (Category)
+(UIImageView *(^)(CGRect rect,UIImage *image))imageViewWithFrame{
    return ^(CGRect rect,UIImage *image){
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
           imageView.frame = rect;
           return imageView;
    };
}
-(UIImageView *(^)(UIImage *image))setImaged{
    return ^(UIImage *image){
        self.image=image;
        return self;
    };
}
-(UIImageView *(^)(NSArray *imageArr,float duration))setAnimationImages{
    return ^(NSArray *imageArr,float duration){
        self.animationImages=imageArr;
        [self setAnimationDuration: duration];
        [self setAnimationRepeatCount:0];
        [self startAnimating];
        return self;
    };
}
@end
