//
//  MoreViewBtn.m
//  KeyBoardView
//
//  Created by 余强 on 16/3/21.

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
