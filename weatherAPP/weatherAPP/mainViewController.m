//
//  mainViewController.m
//  weatherAPP
//
//  Created by AnthonyGeng on 16/3/10.
//  Copyright © 2016年 com.mis.zhao. All rights reserved.
//

#import "mainViewController.h"
#import <LBBlurredImage/UIImageView+LBBlurredImage.h>
@interface mainViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
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
    NSLog(@"clickme!");
//    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://www.weather.com.cn/data/sk/101010100.html"]];
//    [request setHTTPMethod:@"GET"];
//    NSError *error;
//    NSURLResponse *response;
//    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
//    
//    NSString *str=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    //    NSLog(str);
    NSString *httpUrl = @"http://apis.baidu.com/heweather/weather/free";
    NSString *httpArg = @"city=beijing";
    [self request: httpUrl withHttpArg: httpArg];
    
   }
-(void)request: (NSString*)httpUrl withHttpArg: (NSString*)HttpArg  {
    NSString *urlStr = [[NSString alloc]initWithFormat: @"%@?%@", httpUrl, HttpArg];
    NSURL *url = [NSURL URLWithString: urlStr];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: url cachePolicy: NSURLRequestUseProtocolCachePolicy timeoutInterval: 10];
    [request setHTTPMethod: @"GET"];
    [request addValue: @"e6a8c4c5274ff5502e0b250a66fea555" forHTTPHeaderField: @"apikey"];
    [NSURLConnection sendAsynchronousRequest: request
                                       queue: [NSOperationQueue mainQueue]
                           completionHandler: ^(NSURLResponse *response, NSData *data, NSError *error){
                               if (error) {
                                   NSLog(@"Httperror: %@%ld", error.localizedDescription, error.code);
                               } else {
                                   NSInteger responseCode = [(NSHTTPURLResponse *)response statusCode];
                                   NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                   NSLog(@"HttpResponseCode:%ld", responseCode);
                                   NSLog(@"HttpResponseBody %@",responseString);
                               }
                           }];
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
