//
//  UITableViewCell+Category.h
//  FBSnapshotTestCase
//
//  Created by Daisy on 2020/9/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableViewCell (Category)

/// 设置点击的颜色 UITableViewCellSelectionStyle
-(UITableViewCell *(^)(UITableViewCellSelectionStyle style))setSelectionStyle;

/// 设置cell样式 UITableViewCellAccessoryNone 无样式 UITableViewCellAccessoryDisclosureIndicator 右边一个箭头UITableViewCellAccessoryCheckmark 对号
-(UITableViewCell *(^)(UITableViewCellAccessoryType style))setAccessoryType;
@end


NS_ASSUME_NONNULL_END
