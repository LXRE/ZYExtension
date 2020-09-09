//
//  UILabel+ChainProgramming.h
//  SpecLibDemo
//
//  Created by chenfeng on 2018/8/23.
//  Copyright © 2018年 chenfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (ChainProgramming)


- (UILabel *(^)(NSString *text))setText;

- (UILabel *(^)(UIColor *color))setTextColor;

- (UILabel *(^)(UIFont *font))setTextFont;

- (UILabel *(^)(NSTextAlignment textAlignment))setTextAlignment;

- (UILabel *(^)(NSAttributedString *attributedString))setAttributedString;
@end
