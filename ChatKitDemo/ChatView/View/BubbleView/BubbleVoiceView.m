//
//  BubbleVoiceView.m
//  KeyBoardView
//
//  Created by 余强 on 16/3/21.
//  Copyright © 2016年 你好，我是余强，一位来自上海的ios开发者，现就职于bdcluster(上海大数聚科技有限公司)。这个工程致力于完成一个优雅的IM实现方案.All rights reserved.
//

#import "BubbleVoiceView.h"


@interface BubbleVoiceView ()

@property(nonatomic,strong) UIImageView *voiceImageV;
@property(nonatomic,strong) UILabel *timeDurationLabel;
@property(nonatomic,strong) UIView *readDotView;

@property(nonatomic,strong) NSMutableArray *sendVoiceAnimationArray;
@property(nonatomic,strong) NSMutableArray *receiveVoiceAnimationArray;

@end
@implementation BubbleVoiceView

+ (instancetype)BubbleVoiceView
{
    BubbleVoiceView *bubbleView = [[self alloc]init];
    return bubbleView;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        self.voiceImageV = [[UIImageView alloc]init];
        
        self.voiceImageV.clipsToBounds = YES;
        [self addSubview:self.voiceImageV];
       
    
        
        
        self.timeDurationLabel = [[UILabel alloc]init];
        self.timeDurationLabel.textColor = [UIColor blackColor];
        self.timeDurationLabel.font = [UIFont systemFontOfSize:13];
        self.timeDurationLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.timeDurationLabel];
    
        
        
        self.readDotView = [[UIView alloc]init];
        self.readDotView.backgroundColor = [UIColor redColor];
        self.readDotView.layer.cornerRadius = 4;
        [self addSubview:self.readDotView];
        
        
    }
    return self;
}


- (void)setMessage:(MessageModel *)message
{
    _message = message;

    
    if (_message.isSender) {
        self.voiceImageV.image = [NSBundle imageWithBundle:BundleName imageName:KSendVoiceImageDefault];
        self.voiceImageV.animationImages = self.sendVoiceAnimationArray;
    }else{
        self.voiceImageV.image = [NSBundle imageWithBundle:BundleName imageName:KReceiveVoiceImageDefault];
        self.voiceImageV.animationImages = self.receiveVoiceAnimationArray;
    }
    
    
    if (_message.isRead) {
        self.readDotView.hidden = YES;
    }else{
        self.readDotView.hidden = NO;
    }
    
    self.voiceImageV.animationDuration = 2;
    if (_message.isPlaying) {
        [self.voiceImageV startAnimating];
    }else{
        [self.voiceImageV stopAnimating];
    }
    
    
    CGFloat totalTime = [message.voiceDuration floatValue];
    
    NSInteger min = totalTime/60;
    NSInteger sec = totalTime- 60*min;
    if (min<=0) {
       self.timeDurationLabel.text = [NSString stringWithFormat:@"%ld\''",(NSInteger)totalTime];
    }else{
        
        NSString *duration = [[NSString stringWithFormat:@"%ld\'",min]stringByAppendingString:[NSString stringWithFormat:@"%ld\''",sec]];
        self.timeDurationLabel.text = duration;
    }
    

}



- (void)startPlay
{
    [self.voiceImageV startAnimating];
}


- (void)stopPlay
{
    [self.voiceImageV stopAnimating];
}


- (void)layoutSubviews
{
    [super layoutSubviews];

    
    if (self.message.isSender) {
        self.voiceImageV.frame = CGRectMake(self.width0-20, 5, 15, 20);
         self.timeDurationLabel.frame = CGRectMake(CGRectGetMinX(self.voiceImageV.frame)-35-KLeftMargin, 0, 35, 30);
        self.readDotView.frame = CGRectMake(CGRectGetMaxX(self.frame)-8-8, 0, 8, 8);
    }else{
        
        self.voiceImageV.frame = CGRectMake(0, 5, 15, 20);
        self.timeDurationLabel.frame = CGRectMake(CGRectGetMaxX(self.voiceImageV.frame)+KLeftMargin, 0, 35, 30);
        
        self.readDotView.frame = CGRectMake(CGRectGetMaxX(self.frame)-8-4, 0, 8, 8);
    }
    
    
   
    
}

+ (CGSize)bubbleVoiceWithMessage:(MessageModel *)message
{
    
    CGFloat bubbleWidth = ([message.voiceDuration floatValue]/kVoiceRecorderTotalTime)*(KBubbleVoiceMaxWidth-20-KLeftMargin);
    if (bubbleWidth<=35) {
        bubbleWidth = 35;
    }
    
    return CGSizeMake(bubbleWidth+20, 30);

}


- (NSMutableArray *)sendVoiceAnimationArray
{
    if (_sendVoiceAnimationArray == nil) {
        _sendVoiceAnimationArray = [[NSMutableArray alloc]init];
        for (int i = 0; i<KSendVoiceAnimationArray.count; i++) {
            
            [_sendVoiceAnimationArray addObject:[NSBundle imageWithBundle:BundleName imageName:KSendVoiceAnimationArray[i]]];
        }
    }
    return _sendVoiceAnimationArray;
}


- (NSMutableArray *)receiveVoiceAnimationArray
{
    if (_receiveVoiceAnimationArray == nil) {
        _receiveVoiceAnimationArray = [[NSMutableArray alloc]init];
        for (int i = 0; i<KSendVoiceAnimationArray.count; i++) {
            
            [_receiveVoiceAnimationArray addObject:[NSBundle imageWithBundle:BundleName imageName:KReceiveVoiceAnimationArray[i]]];
        }
    }
    return _receiveVoiceAnimationArray;
}



@end
