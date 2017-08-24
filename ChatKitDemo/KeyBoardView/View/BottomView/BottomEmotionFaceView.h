//
//  BottomEmoijFaceView.h
//  KeyBoardView
//
//  Created by 余强 on 16/3/20.

//

#import <UIKit/UIKit.h>
#import "KeyBoardHeader.h"
#import "EmotionFaceToolBar.h"
#import "EmotionBoardView.h"
#import "EmotionViewDelegate.h"


@interface BottomEmotionFaceView : UIView

@property(nonatomic,weak) id <EmotionViewDelegate>  emotionViewDelegate;

@end
