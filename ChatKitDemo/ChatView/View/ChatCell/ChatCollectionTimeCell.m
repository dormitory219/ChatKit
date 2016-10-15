//
//  ChatCollectionTimeCell.m
//  KeyBoardView
//
//  Created by 余强 on 16/3/25.
//  Copyright © 2016年 你好，我是余强，一位来自上海的ios开发者，现就职于bdcluster(上海大数聚科技有限公司)。这个工程致力于完成一个优雅的IM实现方案. All rights reserved.
//

#import "ChatCollectionTimeCell.h"


@interface ChatCollectionTimeCell ()

@property(nonatomic,strong) UILabel *timeLabel;

@end



@implementation ChatCollectionTimeCell

- (void)awakeFromNib {
    // Initialization code
}




- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetWidth(self.frame)/2-80,5, 150, 20)];
        self.timeLabel.font = [UIFont systemFontOfSize:12];
        self.timeLabel.textAlignment = NSTextAlignmentCenter;
        self.timeLabel.textColor = [UIColor whiteColor];
        self.timeLabel.clipsToBounds = YES;
        self.timeLabel.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.45];
        self.timeLabel.layer.cornerRadius = 10;
        [self addSubview:self.timeLabel];
        
    }
    return self;
}

- (void)setTime:(NSString *)time
{
    _time = time;
    self.timeLabel.text = _time;
}
@end
