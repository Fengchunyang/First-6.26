//
//  ThirdViewController.h
//  First
//
//  Created by lanouhn on 15/6/25.
//  Copyright (c) 2015年 Feng Chunyang. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NetWorkEngine.h"
#import "Third1ViewController.h"
#import "UIImageView+WebCache.h"
@interface ThirdViewController : UIViewController<UITableViewDataSource , UITableViewDelegate>
@property (nonatomic , retain)UITableView *tableView;
@property (nonatomic , retain)NSDictionary *bigDic;
@property (nonatomic , retain)NSMutableArray *arr;
@property (nonatomic , retain)ThirdPageModelCell *PageCell;
@property (nonatomic , retain)ThirdModelCell *ModelCell;

@end
