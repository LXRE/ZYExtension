//
//  UIView+ChainProgramming.m
//  SpecLibDemo
//
//  Created by chenfeng on 2018/8/22.
//  Copyright © 2018年 chenfeng. All rights reserved.
//

#import "UIView+ChainProgramming.h"

@interface UIView ()
{
    id object;
}
@end

@implementation UIView (ChainProgramming)

+ (instancetype )init
{
    return [[[self class] alloc] init];
}

//instancetype作为block内部返回值时，无法连续"."调用其他方法，具体原因我也不是很清楚，感觉有点奇葩
- (UIView * (^)(CGFloat x,CGFloat y,CGFloat width,CGFloat height))setFrame
{
    return ^(CGFloat x,CGFloat y,CGFloat width,CGFloat height)
    {
        CGRect frame = self.frame;
        frame.origin.x = x;
        frame.origin.y = y;
        frame.size.width = width;
        frame.size.height = height;
        self.frame = frame;
        return self;
    };
}

- (UIView *(^)(CGFloat x))setX
{
    return ^(CGFloat x)
    {
        CGRect frame = self.frame;
        frame.origin.x = x;
        self.frame = frame;
        return self;
    };
    
}

- (UIView *(^)(CGFloat y))setY
{
    return ^(CGFloat y)
    {
        CGRect frame = self.frame;
        frame.origin.y = y;
        self.frame = frame;
        return self;
    };
}

- (UIView *(^)(CGFloat width))setWidth
{
    return ^(CGFloat width)
    {
        CGRect frame = self.frame;
        frame.size.width = width;
        self.frame = frame;
        return self;
    };
}


- (UIView *(^)(CGFloat height))setHeight
{
    return ^(CGFloat height)
    {
        CGRect frame = self.frame;
        frame.size.height = height;
        self.frame = frame;
        return self;
    };
}

- (UIView * (^)(UIColor *color))setBackgroundColor
{
    return ^(UIColor *color)
    {
        self.backgroundColor = color;
        return self;
    };
    
}

- (UIView *(^)(UIView *view))addSubView
{
    
    return ^(UIView *view)
    {
        [self addSubview:view];
        return self;
    };
}

-(UIView *(^)(CGFloat radius))setCornerRadius{
    return ^(CGFloat radius){
        self.layer.cornerRadius=radius;
        return self;
    };
}
-(UIView *(^)(CGFloat width))setBorderWidth{
    return ^(CGFloat width){
        self.layer.borderWidth=width;
        return self;
    };
}
-(UIView *(^)(UIColor *color))setBorderColor{
    return ^(UIColor *color){
        self.layer.borderColor=color.CGColor;
        return self;
    };
}
-(UIView *(^)(BOOL clip))setClipsToBounds{
    return ^(BOOL clip){
        self.clipsToBounds=clip;
        return self;
    };
}
@end
