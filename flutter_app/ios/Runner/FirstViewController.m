//
//  FirstViewController.m
//  Runner
//
//  Created by xiaobao on 2019/9/9.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 200, 50)];
    [button setTitle:@"返回flutter页面" forState:(UIControlStateNormal)];
    [button setTitleColor:[UIColor blueColor] forState:(UIControlStateNormal)];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(back:) forControlEvents:(UIControlEventTouchUpInside)];
    // Do any additional setup after loading the view from its nib.
}

-(void)back:(UIButton *)button{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
