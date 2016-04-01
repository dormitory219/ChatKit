//
//  ZFPlayerView.h
//  Player
//
//  Created by 任子丰 on 16/3/3.
//  Copyright © 2016年 任子丰. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ZFPlayerGoBackBlock)(void);

@interface ZFPlayerView : UIView

/** 视频URL */
@property (nonatomic, strong) NSURL *videoURL;
/** 返回按钮Block */
@property (nonatomic, copy) ZFPlayerGoBackBlock goBackBlock;
/**
 *  取消延时隐藏maskView的方法,在ViewController的delloc方法中调用
 *  用于解决：刚打开视频播放器，就关闭该页面，maskView的延时隐藏还未执行。
 */
- (void)cancelAutoFadeOutControlBar;

/** 类方法创建，该方法适用于代码创建View */
+ (instancetype)setupZFPlayer;

@end
