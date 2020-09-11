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
typedef UITableViewCell* _Nonnull (^CellForRowAtIndexPath)(UITableView *tableView,NSIndexPath* indexPath);
@interface TableViewDataSource : NSObject<UITableViewDataSource>

@property(nonatomic, copy) NumberOfRowsInSectionBlock numberOfRowsInSectionBlock;
@property(nonatomic, copy) CellForRowAtIndexPath cellForRowAtIndexPathBlock;
-(instancetype)initWithNumberOfRowsInSection:(NumberOfRowsInSectionBlock)block withCellForRowAtIndexPath:(CellForRowAtIndexPath)block1;


@end

NS_ASSUME_NONNULL_END
