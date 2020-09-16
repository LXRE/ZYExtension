//
//  TableviewDelegate.h
//  FBSnapshotTestCase
//
//  Created by Daisy on 2020/9/15.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
typedef CGFloat (^HeightForRowAtIndexPathBlock)(UITableView *   tableView,NSIndexPath *  indexPath);
typedef CGFloat (^HeightForHeaderInSectionBlock)(UITableView *  tableView,NSInteger section);
typedef CGFloat (^HeightForFooterInSectionBlock)(UITableView *  tableView,NSInteger section);
typedef UIView *_Nullable (^ViewForHeaderInSectionBlock)(UITableView *  tableView,NSInteger section);
typedef UIView *_Nullable (^ViewForFooterInSectionBlock)(UITableView *  tableView,NSInteger section);
typedef void (^DidSelectRowAtIndexPathBlock)(UITableView *    tableView,NSIndexPath * _Nullable indexPath);
typedef BOOL (^ShouldIndentWhileEditingRowAtIndexPathBlock)(UITableView *tableView,NSIndexPath *indexPath);
typedef void (^WillBeginEditingRowAtIndexPathBlock)(UITableView *tableView,NSIndexPath *indexPath);
typedef void (^DidEndEditingRowAtIndexPathBlock)(UITableView *tableView,NSIndexPath *indexPath);
typedef UITableViewCellEditingStyle (^EditingStyleForRowAtIndexPathBlock)(UITableView *tableView,NSIndexPath *indexPath);
typedef UITableViewHeaderFooterView*_Nullable (^HeaderViewForSectionBlock)(NSInteger section);
typedef UITableViewHeaderFooterView*_Nullable (^FooterViewForSectionBlock)(NSInteger section);
@interface TableviewDelegate : NSObject<UITableViewDelegate>

@property(nonatomic, copy) HeightForRowAtIndexPathBlock  heightForRowAtIndexPathBlock;
@property(nonatomic, copy) HeightForHeaderInSectionBlock  heightForHeaderInSectionBlock;
@property(nonatomic, copy) HeightForFooterInSectionBlock  heightForFooterInSectionBlock;
@property(nonatomic, copy) ViewForHeaderInSectionBlock  viewForHeaderInSectionBlock;
@property(nonatomic, copy) ViewForFooterInSectionBlock  viewForFooterInSectionBlock;
@property(nonatomic, copy) DidSelectRowAtIndexPathBlock  didSelectRowAtIndexPathBlock;
@property(nonatomic, copy) ShouldIndentWhileEditingRowAtIndexPathBlock  shouldIndentWhileEditingRowAtIndexPathBlock;
@property(nonatomic, copy) WillBeginEditingRowAtIndexPathBlock  willBeginEditingRowAtIndexPathBlock;
@property(nonatomic, copy) DidEndEditingRowAtIndexPathBlock  didEndEditingRowAtIndexPathBlock;
@property(nonatomic, copy) EditingStyleForRowAtIndexPathBlock  editingStyleForRowAtIndexPathBlock;
@property(nonatomic, copy) HeaderViewForSectionBlock  headerViewForSectionBlock;
@property(nonatomic, copy) FooterViewForSectionBlock  footerViewForSectionBlock;
+(instancetype)init;
///CGFloat (^HeightForRowAtIndexPathBlock)(UITableView *tableView,NSIndexPath *indexPath);
-(TableviewDelegate*(^)(HeightForRowAtIndexPathBlock block))heightForRowAtIndexPath;
///CGFloat (^HeightForHeaderInSectionBlock)(UITableView *tableView,NSInteger section);
-(TableviewDelegate*(^)(HeightForHeaderInSectionBlock block))heightForHeaderInSection;
///CGFloat (^HeightForFooterInSectionBlock)(UITableView *tableView,NSInteger section);
-(TableviewDelegate*(^)(HeightForFooterInSectionBlock block))heightForFooterInSection;
///UIView *_Nullable (^ViewForHeaderInSectionBlock)(UITableView *tableView,NSInteger section);
-(TableviewDelegate*(^)(ViewForHeaderInSectionBlock block))viewForHeaderInSection;
///UIView *_Nullable (^ViewForFooterInSectionBlock)(UITableView *tableView,NSInteger section);
-(TableviewDelegate*(^)(ViewForFooterInSectionBlock block))viewForFooterInSection;
///void (^DidSelectRowAtIndexPathBlock)(UITableView *tableView,NSIndexPath *indexPath);
-(TableviewDelegate*(^)(DidSelectRowAtIndexPathBlock block))didSelectRowAtIndexPath;
///BOOL (^ShouldIndentWhileEditingRowAtIndexPathBlock)(UITableView *tableView,NSIndexPath *indexPath);
-(TableviewDelegate*(^)(ShouldIndentWhileEditingRowAtIndexPathBlock block))shouldIndentWhileEditingRowAtIndexPath;
///void (^WillBeginEditingRowAtIndexPathBlock)(UITableView *tableView,NSIndexPath *indexPath);
-(TableviewDelegate*(^)(WillBeginEditingRowAtIndexPathBlock block))willBeginEditingRowAtIndexPath;
///void (^DidEndEditingRowAtIndexPathBlock)(UITableView *tableView,NSIndexPath *indexPath);
-(TableviewDelegate*(^)(DidEndEditingRowAtIndexPathBlock block))didEndEditingRowAtIndexPath;
///UITableViewCellEditingStyle (^EditingStyleForRowAtIndexPathBlock)(UITableView *tableView,NSIndexPath *indexPath);
-(TableviewDelegate*(^)(EditingStyleForRowAtIndexPathBlock block))editingStyleForRowAtIndexPath;
///UITableViewHeaderFooterView*_Nullable (^HeaderViewForSectionBlock)(NSInteger section);
-(TableviewDelegate*(^)(HeaderViewForSectionBlock block))headerViewForSection;
///UITableViewHeaderFooterView*_Nullable (^FooterViewForSectionBlock)(NSInteger section);
-(TableviewDelegate*(^)(FooterViewForSectionBlock block))footerViewForSection;
@end

NS_ASSUME_NONNULL_END
