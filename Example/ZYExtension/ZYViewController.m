//
//  ZYViewController.m
//  ZYExtension
//
//  Created by lixian on 09/09/2020.
//  Copyright (c) 2020 lixian. All rights reserved.
//

#import "ZYViewController.h"
#import <ZYExtension.h>
@interface ZYViewController ()

@end

@implementation ZYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    UIView *v=[[UIView alloc]initWithFrame:CGRectMake(20, 200, 100, 100)];
    v.backgroundColor=[UIColor colorWithHexString:@"#000000" alpha:1];
    
    [self.view addSubview:v];
    NSString *str=@"12312414324233242345";
    NSString *dese=str.toDESEncryptForKey(@"11111");
    NSString *desd=dese.toDESDecryptForKey(@"11111");
    NSLog(@"dese:%@",dese);
    NSLog(@"desd:%@",desd);
    UIView *v1=UIView.init.setBorderWidth(2)
              .setBorderColor(UIColor.redColor)
              .setClipsToBounds(YES)
              .setFrame(100,100,100,100)
              .setBackgroundColor(UIColor.blueColor);
    self.view.addSubView(v1);
    
    UIButton *btn= UIButton.initWithType(UIButtonTypeSystem)
    .setTitle(@"测试",UIControlStateNormal)
    .addTarget(self,@selector(btnClick),UIControlEventTouchUpInside);
    btn.setFrame(100,300,100,100)
    .setBackgroundColor(UIColor.greenColor)
    .setBorderColor(UIColor.blackColor)
    .setBorderWidth(2);
    
    self.view.addSubView(btn);
}
-(void)btnClick{
    
    NSLog(@"123412");
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
