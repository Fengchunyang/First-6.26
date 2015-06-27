//
//  Third1ViewController.m
//  First
//
//  Created by lanouhn on 15/6/27.
//  Copyright (c) 2015年 Feng Chunyang. All rights reserved.
//

#import "Third1ViewController.h"

@interface Third1ViewController ()<NetWorkEngineDelegate>
@property (nonatomic , retain)MBProgressHUD *HUD;



@property (nonatomic , retain)NSMutableArray *arr;
@property (nonatomic , retain)NSMutableDictionary *bigDic;

@end

@implementation Third1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    self.webView1 = [[UIWebView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.view = self.webView1;
    [self.webView1 release];
    
    self.arr = [NSMutableArray array];
    self.bigDic = [NSMutableDictionary dictionary];
    
    NSString *str = @"http://mmmono.com/api/category/all?page=1";
    NSURL *url = [NSURL URLWithString:str];
    NetWorkEngine *engin = [NetWorkEngine  engineWithURL:url parameters:nil deleagte:self];
    [engin start];

    
    
    
    
}

- (void)downLoding
{
    _HUD = [[MBProgressHUD alloc]initWithView:self.view];
    [self.view.window addSubview:_HUD];
    
    _HUD.labelText = @"玩命加载中.....";
    [_HUD show:YES];
    NSURL *reqUrl = [NSURL URLWithString:self.link];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:reqUrl];
    NSLog(@"request = %@" , request);
    [self.webView1 loadRequest:request];
    [_HUD hide:YES];
    [_HUD release];
}

- (void)netWorkDidFinishLoading:(NetWorkEngine *)engine withInfo:(id)info
{
    NSData *data = (NSData *)info;
    self.bigDic = [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingMutableContainers error:nil];
    self.arr = [self.bigDic objectForKey:@"items"];
//    NSLog(@"%@" , self.arr);
    self.link = [[self.arr objectAtIndex:self.indexPath.row] objectForKey:@"link"];
    NSLog(@"self.link = %@" , self.link);
     [self downLoding];

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
- (void)dealloc
{
    [_HUD release];
    _indexPath = nil;
    _link = nil;
    _arr = nil;
    _bigDic = nil;
    [_webView1 release];
    [super dealloc];
}
@end
