//
//  ChatCollectionTimeCell.m
//  KeyBoardView
//
//  Created by joy_yu on 16/3/25.

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
