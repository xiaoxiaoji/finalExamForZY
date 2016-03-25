//
//  mainViewController.m
//  weatherAPP
//
//  Created by AnthonyGeng on 16/3/10.
//  Copyright © 2016年 com.mis.zhao. All rights reserved.
//

#import "mainViewController.h"

@interface mainViewController ()
@property(nonatomic) UIButton *button;
@end

@implementation mainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor=[UIColor orangeColor];
    [self addButtons];
}
-(void)addButtons{
    _button=[[UIButton alloc]initWithFrame:CGRectMake(50, 50, 100, 150)];
    [_button setTitle:@"Click Button" forState:UIControlStateNormal];
    _button.backgroundColor=[UIColor blueColor];
    [_button addTarget:self action:@selector(clickMe) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
}
-(void)clickMe{
    
}
-(void)requestData{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
