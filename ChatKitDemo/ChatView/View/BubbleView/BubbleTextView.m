//
//  BubbleTextView.m
//  KeyBoardView
//
//  Created by 余强 on 16/3/21.

//

#import "BubbleTextView.h"

#define Kfont [UIFont systemFontOfSize:14]



@interface BubbleTextView ()<MLEmojiLabelDelegate>

@property(nonatomic,strong) MLEmojiLabel *textLabel;

@end


@implementation BubbleTextView


+ (instancetype)BubbleTextView
{
    BubbleTextView *bubbleView = [[self alloc]init];
    return bubbleView;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        self.textLabel = [[MLEmojiLabel alloc]initWithFrame:self.bounds];
        self.textLabel.disableEmoji = NO;
        self.textLabel.userInteractionEnabled = YES;
        self.textLabel.delegate = self;
        self.textLabel.font = Kfont;
        self.textLabel.numberOfLines = 0;
        self.textLabel.lineBreakMode = NSLineBreakByCharWrapping;
        [self addSubview:self.textLabel];
        
        
    }
    return self;
}


- (void)setMessage:(MessageModel *)message
{
    _message = message;
    
    self.textLabel.text = _message.text;
    
//    CGFloat width = [_message.text boundingRectWithSize:CGSizeMake(MAXFLOAT, 35) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:Kfont} context:nil].size.width;
//    if (width<=KMaxWidth) {
//        
//        self.textLabel.frame = CGRectMake(0, 0, width, 30);
//    }else{
//    CGFloat height = [_message.text boundingRectWithSize:CGSizeMake(KMaxWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:Kfont} context:nil].size.height;
//         self.textLabel.frame = CGRectMake(0, 0, KMaxWidth, height);
//    }
    
    

}



- (void)layoutSubviews
{
    [super layoutSubviews];
    self.textLabel.frame = self.bounds;
}



+ (CGSize)BubbleTextViewSize:(MessageModel *)message
{
    
    CGFloat width = [message.text boundingRectWithSize:CGSizeMake(MAXFLOAT, 30) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:Kfont} context:nil].size.width;

    if (width<=KMaxWidth) {
        
        return CGSizeMake(width, 30);
    
    }else{
        CGFloat height = [message.text boundingRectWithSize:CGSizeMake(KMaxWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:Kfont} context:nil].size.height;
        return CGSizeMake(KMaxWidth, height+25);
    }
    return CGSizeZero ;
}



- (void)mlEmojiLabel:(MLEmojiLabel *)emojiLabel didSelectLink:(NSString *)link withType:(MLEmojiLabelLinkType)type
{
    if (_linkSelectDelegate && [_linkSelectDelegate respondsToSelector:@selector(didSelectLink:withType:)]) {
        
        [_linkSelectDelegate didSelectLink:link withType:type];
    }
    
}




@end
