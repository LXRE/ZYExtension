//
//  TableViewDataSource.m
//  FBSnapshotTestCase
//
//  Created by Daisy on 2020/9/11.
//

#import "TableViewDataSource.h"

@implementation TableViewDataSource


+(instancetype)init{
    return [[self alloc]init];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.numberOfRowsInSectionBlock(tableView,section);
}
-(TableViewDataSource*(^)(NumberOfRowsInSectionBlock block))numberOfRowsInSection{
    return ^(NumberOfRowsInSectionBlock block){
        self.numberOfRowsInSectionBlock=block;
        return self;
    };
}
-(TableViewDataSource*(^)(CellForRowAtIndexPathBlock block))cellForRowAtIndexPath{
    return ^(CellForRowAtIndexPathBlock block){
        self.cellForRowAtIndexPathBlock=block;
        return self;
    };
}
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return self.cellForRowAtIndexPathBlock(tableView,indexPath);
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.numberOfSectionsInTableViewBlock(tableView);
}
-(TableViewDataSource*(^)(NumberOfSectionsInTableViewBlock block))numberOfSectionsInTableView{
    return ^(NumberOfSectionsInTableViewBlock block){
        self.numberOfSectionsInTableViewBlock=block;
        return self;
    };
}
- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.titleForHeaderInSectionBlock(tableView,section);
}
-(TableViewDataSource*(^)(TitleForHeaderInSectionBlock block))titleForHeaderInSection{
    return ^(TitleForHeaderInSectionBlock block){
        self.titleForHeaderInSectionBlock=block;
        return self;
    };
}
-(TableViewDataSource*(^)(TitleForFooterInSectionBlock block))titleForFooterInSection{
    return ^(TitleForFooterInSectionBlock block){
        self.titleForFooterInSectionBlock = block;
        return self;
    };
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.canEditRowAtIndexPathBlock(tableView,indexPath);
}
-(TableViewDataSource*(^)(CanEditRowAtIndexPathBlock block))canEditRowAtIndexPath{
    return ^(CanEditRowAtIndexPathBlock block){
        self.canEditRowAtIndexPathBlock = block;
        return self;
    };
}
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.canMoveRowAtIndexPathBlock(tableView,indexPath);
}
-(TableViewDataSource*(^)(CanMoveRowAtIndexPathBlock block))canMoveRowAtIndexPath{
    return ^(CanMoveRowAtIndexPathBlock block){
        self.canMoveRowAtIndexPathBlock =block;
        return self;
    };
}
- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return self.sectionIndexTitlesForTableViewBlock(tableView);
}
-(TableViewDataSource*(^)(SectionIndexTitlesForTableViewBlock block))sectionIndexTitlesForTableView{
    return ^(SectionIndexTitlesForTableViewBlock block){
        self.sectionIndexTitlesForTableViewBlock = block;
        return self;
    };
}
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    return self.sectionForSectionIndexTitleBlock(tableView,title,index);
}
-(TableViewDataSource*(^)(SectionForSectionIndexTitleBlock block))sectionForSectionIndexTitle{
    return ^(SectionForSectionIndexTitleBlock block){
        self.sectionForSectionIndexTitleBlock=block;
        return self;
    };
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.commitEditingStyleBlock(tableView,editingStyle,indexPath);
}
-(TableViewDataSource*(^)(CommitEditingStyleBlock block))commitEditingStyle{
    return ^(CommitEditingStyleBlock block){
        self.commitEditingStyleBlock=block;
        return self;
    };
}
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    return self.moveRowAtIndexPathBlock(tableView,sourceIndexPath,destinationIndexPath);
}
-(TableViewDataSource*(^)(MoveRowAtIndexPathBlock block))moveRowAtIndexPath{
    return ^(MoveRowAtIndexPathBlock block){
        self.moveRowAtIndexPathBlock=block;
        return self;
    };
}
@end
