//
//  UIButton+ChainProgramming.h
//  SpecLibDemo
//
//  Created by chenfeng on 2018/8/23.
//  Copyright © 2018年 chenfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (ChainProgramming)

+ (UIButton *(^)(UIButtonType buttonType))initWithType;

- (UIButton *(^)(id target, SEL sel, UIControlEvents event))addTarget;

- (UIButton *(^)(NSString *text, UIControlState state))setTitle;

- (UIButton *(^)(UIColor *color, UIControlState state))setTitleColor;

- (UIButton *(^)(UIFont *font))setTitleFont;

- (UIButton *(^)(NSString *text, UIColor *color, UIFont *font, UIControlState state))setTitleAndTitleColor;

@end
