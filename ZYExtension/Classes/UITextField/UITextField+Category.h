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
-(UITextField *(^)(ChangeValue block))textFieldDidChanged;
@end

NS_ASSUME_NONNULL_END
