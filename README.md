# ZYExtension
## Content
```
1.控件链式编程;
2.时间格式化;
3.常用编解码 base64,md5,des加解密，判断手机号、email;
4.颜色类别，十六进制颜色;
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
    还有其他类的类别等等……
## Installation

```ruby
pod 'ZYExtension',:git => 'https://github.com/LXRE/ZYExtension.git'

引用
    #import <ZYExtension.h>
```


