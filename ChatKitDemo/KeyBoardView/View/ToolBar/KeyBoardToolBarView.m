//
//  KeyBoardToolBarView.m
//  KeyBoardView
//
//  Created by 余强 on 16/3/20.
//  Copyright © 2016年 你好，我是余强，一位来自上海的ios开发者，现就职于bdcluster(上海大数聚科技有限公司)。这个工程致力于完成一个优雅的IM实现方案. All rights reserved.
//

#import "KeyBoardToolBarView.h"


@interface KeyBoardToolBarView ()<VoiceReordingDelegate,TextInputDelegate,UITextViewDelegate>

@property(nonatomic,assign) CGFloat textHeight;

@property(nonatomic,assign)NSInteger selectBtnIndex;

@end



@implementation KeyBoardToolBarView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        self.backgroundColor = [UIColor whiteColor];
        
        [self setUpUi];
        
        //最初设定的文本高度
        self.textHeight = KTextHeight;
    
        
        
    }
    return self;
}

- (void)setUpUi
{
    //录音按钮：也是输入类型转化按钮
    self.switchBtn = [[UIButton alloc]init];
    self.switchBtn.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    [self.switchBtn setImage:[NSBundle imageWithBundle:@"chatUiResource" imageName:@"chatBar_record@2x"] forState:UIControlStateNormal];
    [self.switchBtn setImage:[NSBundle imageWithBundle:@"chatUiResource" imageName:@"chatBar_keyboard@2x"] forState:UIControlStateSelected];

    [self.switchBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];

    self.switchBtn.tag = 0;
 

    

    
    
    //更多
    self.moreBtn = [[UIButton alloc]init];
    self.moreBtn.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin;
    [self.moreBtn setImage:[NSBundle imageWithBundle:@"chatUiResource" imageName:@"chatBar_more@2x"] forState:UIControlStateNormal];
    [self.moreBtn setImage:[NSBundle imageWithBundle:@"chatUiResource" imageName:@"chatBar_moreSelected@2x"] forState:UIControlStateHighlighted];
    [self.moreBtn setImage:[NSBundle imageWithBundle:@"chatUiResource" imageName:@"chatBar_keyboard@2x"] forState:UIControlStateSelected];
    [self.moreBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    self.moreBtn.tag = 2;
    
    
    
    
    //表情
    self.emoijBtn = [[UIButton alloc] init];
    self.emoijBtn.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin;
    
    [self.emoijBtn setImage:[NSBundle imageWithBundle:@"chatUiResource" imageName:@"chatBar_face@2x"] forState:UIControlStateNormal];
    [self.emoijBtn setImage:[NSBundle imageWithBundle:@"chatUiResource" imageName:@"chatBar_faceSelected@2x"] forState:UIControlStateHighlighted];
    [self.emoijBtn setImage:[NSBundle imageWithBundle:@"chatUiResource" imageName:@"chatBar_keyboard@2x"] forState:UIControlStateSelected];
    
    [self.emoijBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    self.emoijBtn.tag = 1;
    

    
    // 文字输入框
    self.textView = [[MessageInputView  alloc] init];
    self.textView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    self.textView.delegate = self;
    self.textView.backgroundColor = [UIColor clearColor];
    self.textView.layer.borderColor = [UIColor colorWithWhite:0.8f alpha:1.0f].CGColor;
    self.textView.layer.borderWidth = 0.65f;
    self.textView.layer.cornerRadius = 6.0f;
    self.textView.delegate = self;
    self.textView.tag = 3;
    self.textView.placeholder = @"输入新消息";
    self.textView.returnKeyType = UIReturnKeySend;
    self.textView.font = [UIFont systemFontOfSize:14];
    self.textView.textInputDelegate = self;
    

    
    
    
    //录音
    self.recordBtn = [[VoiceRecordBtn alloc] init];
  //  self.recordBtn.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [self.recordBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.recordBtn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    [self.recordBtn setBackgroundImage:[[NSBundle imageWithBundle:@"chatUiResource" imageName:@"chatBar_recordBg@2x"] stretchableImageWithLeftCapWidth:10 topCapHeight:10] forState:UIControlStateNormal];
      [self.recordBtn setBackgroundImage:[[NSBundle imageWithBundle:@"chatUiResource" imageName:@"chatBar_recordSelectedBg@2x"] stretchableImageWithLeftCapWidth:10 topCapHeight:10] forState:UIControlStateHighlighted];
    self.recordBtn.hidden = YES;
    self.recordBtn.clipsToBounds = YES;
    self.recordBtn.layer.cornerRadius = 6.0f;
    
    self.recordBtn.voiceRecoderDelegate = self;


    
    [self addSubview:self.switchBtn];
    [self addSubview:self.moreBtn];
    [self addSubview:self.emoijBtn];
    [self addSubview:self.textView];
    [self addSubview:self.recordBtn];
    
    
    
    self.layer.borderColor = [[UIColor blackColor] colorWithAlphaComponent:0.1].CGColor;
    self.layer.borderWidth = 1;

    
}



- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.switchBtn.frame = CGRectMake(kHorizontalPadding, self.height0-kVerticalPadding-KTextHeight, KTextHeight, KTextHeight);
    
    
 
    
    self.moreBtn.frame = CGRectMake(CGRectGetWidth(self.bounds)-kHorizontalPadding-KTextHeight, self.height0-kVerticalPadding-KTextHeight, KTextHeight, KTextHeight);
    
    self.emoijBtn.frame = CGRectMake(CGRectGetMinX(self.moreBtn.frame)-kHorizontalPadding-KTextHeight, self.height0-kVerticalPadding-KTextHeight, KTextHeight, KTextHeight);
    
    
    
    self.recordBtn.frame = CGRectMake(CGRectGetMaxX(self.switchBtn.frame)+kHorizontalPadding, self.height0-kVerticalPadding-KTextHeight, CGRectGetMinX(self.emoijBtn.frame)-CGRectGetMaxX(self.switchBtn.frame)-2*kHorizontalPadding, self.height0-2*kVerticalPadding);
    
    
    self.textView.frame = CGRectMake(CGRectGetMaxX(self.switchBtn.frame)+kHorizontalPadding, self.height0-kVerticalPadding-(self.textHeight), CGRectGetMinX(self.emoijBtn.frame)-CGRectGetMaxX(self.switchBtn.frame)-2*kHorizontalPadding, self.height0-2*kVerticalPadding);
   
}




- (void)btnAction:(UIButton *)btn
{
    for (UIView *view in self.subviews) {
        
        if ([view isKindOfClass:[UIButton class]]) {
            
            
            UIButton *otherBtn = (UIButton *)view;
            if (btn == otherBtn) {
                continue;
            }
            otherBtn.selected = NO;
        
        }
    }
    
    NSInteger index = btn.tag;
    btn.selected ^= 1;
    switch (index) {
          
        case KeyBoardTypeVoiceRecoder:
            
            [self setToolBarToNormalState];
            
            break;
        case KeyBoardTypeEmoij:
            
            break;
        case KeyBoardTypeMore:
            
            break;
            
        default:
            break;
    }
    
    _selectBtnIndex = index;
    
    self.recordBtn.hidden = !self.switchBtn.selected;
   
    !btn.selected ? [self.textView becomeFirstResponder] :[self.textView resignFirstResponder];
    
    //toolBar切换，回调外部键盘frame变化
    self.keyBoardFrameChange ? self.keyBoardFrameChange(index,!btn.selected):nil;
    

}




#pragma mark -- text Send delegate
- (void)sendTextMessage:(NSString *)text
{
    if (self.textInputDelegate && [self.textInputDelegate respondsToSelector:@selector(sendTextMessage:)]) {
        
        [self.textInputDelegate sendTextMessage:text];
    }
}




#pragma mark --- textViewDelegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    
    
    if ([text isEqualToString:@"\n"])
    {
       
      
        if (self.textView.textInputDelegate && [self.textView.textInputDelegate respondsToSelector:@selector(sendTextMessage:)]) {
            
            [self.textView.textInputDelegate sendTextMessage:textView.text];
 
        }
        
        [self setToolBarToNormalState];
        
        return NO;
    }
    
    return YES;
}


- (void)textViewDidBeginEditing:(UITextView *)textView
{
    
    self.textHeight = [self getTextViewHeight:textView];
    [self updateFrame:self.textHeight];
    
    
    
     self.keyBoardFrameChange ? self.keyBoardFrameChange(KeyBoardTypeSystem,YES):nil;
}


- (void)textViewDidChange:(UITextView *)textView
{
    self.textHeight = [self getTextViewHeight:textView];
    
  
    if (self.textHeight> KMaxInputViewHeight) {
        
        [self.textView scrollRangeToVisible:NSMakeRange(self.textView.text.length-1, 1)];
    
        return;
    }
    
  
    [self updateFrame:self.textHeight];
 
    
    if (self.textHeight>KTextHeight) {
        [[NSNotificationCenter defaultCenter]postNotificationName:KTextViewHeightChangeNotification object:@(self.textHeight-KTextHeight)];
    }
   
}



- (CGFloat)getTextViewHeight:(UITextView *)textView
{
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0)
    {
        return ceilf([textView sizeThatFits:textView.frame.size].height);
    } else {
        return textView.contentSize.height;
    }
}





//只改变了toolBar的高度，键盘其实高度未变（假象一个）
- (void)updateFrame:(CGFloat)textHeight
{
    self.textHeight = textHeight;

    
    //一行高度：默认高度
    if (self.textHeight <  KTextHeight) {
        self.top0 = 0;
        self.height0 = KeyToolBarHeight;
    }else{
        //多行高度，通过行高度变化增量，改变toolBar的顶点坐标以及高度
        //顶部坐标增量
        self.top0 = KTextHeight -self.textHeight;
        
        //键盘增量
        self.height0 = KeyToolBarHeight+ (textHeight -KTextHeight);
    }
}



/**
 *  @brief 将toolBar设置成44的默认高度状态
 */

//public:emoij消息发送也需要
- (void)setToolBarToNormalState
{
    self.textView.text = nil;
    
    self.textHeight = KTextHeight;
    self.top0 = 0;
    self.height0 = KeyToolBarHeight;
}


#pragma mark -- voice recoder delegate
- (void)setPeakPower:(float)peakPower
{
    _peakPower = peakPower;
    self.recordBtn.peakPower = peakPower;
}



- (void)prepareRecordingVoiceAction
{
    if (_voiceRecoderDelegate && [_voiceRecoderDelegate respondsToSelector:@selector(prepareRecordingVoiceAction)]) {
        [self.voiceRecoderDelegate prepareRecordingVoiceAction];
    }
}

- (void)didStartRecordingVoiceAction
{
    if (_voiceRecoderDelegate && [_voiceRecoderDelegate respondsToSelector:@selector(didStartRecordingVoiceAction)]) {
        [_voiceRecoderDelegate didStartRecordingVoiceAction];
    }
}

- (void)didCancelRecordingVoiceAction
{
    if (_voiceRecoderDelegate && [_voiceRecoderDelegate respondsToSelector:@selector(didCancelRecordingVoiceAction)])
    {
        [_voiceRecoderDelegate didCancelRecordingVoiceAction];
    }
}

- (void)didFinishRecoingVoiceAction
{
    if (_voiceRecoderDelegate && [_voiceRecoderDelegate respondsToSelector:@selector(didFinishRecoingVoiceAction)])
    {
        [_voiceRecoderDelegate didFinishRecoingVoiceAction];
    }
}



- (void)didDragOutsideAction
{
    
    if ([_voiceRecoderDelegate respondsToSelector:@selector(didDragOutsideAction)])
    {
        [_voiceRecoderDelegate didDragOutsideAction];
    }
}

- (void)didDragInsideAction
{
    
    if ([_voiceRecoderDelegate respondsToSelector:@selector(didDragInsideAction)])
    {
        [_voiceRecoderDelegate didDragInsideAction];
    }
}



@end
