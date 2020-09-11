//
//  TableViewDataSource.m
//  FBSnapshotTestCase
//
//  Created by Daisy on 2020/9/11.
//

#import "TableViewDataSource.h"

@implementation TableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.numberOfRowsInSectionBlock(tableView,section);
}
-(instancetype)initWithNumberOfRowsInSection:(NumberOfRowsInSectionBlock)block withCellForRowAtIndexPath:(CellForRowAtIndexPath)block1{
     self = [super init];
    if (self) {
        self.numberOfRowsInSectionBlock =block;
        self.cellForRowAtIndexPathBlock=block1;
    }
    return self;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return self.cellForRowAtIndexPathBlock(tableView,indexPath);
}
@end
