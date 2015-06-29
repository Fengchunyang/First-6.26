//
//  ZaoWuZhu1ViewController.m
//  First
//
//  Created by lanouhn on 15/6/27.
//  Copyright (c) 2015年 Feng Chunyang. All rights reserved.
//

#import "ZaoWuZhu1ViewController.h"
#import "ViceChinaDataModel.h"
@interface ZaoWuZhu1ViewController ()<UITableViewDataSource , UITableViewDelegate , NetWorkEngineDelegate>

@property (nonatomic , retain)NSMutableArray *arr;
@property (nonatomic , retain)NSMutableDictionary *bigDic;
@end

@implementation ZaoWuZhu1ViewController

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
    [self getDataFromUrl:kViceChina];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSDictionary *dic = [NSDictionary dictionary];
    
    NSDictionary  *dic = [self.arr objectAtIndex:indexPath.row];
    NSLog(@"%@" , dic);
    ViceChinaDataModel *model = [[ViceChinaDataModel alloc]initWithDictionary:dic];
    NSLog(@"%@ , %@ , %@" , model.images , model.title , model.preview);
    
    NSString *cellID = @"cellID";
    
    
    ViceChinaModelCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (nil == cell) {
        cell = [[ViceChinaModelCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        
    }
    
    [cell.imaView sd_setImageWithURL:[NSURL URLWithString:model.images]];
    cell.label1.text = model.title;
    cell.label2.text = model.preview;
//    NSLog(@"%@" , cell);
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ViceChinaModelCell *cell = (ViceChinaModelCell *)[self tableView:self.tableView cellForRowAtIndexPath:indexPath];
    [cell calculateHeight];
    return cell.frame.size.height;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (void)getDataFromUrl:(NSString *)url
{
    NSURL *Url = [NSURL URLWithString:url];
   
    NetWorkEngine *engine = [NetWorkEngine engineWithURL:Url parameters:nil deleagte:self];
    [engine start];
}
- (void)netWorkDidFinishLoading:(NetWorkEngine *)engine withInfo:(id)info
{
    NSData *data = (NSData *)info;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    self.bigDic = [dic objectForKey:@"data"];
    self.arr = [self.bigDic objectForKey:@"items"];
//    NSLog(@"%@" , self.arr);
    [self.tableView reloadData];
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
    _arr = nil;
    _bigDic = nil;
    [_tableView release];
    [super dealloc];
}
@end
