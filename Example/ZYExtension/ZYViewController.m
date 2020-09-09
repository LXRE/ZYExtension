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

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
