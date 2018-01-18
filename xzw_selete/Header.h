//
//  Header.h
//  Homies
//
//  Created by VVVVVVVVVV on 2017/10/23.
//  Copyright © 2017年 huchenchen. All rights reserved.
//

#ifndef Header_h
#define Header_h

#define selectCellHeight  40
/*
 自定义宏
 */
//宽高
#define WIDTH [UIScreen mainScreen].bounds.size.width
//#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define _mx [UIScreen mainScreen].bounds.size.width/375
//#define my [UIScreen mainScreen].bounds.size.height/667
#define _my [UIScreen mainScreen].bounds.size.width/375
#define HEIGHT ({CGFloat height; if([UIScreen mainScreen].bounds.size.height == 812) {height = [UIScreen mainScreen].bounds.size.height-34;} else {height = [UIScreen mainScreen].bounds.size.height;} height;})

#define NavHeight ({CGFloat height; if([UIScreen mainScreen].bounds.size.height == 812) {height = 88;} else {height = 64;} height;})




//自定义Frame
#define Frame(x,y,w,h)   CGRectMake(x, y, w, h)
#define rectMaxX(x)      CGRectGetMaxX(x)
#define rectMaxY(y)      CGRectGetMaxY(y)






#endif /* Header_h */
