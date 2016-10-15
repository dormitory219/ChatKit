//
//  VoiceRecordBtn.m
//  KeyBoardView
//
//  Created by 余强 on 16/3/20.
//  Copyright © 2016年 你好，我是余强，一位来自上海的ios开发者，现就职于bdcluster(上海大数聚科技有限公司)。这个工程致力于完成一个优雅的IM实现方案. All rights reserved.
//

#import "VoiceRecordBtn.h"
#import "RecordingHub.h"
#import "KeyBoardHelpDefine.h"


@interface VoiceRecordBtn ()

@property(nonatomic,strong) RecordingHub *recordHub;

@end

@implementation VoiceRecordBtn



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        [self addTarget:self action:@selector(recordButtonTouchDown) forControlEvents:UIControlEventTouchDown];
        [self addTarget:self action:@selector(recordButtonTouchUpOutside) forControlEvents:UIControlEventTouchUpOutside];
        [self addTarget:self action:@selector(recordButtonTouchUpInside) forControlEvents:UIControlEventTouchUpInside];
        [self addTarget:self action:@selector(recordDragOutside) forControlEvents:UIControlEventTouchDragExit];
        [self addTarget:self action:@selector(recordDragInside) forControlEvents:UIControlEventTouchDragEnter];
        
        
        [self setTitle:@"按住说话" forState:UIControlStateNormal];
        [self setTitle:@"松开发送" forState:UIControlStateHighlighted];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        
        
        
        self.recordHub = [[RecordingHub alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-60, SCREEN_HEIGHT/2-60, 120, 120)];
        

    }
    return self;
}




- (void)setPeakPower:(float)peakPower
{
    _peakPower = peakPower;
    self.recordHub.peakPower = peakPower;
}



- (void)recordButtonTouchDown
{
    
    if (_voiceRecoderDelegate && [_voiceRecoderDelegate respondsToSelector:@selector(prepareRecordingVoiceAction)]) {
        [_voiceRecoderDelegate prepareRecordingVoiceAction];
    }
    
    if (_voiceRecoderDelegate && [_voiceRecoderDelegate respondsToSelector:@selector(didStartRecordingVoiceAction)]) {
        [_voiceRecoderDelegate didStartRecordingVoiceAction];
    }
    
    [self.recordHub recordButtonTouchDown];
    
}




- (void)recordButtonTouchUpOutside
{
    if (_voiceRecoderDelegate && [_voiceRecoderDelegate respondsToSelector:@selector(didCancelRecordingVoiceAction)])
    {
        [_voiceRecoderDelegate didCancelRecordingVoiceAction];
    }
    
    [self.recordHub recordButtonTouchUpOutside];
    
    
 
}

- (void)recordButtonTouchUpInside
{

    if ([_voiceRecoderDelegate respondsToSelector:@selector(didFinishRecoingVoiceAction)])
    {
        [_voiceRecoderDelegate didFinishRecoingVoiceAction];
    }
    
    [self.recordHub recordButtonTouchUpInside];
    
    [self.recordHub removeFromSuperview];
}

- (void)recordDragOutside
{
    
    [self.recordHub recordButtonDragOutside];
    if ([_voiceRecoderDelegate respondsToSelector:@selector(didDragOutsideAction)])
    {
        [_voiceRecoderDelegate didDragOutsideAction];
    }
}

- (void)recordDragInside
{
    
    [self.recordHub recordButtonDragInside];
    
    if ([_voiceRecoderDelegate respondsToSelector:@selector(didDragInsideAction)])
    {
        [_voiceRecoderDelegate didDragInsideAction];
    }
}






@end
