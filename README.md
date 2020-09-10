# ZYExtension


## Example
    //链式编程
    UIView *v1=UIView.init.setBorderWidth(2)
              .setBorderColor(UIColor.redColor)
              .setClipsToBounds(YES)
              .setFrame(100,100,100,100)
              .setBackgroundColor(UIColor.blueColor);
    self.view.addSubView(v1);
    //des加密
    NSString *dese=str.toDESEncryptForKey(@"11111");
    //des解密
    NSString *desd=dese.toDESDecryptForKey(@"11111");
  
## Installation

```ruby
pod 'ZYExtension',:git => 'https://github.com/LXRE/ZYExtension.git'
```
## 内容
1.控件链式编程/n
2.时间格式化/n
3.常用编解码 base64,md5,des加解密，判断手机号、email/n
4.颜色类别，十六进制颜色/n
