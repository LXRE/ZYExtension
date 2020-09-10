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
@end
