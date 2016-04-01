//
//  MoreViewBtn.m
//  KeyBoardView
//
//  Created by 余强 on 16/3/21.
//  Copyright © 2016年 你好，我是余强，一位来自上海的ios开发者，现就职于bdcluster(上海大数聚科技有限公司)。这个工程致力于完成一个优雅的IM实现方案. All rights reserved.
//

#import "MoreViewBtn.h"
#import "KeyBoardHeader.h"
#define KMargin 2
#define KBtnWidth 60

@implementation MoreViewBtn


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:14];
            
    }
    return self;
}


- (void)layoutSubviews
{
    
    [super layoutSubviews];
    
    
    self.imageView.frame = CGRectMake(self.width0/2-KBtnWidth/2, 0, KBtnWidth, KBtnWidth);
    self.titleLabel.frame = CGRectMake(0, CGRectGetMaxY(self.imageView.frame), self.width0, 30);

    
}

@end
