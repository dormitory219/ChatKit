//
//  KeyBoardToolBarView.h
//  KeyBoardView
//
//  Created by 余强 on 16/3/20.
//  Copyright © 2016年 你好，我是余强，一位来自上海的ios开发者，现就职于bdcluster(上海大数聚科技有限公司)。这个工程致力于完成一个优雅的IM实现方案，如果您有兴趣，请来到项目交流群：533793277. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KeyBoardHelpDefine.h"
#import "MessageInputView.h"
#import "VoiceRecordBtn.h"
#import "NSBundle+KeyBoardExtension.h"
#import "KeyBoardHeader.h"
@interface KeyBoardToolBarView : UIView




//voiceRecoder
@property(nonatomic,weak) id<VoiceReordingDelegate> voiceRecoderDelegate;

@property(nonatomic,assign)float peakPower;


//inputText
@property(nonatomic,weak) id<TextInputDelegate> textInputDelegate;





/**
 *  @brief textHeightDetal 文本多行高度变化增量，调整外部keyBoard高度：该参数只用于index = -1时候
 */
@property(nonatomic,copy) void(^keyBoardFrameChange)(NSInteger index,BOOL isInput);





@property(nonatomic,strong) UIButton *switchBtn;
@property(nonatomic,strong) VoiceRecordBtn *recordBtn;

@property(nonatomic,strong) UIButton *emoijBtn;
@property(nonatomic,strong) MessageInputView *textView;
@property(nonatomic,strong) UIButton *moreBtn;



//Public：emoij表情输入时公开调用
- (void)textViewDidChange:(UITextView *)textView;


//public:emoij消息发送也需要:
/**
 *  @brief 将toolBar设置成44的默认高度状态
 */
- (void)setToolBarToNormalState;
@end
