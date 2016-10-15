//
//  RecordingShowView.h
//  KeyBoardView
//
//  Created by 余强 on 16/3/20.
//  Copyright © 2016年 你好，我是余强，一位来自上海的ios开发者，现就职于bdcluster(上海大数聚科技有限公司)。这个工程致力于完成一个优雅的IM实现方案. All rights reserved.
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
