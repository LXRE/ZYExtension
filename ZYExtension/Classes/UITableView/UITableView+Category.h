//
//  UITableView+Category.h
//  FBSnapshotTestCase
//
//  Created by Daisy on 2020/9/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (Category)


/// init方法 frame style
-(UITableView *(^)(CGRect frame,UITableViewStyle style))initWithFrameAndStyle;

/// 设置分割线的风格
-(UITableView *(^)(UITableViewCellSeparatorStyle style))setSeparatorStyle;

/// 设置分割线的颜色
-(UITableView *(^)(UIColor* color))setSeparatorColor;

/// 设置行高
-(UITableView *(^)(float height))setRowHeight;

-(UITableView *(^)(UIView* view))setTableHeaderView;

-(UITableView *(^)(UIView* view))setTableFooterView;

/// 注册单元格 class identifier
-(UITableView *(^)(Class nClass,NSString *identifier))registerClassForCellReuseIdentifier;

/// 注册单元格 nib identifier
-(UITableView *(^)(UINib *nib,NSString *identifier))registerNibForCellReuseIdentifier;

/// 设置代理
-(UITableView *(^)(id<UITableViewDelegate> delegate))setDelegate;

/// 设置数据源
-(UITableView *(^)(id<UITableViewDataSource> dataSource))setDataSource;

/// 获取tableviewcell
-(UITableViewCell*(^)(NSString *identifier))dequeueReusableCellWithIdentifier;
@end

NS_ASSUME_NONNULL_END
