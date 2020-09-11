//
//  UITableViewCell+Category.m
//  FBSnapshotTestCase
//
//  Created by Daisy on 2020/9/11.
//

#import "UITableViewCell+Category.h"

@implementation UITableViewCell (Category)

-(UITableViewCell *(^)(UITableViewCellSelectionStyle style))setSelectionStyle{
    return ^(UITableViewCellSelectionStyle style){
        self.selectionStyle =style;
        return self;
    };
}

-(UITableViewCell *(^)(UITableViewCellAccessoryType style))setAccessoryType{
    return ^(UITableViewCellAccessoryType type){
        self.accessoryType =type;
        return self;
    };
}

@end
