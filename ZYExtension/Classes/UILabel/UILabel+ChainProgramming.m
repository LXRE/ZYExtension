//
//  UILabel+ChainProgramming.m
//  SpecLibDemo
//
//  Created by chenfeng on 2018/8/23.
//  Copyright © 2018年 chenfeng. All rights reserved.
//

#import "UILabel+ChainProgramming.h"

@implementation UILabel (ChainProgramming)

- (UILabel *(^)(NSString *text))setText
{
    return ^(NSString *text)
    {
        self.text = text;
        return self;
    };
}

- (UILabel *(^)(UIColor *color))setTextColor
{
    return ^(UIColor *color)
    {
        self.textColor = color;
        return self;
    };
}

- (UILabel *(^)(UIFont *font))setTextFont
{
    return ^(UIFont *font)
    {
        self.font = font;
        return self;
    };
}

- (UILabel *(^)(NSTextAlignment textAlignment))setTextAlignment
{
    return ^(NSTextAlignment textAlignment)
    {
        self.textAlignment = textAlignment;
        return self;
    };
}

- (UILabel *(^)(NSAttributedString *attributedString))setAttributedString{
    return ^(NSAttributedString *attributedString){
        self.attributedText=attributedString;
        return self;
    };
}
@end
