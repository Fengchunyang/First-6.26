//
//  ZaoWuZhu2ViewController.m
//  First
//
//  Created by lanouhn on 15/6/29.
//  Copyright (c) 2015年 Feng Chunyang. All rights reserved.
//

#import "ZaoWuZhu2ViewController.h"

@interface ZaoWuZhu2ViewController ()<UITableViewDataSource , UITableViewDelegate>

@property(nonatomic , retain)NSMutableArray *arr;
@property (nonatomic , retain)NSMutableDictionary *bigDic;
@end

@implementation ZaoWuZhu2ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.view = self.tableView;
    [self.tableView release];
    self.arr = [NSMutableArray array];
    self.bigDic = [NSMutableDictionary dictionary];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WeiJueModelCell *cell = (WeiJueModelCell *)[self tableView:self.tableView cellForRowAtIndexPath:indexPath];
    
    return cell.frame.size.height;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arr.count;
}
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID = @"cellID";
    
    WeiJueModelCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (nil == cell) {
        cell = [[WeiJueModelCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        
    }
//    cell.mainpicView sd_setImageWithURL:<#(NSURL *)#>
    return cell;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)getDataFromURL
{
    //1.创建网址字符串
    
    //2.创建URL对象
    NSURL *url = [NSURL URLWithString:kWeiJueDaShi];
    //3.创建请求对象
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy: NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:30];
    //4.创建参数字符串
    NSString *parmStr = kParmStr;
    //5.将参数字符串转化为NSData
    NSData *strData = [parmStr dataUsingEncoding:NSUTF8StringEncoding];
    NSLog( @"%@" , strData);
    //6.设置请求body
    [request setHTTPBody:strData];
    //7.设置请求方法
    [request setHTTPMethod:@"POST"];
    
    //8.链接请求
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (connectionError) {
            NSLog(@"********%@" , connectionError);
        }else{
            //开始解析数据
            [self parmJsonData:data];
        }
    }];
    

}
- (void)parmJsonData:(NSData *)data
{
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSLog(@"%@" , dic);
}
- (void)dealloc
{
    _arr = nil;
    _bigDic = nil;
    [_tableView release];
    [super dealloc];
}
@end
