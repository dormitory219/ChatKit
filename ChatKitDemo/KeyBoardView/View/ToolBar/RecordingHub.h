//
//  RecordingShowView.h
//  KeyBoardView
//
//  Created by joy_yu on 16/3/20.

//

#import <UIKit/UIKit.h>

@interface RecordingHub : UIView


// 录音按钮按下
-(void)recordButtonTouchDown;

// 手指在录音按钮内部时离开
-(void)recordButtonTouchUpInside;

// 手指在录音按钮外部时离开
-(void)recordButtonTouchUpOutside;

// 手指移动到录音按钮内部
-(void)recordButtonDragInside;

// 手指移动到录音按钮外部
-(void)recordButtonDragOutside;


@property(nonatomic,assign)float peakPower;

@end
