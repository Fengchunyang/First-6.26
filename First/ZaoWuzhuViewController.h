//
//  ZaoWuzhuViewController.h
//  First
//
//  Created by lanouhn on 15/6/26.
//  Copyright (c) 2015年 Feng Chunyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZaoWuZhuModelCell.h"
#import "ZaoWuZhuDataModel.h"
@interface ZaoWuzhuViewController : UIViewController<UITableViewDataSource , UITableViewDelegate>
@property(nonatomic , retain)UITableView *tableView;
@property (nonatomic , retain)NSArray *imageArr;
@property (nonatomic , retain)NSArray *nameArr;

@property (nonatomic , retain)NSArray *introArr;
@end
