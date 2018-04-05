//
//  KeyBoardView.h
//  KeyBoardView
//
//  Created by joy_yu on 16/3/20.

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
