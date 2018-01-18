//
//  SelectScrollView.h
//  selectDemo
//
//  Created by mc on 2017/11/25.
//  Copyright © 2017年 mc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Header.h"
@protocol SelectScrollViewDelegate <NSObject>
-(void)labelText:(NSString *)str;//代理方法
//-(void)HCCTopButtonLongLineAction:(NSInteger)index;//代理方法
@end


@interface SelectScrollView : UIScrollView
@property(nonatomic,weak)id<SelectScrollViewDelegate> labelDelegate;
@property(nonatomic,strong)NSMutableArray *distoryArray;//历史数组
@property(nonatomic,strong)UITableView *distoryTableView;//历史tableview
@property(nonatomic,strong)UIView *distoryTitle;//历史标题

-(instancetype)initWithFrame:(CGRect)frame andArray:(NSArray *)ary andDisAry:(NSMutableArray *)disary;

//修改contensize
-(void)conFrame;

//变更搜索历史
-(void)addWithString:(NSString *)str;

@end
