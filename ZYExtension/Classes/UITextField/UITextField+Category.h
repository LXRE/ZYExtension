//
//  UITextField+Category.h
//  FBSnapshotTestCase
//
//  Created by Daisy on 2020/9/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^ChangeValue)(UITextField *textField);
@interface UITextField (Category)

/// 内容改变事件
-(UITextField *(^)(ChangeValue block))textFieldDidChanged;

//设置边框样式
-(UITextField *(^)(UITextBorderStyle style))setBorderStyle;

/// 设置默认内容
-(UITextField *(^)(NSString *placeholder))setPlaceholder;

/// 设置字体大小
-(UITextField *(^)(float size))setFont;

/// 设置键盘类型
-(UITextField *(^)(UIKeyboardType type))setKeyboardType;

/// 设置返回键的类型
-(UITextField *(^)(UIReturnKeyType type))setReturnKeyType;

/// text对齐方式
-(UITextField *(^)(NSTextAlignment alignment))setTextAlignment;

/// 设置显示内容
-(UITextField *(^)(NSString *text))setText;

/// 是否是密码
-(UITextField *(^)(BOOL *sec))setSecureTextEntry;

/// 设置字体颜色
-(UITextField *(^)(UIColor *color))setTextColor;
@end

NS_ASSUME_NONNULL_END
