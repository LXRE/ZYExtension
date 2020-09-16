//
//  TableviewDelegate.m
//  FBSnapshotTestCase
//
//  Created by Daisy on 2020/9/15.
//

#import "TableviewDelegate.h"

@implementation TableviewDelegate
+(instancetype)init{
    return [[self alloc]init];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.heightForRowAtIndexPathBlock(tableView,indexPath);
}
-(TableviewDelegate*(^)(HeightForRowAtIndexPathBlock block))heightForRowAtIndexPath{
    return ^(HeightForRowAtIndexPathBlock block){
        self.heightForRowAtIndexPathBlock=block;
        return self;
    };
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return self.heightForHeaderInSectionBlock(tableView,section);
}
-(TableviewDelegate*(^)(HeightForHeaderInSectionBlock block))heightForHeaderInSection{
    return ^(HeightForHeaderInSectionBlock block){
        self.heightForHeaderInSectionBlock=block;
        return self;
    };
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
   return self.heightForFooterInSectionBlock(tableView, section);
}
-(TableviewDelegate*(^)(HeightForFooterInSectionBlock block))heightForFooterInSection{
    return ^(HeightForFooterInSectionBlock block){
        self.heightForFooterInSectionBlock=block;
        return self;
    };
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return self.viewForHeaderInSectionBlock(tableView,section);
}
-(TableviewDelegate*(^)(ViewForHeaderInSectionBlock block))viewForHeaderInSection{
    return ^(ViewForHeaderInSectionBlock block){
        self.viewForHeaderInSectionBlock=block;
        return self;
    };
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return self.viewForFooterInSectionBlock(tableView,section);
}
-(TableviewDelegate*(^)(ViewForFooterInSectionBlock block))viewForFooterInSection{
    return ^(ViewForFooterInSectionBlock block){
        self.viewForFooterInSectionBlock=block;
        return self;
    };
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.didSelectRowAtIndexPathBlock(tableView,indexPath);
}
-(TableviewDelegate*(^)(DidSelectRowAtIndexPathBlock block))didSelectRowAtIndexPath{
    return ^(DidSelectRowAtIndexPathBlock block){
        self.didSelectRowAtIndexPathBlock=block;
        return self;
    };
}
- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.shouldIndentWhileEditingRowAtIndexPathBlock(tableView,indexPath);
}
-(TableviewDelegate*(^)(ShouldIndentWhileEditingRowAtIndexPathBlock block))shouldIndentWhileEditingRowAtIndexPath{
    return ^(ShouldIndentWhileEditingRowAtIndexPathBlock block){
        self.shouldIndentWhileEditingRowAtIndexPathBlock=block;
        return self;
    };
}
- (void)tableView:(UITableView *)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.willBeginEditingRowAtIndexPathBlock(tableView,indexPath);
}
-(TableviewDelegate*(^)(WillBeginEditingRowAtIndexPathBlock block))willBeginEditingRowAtIndexPath{
    return ^(WillBeginEditingRowAtIndexPathBlock block){
        self.willBeginEditingRowAtIndexPathBlock=block;
        return self;
    };
}
- (void)tableView:(UITableView *)tableView didEndEditingRowAtIndexPath:(nullable NSIndexPath *)indexPath{
    return self.didEndEditingRowAtIndexPathBlock(tableView,indexPath);
}
-(TableviewDelegate*(^)(DidEndEditingRowAtIndexPathBlock block))didEndEditingRowAtIndexPath{
    return ^(DidEndEditingRowAtIndexPathBlock block){
           self.didEndEditingRowAtIndexPathBlock=block;
           return self;
       };
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.editingStyleForRowAtIndexPathBlock(tableView,indexPath);
}
-(TableviewDelegate*(^)(EditingStyleForRowAtIndexPathBlock block))editingStyleForRowAtIndexPath{
    return ^(EditingStyleForRowAtIndexPathBlock block){
              self.editingStyleForRowAtIndexPathBlock=block;
              return self;
          };
}
- (nullable UITableViewHeaderFooterView *)headerViewForSection:(NSInteger)section{
    return self.headerViewForSectionBlock(section);
}
-(TableviewDelegate*(^)(HeaderViewForSectionBlock block))headerViewForSection{
    return ^(HeaderViewForSectionBlock block){
        self.headerViewForSectionBlock=block;
        return self;
    };
}
- (nullable UITableViewHeaderFooterView *)footerViewForSection:(NSInteger)section{
    return self.footerViewForSectionBlock(section);
}
-(TableviewDelegate*(^)(FooterViewForSectionBlock block))footerViewForSection{
    return ^(FooterViewForSectionBlock block){
        self.footerViewForSectionBlock=block;
        return self;
    };
}
@end
