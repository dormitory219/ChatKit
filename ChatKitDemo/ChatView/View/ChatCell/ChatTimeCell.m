//
//  ChatTimeCell.m
//  KeyBoardView
//
//  Created by 余强 on 16/3/22.

//

#import "ChatTimeCell.h"


@interface ChatTimeCell ()

@property(nonatomic,strong) UILabel *timeLabel;

@end


@implementation ChatTimeCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
        self.timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetWidth(self.frame)/2-80,5, 150, 20)];

        self.timeLabel.font = [UIFont systemFontOfSize:12];
        self.timeLabel.textAlignment = NSTextAlignmentCenter;
        self.timeLabel.textColor = [UIColor whiteColor];
        self.timeLabel.clipsToBounds = YES;
        self.timeLabel.backgroundColor = [[UIColor lightGrayColor]colorWithAlphaComponent:0.8];
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
