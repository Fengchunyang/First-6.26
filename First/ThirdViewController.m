//
//  ThirdViewController.m
//  First
//
//  Created by lanouhn on 15/6/25.
//  Copyright (c) 2015年 Feng Chunyang. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()<NetWorkEngineDelegate>
@property (nonatomic , assign)NSString* Hot;
@end

@implementation ThirdViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
_tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview: _tableView];
    
    [_tableView release];
    self.bigDic = [NSDictionary dictionary];
    
    
    self.arr = [NSMutableArray array];

    //创建网址字符串
    NSString *UrlStr = @"http://mmmono.com/api/category/all?page=1";
    //创建URL对象
    NSURL *url = [NSURL URLWithString:UrlStr];

    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    NetWorkEngine *net = [NetWorkEngine engineWithURL:url parameters:nil deleagte:self];
    
    [net start];
        //设置代理
   
    
    
    
}

- (void)netWorkDidFinishLoading:(NetWorkEngine *)engine withInfo:(id)info
{
    NSData *data = (NSData *)info;
    //大字典
        self.bigDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@" , self.bigDic);
    //字典里的大数组
    self.arr = [self.bigDic objectForKey:@"items"];
    NSLog(@"%@" , self.arr);
    

    [self.tableView reloadData];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        return self.arr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    DataModel *model = [[DataModel alloc]init];
    
    model.ImageView = [[[self.arr objectAtIndex:indexPath.row] objectForKey:@"image"] objectForKey:@"raw"];
    
    model.title = [[self.arr objectAtIndex:indexPath.row] objectForKey:@"title"];
    
    model.text = [[[self.arr objectAtIndex:indexPath.row] objectForKey:@"text"] objectForKey:@"text"];
    NSString *str1 =[[[self.arr objectAtIndex:indexPath.row] objectForKey:@"user"]objectForKey:@"screen_name"];

    NSString *str2 = [[[self.arr objectAtIndex:indexPath.row] objectForKey:@"program" ]objectForKey:@"name"];
    model.label1Text = [NSString stringWithFormat:@"%@-%@" , str2 , str1];
    
    NSLog(@"%@" , model.text);
    
    _Hot = [[self.arr objectAtIndex:indexPath.row] objectForKey:@"hot"];
   
    NSLog(@"%@" , _Hot);
    
//    if ([_Hot isEqual:@"1"]) {
    
    if ([_Hot integerValue] == 1) {

    
    
        NSString *cellID = @"cellID";
        
        ThirdModelCell *cell1 = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (nil == cell1) {
            
            cell1 = [[ThirdModelCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
            
        }
        
        NSURL *imageUrl = [NSURL URLWithString:model.ImageView];
        NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
        
        cell1.imaView.image = [UIImage imageWithData:imageData];
        cell1.label1.text = model.title;
        cell1.label2.text = model.text;
        
        
        [cell1  calculateHeight];

        return cell1;
    }
    else {
        NSString *cellId = @"cellId";
        ThirdPageModelCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (nil == cell) {
            cell = [[ThirdPageModelCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
        }
        NSURL *imageUrl = [NSURL URLWithString:model.ImageView];
        NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
        cell.imaView.image = [UIImage imageWithData:imageData];
        cell.label1.text = model.label1Text;
        cell.label2.text = model.title;
        [cell calculateHeight];
        return cell;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    

     if ([_Hot integerValue] == 1) {

        _ModelCell = (ThirdModelCell *)[self tableView:self.tableView cellForRowAtIndexPath:indexPath];
        [_ModelCell calculateHeight];

        return _ModelCell.frame.size.height;
    }else{
        
        _PageCell = (ThirdPageModelCell *)[self tableView:self.tableView cellForRowAtIndexPath:indexPath];
        [_PageCell calculateHeight];

        return _PageCell.frame.size.height;
    }
    
    
    
    
    

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
    [_ModelCell release];
    [_PageCell release];
    _arr = nil;
    _bigDic = nil;
    [_tableView release];
    [super dealloc];
}
@end