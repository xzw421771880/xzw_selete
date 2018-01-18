//
//  SelectScrollView.m
//  selectDemo
//
//  Created by mc on 2017/11/25.
//  Copyright © 2017年 mc. All rights reserved.
//

#import "SelectScrollView.h"
#import "UILabel+HuaZhi.h"
#import "SelectTableViewCell.h"

@implementation SelectScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame andArray:(NSArray *)ary andDisAry:(NSMutableArray *)disary
{
    if (self=[super initWithFrame:frame]) {
        self.backgroundColor=[UIColor whiteColor];
        self.scrollEnabled =YES;
    
        [self log];
        self.distoryArray=disary;
        [self addLabelwithAry:ary];
    }
    
    return self;
}

//热门搜索log
-(void)log{
    UILabel *log=[[UILabel alloc]initWithFrame:Frame(10, 10, 150, 30)];
    log.text=@"热门搜索";
    [self addSubview:log];
}

//热门搜索
-(void)addLabelwithAry:(NSArray *)ary{
    CGSize orgxy=CGSizeMake(10, 50);
    for (int i=0; i<ary.count; i++) {
        UILabel *logLabel=[[UILabel alloc] init];
        logLabel.text=ary[i];
        orgxy=[logLabel nextOrgin:orgxy];//适配
        [logLabel addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tagDidCLick:)]];
        logLabel.userInteractionEnabled=YES;
        [self addSubview:logLabel];
    }
    [self addtableView:orgxy];
}


//添加tableView
-(void)addtableView:(CGSize)size
{
    _distoryTitle=[[UIView alloc]initWithFrame:Frame(0, size.height+40, WIDTH, 30)];
    [self addSubview:self.distoryTitle];
    UILabel *log=[[UILabel alloc]initWithFrame:Frame(10, 0, 150, 30)];
    log.text=@"历史搜索";
    [self.distoryTitle addSubview:log];
    
    UILabel *employ=[[UILabel alloc]initWithFrame:Frame(WIDTH-60, 0, 40, 30)];
    employ.text=@"清空";
    [employ addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clean:)]];
    employ.userInteractionEnabled=YES;
    [self.distoryTitle addSubview:employ];
    
    
    
    self.distoryTableView=[[UITableView alloc]initWithFrame:Frame(0, size.height+80, WIDTH, self.distoryArray.count*selectCellHeight) style:UITableViewStylePlain];
    self.distoryTableView.backgroundColor=[UIColor redColor];
    self.distoryTableView.scrollEnabled =NO;//禁止滚动
    [self.distoryTableView registerClass:[SelectTableViewCell class] forCellReuseIdentifier:@"SelectTableViewCell"];
    [self addSubview:self.distoryTableView];
    [self conFrame];
}
#pragma mark - tap
//热门标签点击相应
-(void)tagDidCLick:(UITapGestureRecognizer *)sender
{
    UILabel *label=(UILabel *)sender.view;
    NSLog(@"text===%@",label.text);
    if (self.labelDelegate&&[self.labelDelegate respondsToSelector:@selector(labelText:)]) {
        [self.labelDelegate labelText:label.text];
    }
}

-(void)clean:(UITapGestureRecognizer *)sender
{
    [self.distoryArray removeAllObjects];
    [self conFrame];
}


//修改contensize
-(void)conFrame{
    
    //设置tableView的frame
    self.distoryTableView.frame=Frame(0, self.distoryTableView.frame.origin.y, WIDTH, self.distoryArray.count*selectCellHeight);
    
    //设置contensize
    if(self.distoryTableView.frame.origin.y+self.distoryArray.count*selectCellHeight>self.frame.size.height) {
        self.contentSize=CGSizeMake(0, self.distoryTableView.frame.origin.y+self.distoryArray.count*selectCellHeight);
    }else{
        self.contentSize=CGSizeMake(0, self.frame.size.height);
    }
    
    //是否隐藏
    if (self.distoryArray.count==0) {
        self.distoryTitle.hidden=YES;
    }else{
        self.distoryTitle.hidden=NO;
    }
    [self.distoryTableView reloadData];
    
}

//变更历史搜索
-(void)addWithString:(NSString *)str
{
    for (int i=0; i<self.distoryArray.count; i++) {
        if ([str isEqualToString:self.distoryArray[i]]) {
            [self.distoryArray removeObjectAtIndex:i];
            break;
        }
    }
    [self.distoryArray insertObject:str atIndex:0];
    [self conFrame];
}




@end
