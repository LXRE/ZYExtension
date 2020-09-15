//
//  TableViewDataSource.h
//  FBSnapshotTestCase
//
//  Created by Daisy on 2020/9/11.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
typedef NSInteger (^NumberOfRowsInSectionBlock)(UITableView *tableView,NSInteger section);

typedef UITableViewCell* _Nonnull (^CellForRowAtIndexPathBlock)(UITableView *tableView,NSIndexPath* indexPath);

typedef NSInteger (^NumberOfSectionsInTableViewBlock)(UITableView *tableView);

typedef NSString* _Nullable (^TitleForHeaderInSectionBlock)(UITableView *tableView,NSInteger section);

typedef NSString* _Nullable (^TitleForFooterInSectionBlock)(UITableView *tableView,NSInteger section);

typedef BOOL (^CanEditRowAtIndexPathBlock)(UITableView *tableView,NSIndexPath *indexPath);

typedef BOOL (^CanMoveRowAtIndexPathBlock)(UITableView *tableView,NSIndexPath *indexPath);

typedef NSArray<NSString *> * _Nullable (^SectionIndexTitlesForTableViewBlock)(UITableView *tableView);

typedef NSInteger (^SectionForSectionIndexTitleBlock)(UITableView *tableView, NSString *title,NSInteger index);

typedef void (^CommitEditingStyleBlock)(UITableView *tableView,UITableViewCellEditingStyle editingStyle,NSIndexPath *indexPath);

typedef void (^MoveRowAtIndexPathBlock)(UITableView *tableView,NSIndexPath *sourceIndexPath,NSIndexPath *destinationIndexPath);

@interface TableViewDataSource : NSObject<UITableViewDataSource>

@property(nonatomic, copy) NumberOfRowsInSectionBlock numberOfRowsInSectionBlock;
@property(nonatomic, copy) CellForRowAtIndexPathBlock cellForRowAtIndexPathBlock;
@property(nonatomic, copy) NumberOfSectionsInTableViewBlock numberOfSectionsInTableViewBlock;
@property(nonatomic, copy) TitleForHeaderInSectionBlock titleForHeaderInSectionBlock;
@property(nonatomic, copy) TitleForFooterInSectionBlock titleForFooterInSectionBlock;
@property(nonatomic, copy) CanEditRowAtIndexPathBlock canEditRowAtIndexPathBlock;
@property(nonatomic, copy) CanMoveRowAtIndexPathBlock canMoveRowAtIndexPathBlock;
@property(nonatomic, copy) SectionIndexTitlesForTableViewBlock sectionIndexTitlesForTableViewBlock;
@property(nonatomic, copy) SectionForSectionIndexTitleBlock sectionForSectionIndexTitleBlock;
@property(nonatomic, copy) CommitEditingStyleBlock commitEditingStyleBlock;
@property(nonatomic, copy) MoveRowAtIndexPathBlock moveRowAtIndexPathBlock;

///初始化
+(instancetype)init;
///NSInteger (^NumberOfRowsInSectionBlock)(UITableView *tableView,NSInteger section);
-(TableViewDataSource*(^)(NumberOfRowsInSectionBlock block))numberOfRowsInSection;
///UITableViewCell* _Nonnull (^CellForRowAtIndexPathBlock)(UITableView *tableView,NSIndexPath* indexPath);
-(TableViewDataSource*(^)(CellForRowAtIndexPathBlock block))cellForRowAtIndexPath;
///NSInteger (^NumberOfSectionsInTableViewBlock)(UITableView *tableView)
-(TableViewDataSource*(^)(NumberOfSectionsInTableViewBlock block))numberOfSectionsInTableView;
///NSString* _Nullable (^TitleForHeaderInSectionBlock)(UITableView *tableView,NSInteger section)
-(TableViewDataSource*(^)(TitleForHeaderInSectionBlock block))titleForHeaderInSection;
///NSString* _Nullable (^TitleForFooterInSectionBlock)(UITableView *tableView,NSInteger section)
-(TableViewDataSource*(^)(TitleForFooterInSectionBlock block))titleForFooterInSection;
///BOOL (^CanEditRowAtIndexPathBlock)(UITableView *tableView,NSIndexPath *indexPath)
-(TableViewDataSource*(^)(CanEditRowAtIndexPathBlock block))canEditRowAtIndexPath;
///BOOL (^CanMoveRowAtIndexPathBlock)(UITableView *tableView,NSIndexPath *indexPath)
-(TableViewDataSource*(^)(CanMoveRowAtIndexPathBlock block))canMoveRowAtIndexPath;
///NSArray<NSString *> * _Nullable (^SectionIndexTitlesForTableViewBlock)(UITableView *tableView)
-(TableViewDataSource*(^)(SectionIndexTitlesForTableViewBlock block))sectionIndexTitlesForTableView;
///NSInteger (^SectionForSectionIndexTitleBlock)(UITableView *tableView, NSString *title,NSInteger index)
-(TableViewDataSource*(^)(SectionForSectionIndexTitleBlock block))sectionForSectionIndexTitle;
///void (^CommitEditingStyleBlock)(UITableView *tableView,UITableViewCellEditingStyle editingStyle,NSIndexPath *indexPath)
-(TableViewDataSource*(^)(CommitEditingStyleBlock block))commitEditingStyle;
///void (^MoveRowAtIndexPathBlock)(UITableView *tableView,NSIndexPath *sourceIndexPath,NSIndexPath *destinationIndexPath)
-(TableViewDataSource*(^)(MoveRowAtIndexPathBlock block))moveRowAtIndexPath;
@end

NS_ASSUME_NONNULL_END
