//
//  ZaoWuzhuViewController.m
//  First
//
//  Created by lanouhn on 15/6/26.
//  Copyright (c) 2015年 Feng Chunyang. All rights reserved.
//

#import "ZaoWuzhuViewController.h"

@interface ZaoWuzhuViewController ()

@end

@implementation ZaoWuzhuViewController
- (void)loadView
{
    self.tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.view = self.tableView;
    self.tableView.backgroundColor = [UIColor blackColor];
    [self.tableView release];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"造物主";
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    
    
    
    
    
    self.imageArr = @[ @"VICE中国" ,@"创想计划" ,@"良仓", @"煎蛋" , @"外滩画报" , @"网易新闻" , @"映像新闻" ,];
    
    self.nameArr = @[@"VICE中国"  , @"创想计划" ,@"良仓"  , @"煎蛋" , @"外滩画报" , @"网易新闻"  , @"映像新闻" , ];
    
    
    
    NSString *str1 = @"良仓是一款生活应用类的软件。在这里，什么的都是精选的。良仓帮你找到最适合的东西。这里集合一群有品位的买手，帮你解决生活上的难题";
    NSString *str2 = @"煎蛋以译介方式传播网络新鲜资讯";
    NSString *str3 = @"《外滩画报》官方微信，由外滩画报新媒体编辑部倾力打造";
    NSString *str4 = @"网易新闻是网易倾力打造的精品应用，已然成为国内第一新闻客户端，因体验最流畅、新闻最快速、评论最犀利而备受推崇";
    NSString *str5 = @"映象新闻客户端是由河南重点新闻网站映象网，官方精心打造的手机新闻阅读软件";
    NSString *str6 = @"VICE中国 | 全球青年文化之声：世界在下沉，我们狂欢";
    NSString *str7 = @"VICE旗下的艺术频道。与intel一同呈现全球顶尖艺术与科技的探索平台";
    self.introArr = @[ str6 , str7 ,str1 , str2 , str3 , str4 ,  str5 ];
   
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZaoWuZhu1ViewController *zao1 = [[ZaoWuZhu1ViewController alloc]init];
    zao1.indexPath = indexPath;
    [self.navigationController pushViewController:zao1 animated:YES];
    [zao1 release];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.nameArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    ZaoWuZhuModelCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (nil == cell) {
        cell = [[ZaoWuZhuModelCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        cell.label1.text = self.nameArr[indexPath.row];
        cell.label2.text = self.introArr[indexPath.row];
        cell.imaView.image = [UIImage imageNamed:[self.imageArr objectAtIndex:indexPath.row] ];
    }
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
- (void)dealloc
{
    _nameArr = nil;
    _imageArr = nil;
    _introArr = nil;
    
    [_tableView release];
    [super dealloc];
}
@end
