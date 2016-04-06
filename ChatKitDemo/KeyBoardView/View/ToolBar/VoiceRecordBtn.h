//
//  VoiceRecordBtn.h
//  KeyBoardView
//
//  Created by 余强 on 16/3/20.
//  Copyright © 2016年 你好，我是余强，一位来自上海的ios开发者，现就职于bdcluster(上海大数聚科技有限公司)。这个工程致力于完成一个优雅的IM实现方案，如果您有兴趣，请来到项目交流群：533793277. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol VoiceReordingDelegate <NSObject>


- (void)prepareRecordingVoiceAction;
/**
 *  开始录音
 */
- (void)didStartRecordingVoiceAction;
/**
 *  手指向上滑动取消录音
 */
- (void)didCancelRecordingVoiceAction;
/**
 *  松开手指完成录音
 */
- (void)didFinishRecoingVoiceAction;
/**
 *  当手指离开按钮的范围内时
 */
- (void)didDragOutsideAction;
/**
 *  当手指再次进入按钮的范围内时
 */
- (void)didDragInsideAction;


@end


@interface VoiceRecordBtn : UIButton

@property(nonatomic,weak) id<VoiceReordingDelegate> voiceRecoderDelegate;
@property(nonatomic,assign)float peakPower;

@end
