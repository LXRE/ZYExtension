//
//  UITextField+Category.m
//  FBSnapshotTestCase
//
//  Created by Daisy on 2020/9/10.
//

#import "UITextField+Category.h"
#import <objc/runtime.h>
static const char textKey;
@implementation UITextField (Category)

/// TextFiled 输入值变化的block
-(UITextField *(^)(ChangeValue block))textFieldDidChanged{
    return ^(ChangeValue block){
        
        if (block){
          //set方法将self和block通过btnkey关联起来
           objc_setAssociatedObject(self, &textKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
       }

       [self addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
       return self;
    };
}
// 文本变化
- (void)textFieldDidChange:(UITextField *)textField
{
    // TODO:
    ChangeValue block=objc_getAssociatedObject(self, &textKey);
    block(textField);
}
-(UITextField *(^)(UITextBorderStyle style))setBorderStyle{
    return ^(UITextBorderStyle style){
        self.borderStyle = style;
        return self;
    };
}
-(UITextField *(^)(NSString *placeholder))setPlaceholder{
    return ^(NSString *placeholder){
        self.placeholder = placeholder;
        return self;
    };
}
-(UITextField *(^)(float size))setFont{
    return ^(float size){
        self.font = [UIFont systemFontOfSize:size];
        return self;
    };
}
-(UITextField *(^)(UIKeyboardType type))setKeyboardType{
    return ^(UIKeyboardType type){
        self.keyboardType = type;
        return self;
    };
}
-(UITextField *(^)(UIReturnKeyType type))setReturnKeyType{
    return ^(UIReturnKeyType type){
        self.returnKeyType = type;
        return self;
    };
}
-(UITextField *(^)(NSTextAlignment alignment))setTextAlignment{
    return ^(NSTextAlignment alignment){
        self.textAlignment = alignment;
        return self;
    };
}
-(UITextField *(^)(NSString *text))setText{
    return ^(NSString *text){
        self.text = text;
        return self;
    };
}
-(UITextField *(^)(BOOL *sec))setSecureTextEntry{
    return ^(BOOL *sec){
        self.secureTextEntry = sec;
        return self;
    };
}
-(UITextField *(^)(UIColor *color))setTextColor{
    return ^(UIColor *color){
        self.textColor = color;
        return self;
    };
}
@end
