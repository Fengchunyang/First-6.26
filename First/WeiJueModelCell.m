//
//  WeiJueModelCell.m
//  First
//
//  Created by lanouhn on 15/6/29.
//  Copyright (c) 2015年 Feng Chunyang. All rights reserved.
//

#import "WeiJueModelCell.h"
/*
 @property (nonatomic ,retain)NSString *title;
 @property (nonatomic ,retain)NSString *maketime;
 @property (nonatomic , retain)NSString *short_content;
 @property (nonatomic , retain)NSString *materal;
 @property (nonatomic , retain)NSString *kname;
 @property (nonatomic , retain)NSString *pic;
 @property (nonatomic , retain)NSString *mainpic;
 
 */
@implementation WeiJueModelCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubviews];
    }
    return self;
}
- (void)addSubviews
{
    self.picview = [[UIImageView alloc]initWithFrame:CGRectMake(kSpace, kSpace, 370 - 2 * kSpace, 200)];
    self.picview.backgroundColor = [UIColor redColor];
    
    
    
    self.mainpicView = [[UIImageView alloc]initWithFrame:CGRectMake(self.picview.frame.origin.x, self.picview.frame.origin.y + self.picview.frame.size.height + kSpace, self.picview.frame.size.width, self.picview.frame.size.height)];
    self.mainpicView.backgroundColor = [UIColor grayColor];
    
    
    
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.mainpicView.frame.origin.x, self.mainpicView.frame.origin.y + self.mainpicView.frame.size.height + kSpace, self.mainpicView.frame.size.width, 30)];
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.backgroundColor = [UIColor magentaColor];
    
    
    
    self.short_contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.titleLabel.frame.origin.x, self.titleLabel.frame.origin.y + self.titleLabel.frame.size.height + kSpace, self.titleLabel.frame.size.width, 60)];
    self.short_contentLabel.numberOfLines = 0;
    self.short_contentLabel.backgroundColor =  [UIColor purpleColor];
    
    
    
    self.maketimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.short_contentLabel.frame.origin.x, self.short_contentLabel.frame.size.height + kSpace, self.titleLabel.frame.size.width, 30)];
    self.maketimeLabel.backgroundColor = [UIColor greenColor];
    
    
    self.materalLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.maketimeLabel.frame.origin.x, self.maketimeLabel.frame.origin.y + self.maketimeLabel.frame.size.height + kSpace, self.maketimeLabel.frame.size.width, 50)];
    self.materalLabel.backgroundColor = [UIColor redColor];
    
    self.knameLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.materalLabel.frame.origin.x, self.materalLabel.frame.origin.y + self.materalLabel.frame.size.height + kSpace, self.materalLabel.frame.size.width, 30)];
    
    self.knameLabel.backgroundColor = [UIColor yellowColor];
    
    [self.contentView addSubview:self.materalLabel];
    [self.contentView addSubview:self.maketimeLabel];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.knameLabel];
    [self.contentView addSubview:self.short_contentLabel];
    [self.contentView addSubview:self.picview];
    [self.contentView addSubview:self.mainpicView];
    
    
    [self.mainpicView release];
    [self.materalLabel release];
    [self.titleLabel release];
    [self.knameLabel release];
    [self.short_contentLabel release];
    [self.picview release];
    [self.maketimeLabel release];
    
    
    
    
    self.frame = CGRectMake(0, 0, self.frame.size.width, self.maketimeLabel.frame.size.height + self.materalLabel.frame.size.height + self.mainpicView.frame.size.height + self.titleLabel.frame.size.height + self.picview.frame.size.height + self.knameLabel.frame.size.height + self.short_contentLabel.frame.size.height);
    
    
    
}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc
{
    [_titleLabel release];
    [_mainpicView release];
    [_short_contentLabel release];
    [_materalLabel release];
    [_knameLabel release];
    [_picview release];
    [_maketimeLabel release];
    [super dealloc];
    
    
}

@end
