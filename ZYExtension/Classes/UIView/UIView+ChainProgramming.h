//
//  UIView+ChainProgramming.h
//  SpecLibDemo
//
//  Created by chenfeng on 2018/8/22.
//  Copyright © 2018年 chenfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ChainProgramming)

+ (instancetype )init;

- (UIView * (^)(CGFloat x,CGFloat y,CGFloat width,CGFloat height))setFrame;

- (UIView *(^)(CGFloat x))setX;

- (UIView *(^)(CGFloat y))setY;

- (UIView *(^)(CGFloat width))setWidth;

- (UIView *(^)(CGFloat height))setHeight;

- (UIView *(^)(UIColor *color))setBackgroundColor;

- (UIView *(^)(UIView *view))addSubView;

-(UIView *(^)(CGFloat radius))setCornerRadius;

-(UIView *(^)(CGFloat width))setBorderWidth;

-(UIView *(^)(UIColor *color))setBorderColor;

-(UIView *(^)(BOOL clip))setClipsToBounds;
@end
