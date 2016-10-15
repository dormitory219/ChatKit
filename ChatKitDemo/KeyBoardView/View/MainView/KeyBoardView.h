//
//  KeyBoardView.h
//  KeyBoardView
//
//  Created by 余强 on 16/3/20.
//  Copyright © 2016年 你好，我是余强，一位来自上海的ios开发者，现就职于bdcluster(上海大数聚科技有限公司)。这个工程致力于完成一个优雅的IM实现方案. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "KeyBoardHeader.h"
#import "KeyBoardToolBarView.h"


#import "KeyBoardBottomActivityView.h"
#import "BottomMoreView.h"
#import "BottomEmotionFaceView.h"
#import "EmotionViewDelegate.h"

@interface KeyBoardView : UIView


@property(nonatomic,weak) id<VoiceReordingDelegate> voiceRecoderDelegate;
@property(nonatomic,assign)float peakPower;



@property(nonatomic,weak) id<TextInputDelegate> textInputDelegate;

@property(nonatomic,weak) id<EmotionViewDelegate> emoijViewDelegate;



@property(nonatomic,weak) id<MoreViewDelegate>moreViewDelegate;


@property(nonatomic,assign) BOOL hideKeyBoard;

//键盘变化
@property(nonatomic,assign) CGFloat keyBoardDetalChange;


@end
