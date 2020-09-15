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
@end
