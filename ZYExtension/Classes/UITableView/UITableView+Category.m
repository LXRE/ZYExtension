//
//  UITableView+Category.m
//  FBSnapshotTestCase
//
//  Created by Daisy on 2020/9/11.
//

#import "UITableView+Category.h"

@implementation UITableView (Category)
-(UITableView *(^)(CGRect frame,UITableViewStyle style))initWithFrameAndStyle{
    return ^(CGRect frame,UITableViewStyle style){
        return [[UITableView alloc]initWithFrame:frame style:UITableViewStylePlain];
    };
}
-(UITableView *(^)(UITableViewCellSeparatorStyle style))setSeparatorStyle{
    return ^(UITableViewCellSeparatorStyle style){
        self.separatorStyle=style;
        return self;
    };
}
-(UITableView *(^)(UIColor *color))setSeparatorColor{
    return ^(UIColor *color){
        self.separatorColor=color;
        return self;
    };
}
-(UITableView *(^)(float height))setRowHeight{
    return ^(float height){
        self.rowHeight=height;
        return self;
    };
}
-(UITableView *(^)(UIView* view))setTableHeaderView{
    return ^(UIView* view){
        self.tableHeaderView=view;
        return self;
    };
}
-(UITableView *(^)(UIView* view))setTableFooterView{
    return ^(UIView* view){
        self.tableFooterView=view;
        return self;
    };
}
-(UITableView *(^)(Class nClass,NSString *identifier))registerClassForCellReuseIdentifier{
    return ^(Class nClass,NSString *identifier){
        [self registerClass:nClass forCellReuseIdentifier:identifier];
        return self;
    };
}

-(UITableView *(^)(UINib *nib,NSString *identifier))registerNibForCellReuseIdentifier{
    return ^(UINib *nib,NSString *identifier){
        [self registerNib:nib forCellReuseIdentifier:identifier];
        return self;
    };
}
-(UITableView *(^)(id<UITableViewDelegate>   delegate))setDelegate{
    return ^(id<UITableViewDelegate> delegate){
        self.delegate=delegate;
        return self;
    };
}
-(UITableView *(^)(id<UITableViewDataSource> dataSource))setDataSource{
    return ^(id<UITableViewDataSource>   dataSource){
        self.dataSource=dataSource;
        return self;
    };
}

-(UITableViewCell*(^)(NSString *identifier))dequeueReusableCellWithIdentifier{
    return ^(NSString *identifier){
        return [self dequeueReusableCellWithIdentifier:identifier];
    };
}
@end
