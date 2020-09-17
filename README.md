# ZYExtension
## Content
```
1.控件链式编程;
2.时间格式化;
3.常用编解码 base64,md5,des加解密，判断手机号、email;
4.颜色类别，十六进制颜色;
5.UIImage、UIImageView、UITextFiled等常用类别
```

## Example
    //链式编程
    UIView *v1=UIView.init.setBorderWidth(2)
              .setBorderColor(UIColor.redColor)
              .setClipsToBounds(YES)
              .setFrame(100,100,100,100)
              .setBackgroundColor(UIColor.blueColor);
    self.view.addSubView(v1);
    
    UIButton *btn= UIButton.initWithType(UIButtonTypeSystem)
    .setTitle(@"测试",UIControlStateNormal)
    .click(^(UIButton*btn){
        NSLog(@"点击了");
    });
     btn.setFrame(100,300,100,100)
        .setBackgroundColor(UIColor.greenColor)
        .setBorderColor(UIColor.blackColor)
        .setBorderWidth(2);
    
    //des加密
    NSString *dese=str.toDESEncryptForKey(@"11111");
    
    //des解密
    NSString *desd=dese.toDESDecryptForKey(@"11111");
    
    //base64编码
    NSString *base64Str=str.toBase64String();
    
    //base64解码
    NSString *base64DesStr=base64Str.base64ToString();
    
    //md5 加密
    NSString *md5Str=str.toMD5ForLower32BateString();
    
    //十六进制颜色
    UIColor *color=UIColor.colorWithHexString(@"#ffffff");
    
    //是否是银行卡
    BOOL isBankCard= str.IsBankCard();
    
    //是否是Email
    BOOL isEmail=str.IsEmailAdress();
    
    //是否是手机号
    BOOL isPhoneNum=str.IsPhoneNumber();
    //TableViewDataSource类整合
     tableView.dataSource=TableViewDataSource.init
    .numberOfRowsInSection(^NSInteger(UITableView *tableView,NSInteger section){
        return 111;
    })
    .cellForRowAtIndexPath(^UITableViewCell*(UITableView *tableView,NSIndexPath *indexPath){
        return tableView.dequeueReusableCellWithIdentifier(@"123");
    })
    .titleForHeaderInSection(^NSString*(UITableView *tableView,NSInteger section){
        return @"123";
    })
    .titleForFooterInSection(^NSString*(UITableView *tableView,NSInteger section){
        return @"q3ada";
    });
    //代理类整合
    tableView.delegate=TableviewDelegate.init
    .heightForRowAtIndexPath(^CGFloat(UITableView *tableView,NSIndexPath *indexPath){
        return 11;
    })
    .didSelectRowAtIndexPath(^(UITableView *tableView,NSIndexPath *indexPath){
        
    });
## Installation

```ruby
pod 'ZYExtension',:git => 'https://github.com/LXRE/ZYExtension.git'

引用
    #import <ZYExtension.h>
```


