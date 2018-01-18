//
//  SelectTableViewCell.m
//  selectDemo
//
//  Created by mc on 2017/11/25.
//  Copyright © 2017年 mc. All rights reserved.
//

#import "SelectTableViewCell.h"
#import "Header.h"

@implementation SelectTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addAllViews];
//        [self noOne];
    }
    return self;
}

-(void)addAllViews
{
    self.selCelLbel=[[UILabel alloc]initWithFrame:CGRectMake(5, 0, 150, 40)];
//    self.selCelLbel.backgroundColor=[UIColor grayColor];
    [self addSubview:self.selCelLbel];
    
    self.del=[[UILabel alloc]initWithFrame:CGRectMake(WIDTH-60, 0, 40, 40)];
    //    self.selCelLbel.backgroundColor=[UIColor grayColor];
    self.del.text=@"x";
    [self addSubview:self.del];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
